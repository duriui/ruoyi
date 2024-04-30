package com.ruoyi.system.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;
import javax.annotation.PostConstruct;

import com.alibaba.fastjson.JSON;
import com.ruoyi.system.domain.SysDataDemo;
import com.ruoyi.system.domain.SysDataDetails;
import com.ruoyi.system.mapper.SysDataDemoMapper;
import com.ruoyi.system.mapper.SysDataMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.mapper.SysConfigMapper;
import com.ruoyi.system.service.ISysConfigService;
import org.apache.commons.beanutils.BeanUtils;

import static com.ruoyi.common.utils.StringUtils.isNotEmpty;

/**
 * 参数配置 服务层实现
 * 
 * @author ruoyi
 */
@Service
public class SysConfigServiceImpl implements ISysConfigService
{
    @Autowired
    private SysConfigMapper configMapper;

    @Autowired
    private SysDataMapper sysDataMapper;

    @Autowired
    private SysDataDemoMapper sysDataDemoMapper;

    @Autowired
    private RedisCache redisCache;

    /**
     * 项目启动时，初始化参数到缓存
     */
    @PostConstruct
    public void init()
    {
        loadingConfigCache();
    }

    /**
     * 查询参数配置信息
     * 
     * @param configId 参数配置ID
     * @return 参数配置信息
     */
    @Override
    @DataSource(DataSourceType.MASTER)
    public SysConfig selectConfigById(Long configId)
    {
        SysConfig config = new SysConfig();
        config.setConfigId(configId);
        return configMapper.selectConfig(config);
    }

    /**
     * 根据键名查询参数配置信息
     * 
     * @param configKey 参数key
     * @return 参数键值
     */
    @Override
    public String selectConfigByKey(String configKey)
    {
        String configValue = Convert.toStr(redisCache.getCacheObject(getCacheKey(configKey)));
        if (isNotEmpty(configValue))
        {
            return configValue;
        }
        SysConfig config = new SysConfig();
        config.setConfigKey(configKey);
        SysConfig retConfig = configMapper.selectConfig(config);
        if (StringUtils.isNotNull(retConfig))
        {
            redisCache.setCacheObject(getCacheKey(configKey), retConfig.getConfigValue());
            return retConfig.getConfigValue();
        }
        return StringUtils.EMPTY;
    }

    /**
     * 获取验证码开关
     * 
     * @return true开启，false关闭
     */
    @Override
    public boolean selectCaptchaEnabled()
    {
        String captchaEnabled = selectConfigByKey("sys.account.captchaEnabled");
        if (StringUtils.isEmpty(captchaEnabled))
        {
            return true;
        }
        return Convert.toBool(captchaEnabled);
    }

    /**
     * 查询参数配置列表
     * 
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    @Override
    public List<SysConfig> selectConfigList(SysConfig config)
    {
        return configMapper.selectConfigList(config);
    }

    /**
     * 新增参数配置
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public int insertConfig(SysConfig config)
    {
        int row = configMapper.insertConfig(config);
        if (row > 0)
        {
            redisCache.setCacheObject(getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
        return row;
    }

    /**
     * 修改参数配置
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public int updateConfig(SysConfig config)
    {
        SysConfig temp = configMapper.selectConfigById(config.getConfigId());
        if (!StringUtils.equals(temp.getConfigKey(), config.getConfigKey()))
        {
            redisCache.deleteObject(getCacheKey(temp.getConfigKey()));
        }

        int row = configMapper.updateConfig(config);
        if (row > 0)
        {
            redisCache.setCacheObject(getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
        return row;
    }

    /**
     * 批量删除参数信息
     * 
     * @param configIds 需要删除的参数ID
     */
    @Override
    public void deleteConfigByIds(Long[] configIds)
    {
        for (Long configId : configIds)
        {
            SysConfig config = selectConfigById(configId);
            configMapper.deleteConfigById(configId);
            redisCache.deleteObject(getCacheKey(config.getConfigKey()));
        }
    }

