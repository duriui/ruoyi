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
    public  HashMap<Integer, HashMap<String, String>> selectDataDetailById(Long configId) {
        List<SysDataDetails> sysDataDetails = sysDataMapper.selectDataDetailById(configId);
        HashMap<Integer, HashMap<String, String>> resMap = new HashMap<>();
        int count = 0;
        for (SysDataDetails sysDataDetail : sysDataDetails) {
            HashMap<String, String> data = new HashMap<>();
            if(null != sysDataDetail.getData1() && !"".equals(sysDataDetail.getData1())){
                data.put("data1",sysDataDetail.getData1());
            }
            if(null != sysDataDetail.getData2() && !"".equals(sysDataDetail.getData2())) {
                data.put("data2", sysDataDetail.getData2());
            }
            if(null != sysDataDetail.getData3() && !"".equals(sysDataDetail.getData3())) {
                data.put("data3", sysDataDetail.getData3());
            }
            if(null != sysDataDetail.getData4() && !"".equals(sysDataDetail.getData4())) {
                data.put("data4", sysDataDetail.getData4());
            }
            if(null != sysDataDetail.getData5() && !"".equals(sysDataDetail.getData5())) {
                data.put("data5", sysDataDetail.getData5());
            }
            if(null != sysDataDetail.getData6() && !"".equals(sysDataDetail.getData6())) {
                data.put("data6", sysDataDetail.getData6());
            }
            if(null != sysDataDetail.getData7() && !"".equals(sysDataDetail.getData7())) {
                data.put("data7", sysDataDetail.getData7());
            }
            if(null != sysDataDetail.getData8() && !"".equals(sysDataDetail.getData8())) {
                data.put("data8", sysDataDetail.getData8());
            }
            if(null != sysDataDetail.getData9() && !"".equals(sysDataDetail.getData9())) {
                data.put("data9", sysDataDetail.getData9());
            }
            if(null != sysDataDetail.getData10() && !"".equals(sysDataDetail.getData10())) {
                data.put("data10", sysDataDetail.getData10());
            }
            if(null != sysDataDetail.getData11() && !"".equals(sysDataDetail.getData11())) {
                data.put("data11", sysDataDetail.getData11());
            }
            if(null != sysDataDetail.getData12() && !"".equals(sysDataDetail.getData12())) {
                data.put("data12", sysDataDetail.getData12());
            }
            if(null != sysDataDetail.getData13() && !"".equals(sysDataDetail.getData13())) {
                data.put("data13", sysDataDetail.getData13());
            }
            if(null != sysDataDetail.getData14() && !"".equals(sysDataDetail.getData14())) {
                data.put("data14", sysDataDetail.getData14());
            }
            if(null != sysDataDetail.getData15() && !"".equals(sysDataDetail.getData15())) {
                data.put("data15", sysDataDetail.getData15());
            }
            if(null != sysDataDetail.getData16() && !"".equals(sysDataDetail.getData16())) {
                data.put("data16", sysDataDetail.getData16());
            }
            if(null != sysDataDetail.getData17() && !"".equals(sysDataDetail.getData17())) {
                data.put("data17", sysDataDetail.getData17());
            }
            if(null != sysDataDetail.getData18() && !"".equals(sysDataDetail.getData18())) {
                data.put("data18", sysDataDetail.getData18());
            }
            if(null != sysDataDetail.getData19() && !"".equals(sysDataDetail.getData19())) {
                data.put("data19", sysDataDetail.getData19());
            }
            if(null != sysDataDetail.getData20() && !"".equals(sysDataDetail.getData20())) {
                data.put("data20", sysDataDetail.getData20());
            }
            resMap.put(count++,data);
        }

        return resMap;
    }

    @Override
    public int insertData(SysConfig config) {
        return  configMapper.insertConfig(config);
    }

    @Override
    public int insertSysData(SysDataDemo sysData) {
        return sysDataDemoMapper.insert(sysData);
    }

    @Override
    public HashMap<String, String> selectDataById(Long configId) {
        SysConfig sysConfig = configMapper.selectDataById(configId);
        if(sysConfig == null){
            return new HashMap<String, String>();
        }
        HashMap<String, String> columns = new HashMap<>();
        if(null != sysConfig.getColumn1() && !"".equals(sysConfig.getColumn1())){
            columns.put("column1",sysConfig.getColumn1());
        }
        if(null != sysConfig.getColumn2() && !"".equals(sysConfig.getColumn2())){
            columns.put("column2",sysConfig.getColumn2());
        }
        if(null != sysConfig.getColumn3() && !"".equals(sysConfig.getColumn3())){
            columns.put("column3",sysConfig.getColumn3());
        }
        if(null != sysConfig.getColumn4() && !"".equals(sysConfig.getColumn4())){
            columns.put("column4",sysConfig.getColumn4());
        }
        if(null != sysConfig.getColumn5() && !"".equals(sysConfig.getColumn5())){
            columns.put("column5",sysConfig.getColumn5());
        }
        if(null != sysConfig.getColumn6() && !"".equals(sysConfig.getColumn6())){
            columns.put("column6",sysConfig.getColumn6());
        }
        if(null != sysConfig.getColumn7() && !"".equals(sysConfig.getColumn7())){
            columns.put("column7",sysConfig.getColumn7());
        }
        if(null != sysConfig.getColumn8() && !"".equals(sysConfig.getColumn8())){
            columns.put("column8",sysConfig.getColumn8());
        }
        if(null != sysConfig.getColumn9() && !"".equals(sysConfig.getColumn9())){
            columns.put("column9",sysConfig.getColumn9());
        }
        if(null != sysConfig.getColumn10() && !"".equals(sysConfig.getColumn10())){
            columns.put("column10",sysConfig.getColumn10());
        }
        if(null != sysConfig.getColumn11() && !"".equals(sysConfig.getColumn11())) {
            columns.put("column11", sysConfig.getColumn11());
        }
        if(null != sysConfig.getColumn12() && !"".equals(sysConfig.getColumn12())){
            columns.put("column12",sysConfig.getColumn12());
        }
        if(null != sysConfig.getColumn13() && !"".equals(sysConfig.getColumn13())){
            columns.put("column13",sysConfig.getColumn13());
        }
        if(null != sysConfig.getColumn14() && !"".equals(sysConfig.getColumn14())){
            columns.put("column14",sysConfig.getColumn14());
        }
        if(null != sysConfig.getColumn15() && !"".equals(sysConfig.getColumn15())){
            columns.put("column15",sysConfig.getColumn15());
        }
        if(null != sysConfig.getColumn16() && !"".equals(sysConfig.getColumn16())){
            columns.put("column16",sysConfig.getColumn16());
        }
        if(null != sysConfig.getColumn17() && !"".equals(sysConfig.getColumn17())){
            columns.put("column17",sysConfig.getColumn17());
        }
        if(null != sysConfig.getColumn18() && !"".equals(sysConfig.getColumn18())){
            columns.put("column18",sysConfig.getColumn18());
        }
        if(null != sysConfig.getColumn19() && !"".equals(sysConfig.getColumn19())){
            columns.put("column19",sysConfig.getColumn19());
        }
        if(null != sysConfig.getColumn20() && !"".equals(sysConfig.getColumn20())){
            columns.put("column20",sysConfig.getColumn20());
        }
        return columns;
    }

    @Override
    public int insertDataDetail(SysDataDetails sysDataDetails) {
        return sysDataMapper.insertData(sysDataDetails);
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