    /**
     * 加载参数缓存数据
     */
    @Override
    public void loadingConfigCache()
    {
        List<SysConfig> configsList = configMapper.selectConfigList(new SysConfig());
        for (SysConfig config : configsList)
        {
            redisCache.setCacheObject(getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
    }

    /**
     * 清空参数缓存数据
     */
    @Override
    public void clearConfigCache()
    {
        Collection<String> keys = redisCache.keys(CacheConstants.SYS_CONFIG_KEY + "*");
        redisCache.deleteObject(keys);
    }

    /**
     * 重置参数缓存数据
     */
    @Override
    public void resetConfigCache()
    {
        clearConfigCache();
        loadingConfigCache();
    }

    /**
     * 校验参数键名是否唯一
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public boolean checkConfigKeyUnique(SysConfig config)
    {
        Long configId = StringUtils.isNull(config.getConfigId()) ? -1L : config.getConfigId();
        SysConfig info = configMapper.checkConfigKeyUnique(config.getConfigKey());
        if (StringUtils.isNotNull(info) && info.getConfigId().longValue() != configId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 查看数据详情
     *
     * @param configId 参数信息
     * @return 结果
     */
    @Override
    public  List<SysDataDetails> selectDataDetailById(Long configId) {
        SysConfig sysConfig = configMapper.selectConfigById(configId);
        List<SysDataDetails> sysDataDetails = JSON.parseArray(sysConfig.getSysDataDetails(), SysDataDetails.class);

        // 假设SysDataDetail类的属性名称为column1, column2, ..., column20
        String[] columnNames = {"colum1", "colum2", "colum3", "colum4", "colum5", "colum6", "colum7", "colum8", "colum9", "colum10", "colum11", "colum12", "colum13", "colum14", "colum15", "colum16", "colum17", "colum18", "colum19", "colum20"};
        String[] dataNames = {"data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "data10", "data11", "data12", "data13", "data14", "data15", "data16", "data17", "data18", "data19", "data20"};
        Map<String, String> nonEmptyColumns = new HashMap<>();
        Map<String, String> nonEmptyDatas = new HashMap<>();
        for (SysDataDetails sysDataDetail : sysDataDetails) {
            for (int i = 0; i < columnNames.length; i++) {
                String columnName = columnNames[i];
                String fieldValue = null;
                try {
                    // 假设字段的getter方法名为"getColumnX"，这里使用反射获取值
                    Method getterMethod = sysDataDetail.getClass().getMethod("get" + columnName.substring(0, 1).toUpperCase() + columnName.substring(1));
                    fieldValue = (String) getterMethod.invoke(sysDataDetail);
                } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                    // 处理异常，可能的日志记录或其他错误处理
                    e.printStackTrace();
                }
                if (!StringUtils.isEmpty(fieldValue)) {
                    nonEmptyColumns.put(columnName, fieldValue);
                }
            }
            for (int i = 0; i < columnNames.length; i++) {
                String data = dataNames[i];
                String fieldValue = null;
                try {
                    // 假设字段的getter方法名为"getColumnX"，这里使用反射获取值
                    Method getterMethod = sysDataDetail.getClass().getMethod("get" + data.substring(0, 1).toUpperCase() + data.substring(1));
                    fieldValue = (String) getterMethod.invoke(sysDataDetail);
                } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                    // 处理异常，可能的日志记录或其他错误处理
                    e.printStackTrace();
                }
                if (!StringUtils.isEmpty(fieldValue)) {
                    nonEmptyDatas.put(data, fieldValue);
                }
            }
        }
        return sysDataDetails;
    }

    @Override
    public int insertData(SysConfig config) {
        SysDataDetails sysDataDetails = new SysDataDetails();
        try {
            BeanUtils.copyProperties(sysDataDetails, config);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
        return sysDataMapper.insert(sysDataDetails);
    }

    @Override
    public int insertSysData(SysDataDemo sysData) {
        return sysDataDemoMapper.insert(sysData);
    }

    /**
     * 设置cache key
     * 
     * @param configKey 参数键
     * @return 缓存键key
     */
    private String getCacheKey(String configKey)
    {
        return CacheConstants.SYS_CONFIG_KEY + configKey;
    }
}
