package com.ruoyi.system.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.List;
import javax.annotation.PostConstruct;

import com.ruoyi.system.domain.SysDataDetails;
import com.ruoyi.system.domain.vo.SysDataDetailVo;
import com.ruoyi.system.mapper.SysDataMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.mapper.SysConfigMapper;
import com.ruoyi.system.service.ISysConfigService;
import org.apache.commons.beanutils.BeanUtils;

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
        if (StringUtils.isNotEmpty(configValue))
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
            if (StringUtils.equals(UserConstants.YES, config.getConfigType()))
            {
                throw new ServiceException(String.format("内置参数【%1$s】不能删除 ", config.getConfigKey()));
            }
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
    public SysDataDetailVo selectDataDetailById(Long configId) {
        SysConfig sysConfig = configMapper.selectConfigById(configId);
        SysDataDetailVo sysDataDetailVo = new SysDataDetailVo();
        if(StringUtils.isNotEmpty(sysConfig.getConfigName())){
            sysDataDetailVo.setConfigName(sysConfig.getConfigName());
        }
//        if(StringUtils.isNotEmpty(sysConfig.getSysDataDetails().) && StringUtils.isNotNull(sysConfig.getColum1())){
//            sysDataDetailVo.setColum1(sysConfig.getColum1());
//            sysDataDetailVo.setData1(sysConfig.getData1());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum2()) && StringUtils.isNotNull(sysConfig.getColum2())){
//            sysDataDetailVo.setColum2(sysConfig.getColum2());
//            sysDataDetailVo.setData2(sysConfig.getData2());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum3()) && StringUtils.isNotNull(sysConfig.getColum3())){
//            sysDataDetailVo.setColum3(sysConfig.getColum3());
//            sysDataDetailVo.setData3(sysConfig.getData3());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum4()) && StringUtils.isNotNull(sysConfig.getColum4())){
//            sysDataDetailVo.setColum4(sysConfig.getColum4());
//            sysDataDetailVo.setData4(sysConfig.getData4());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum5()) && StringUtils.isNotNull(sysConfig.getColum5())){
//            sysDataDetailVo.setColum5(sysConfig.getColum5());
//            sysDataDetailVo.setData5(sysConfig.getData5());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum6()) && StringUtils.isNotNull(sysConfig.getColum6())){
//            sysDataDetailVo.setColum6(sysConfig.getColum6());
//            sysDataDetailVo.setData6(sysConfig.getData6());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum7()) && StringUtils.isNotNull(sysConfig.getColum7())){
//            sysDataDetailVo.setColum7(sysConfig.getColum7());
//            sysDataDetailVo.setData7(sysConfig.getData7());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum8()) && StringUtils.isNotNull(sysConfig.getColum8())){
//            sysDataDetailVo.setColum8(sysConfig.getColum8());
//            sysDataDetailVo.setData8(sysConfig.getData8());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum9()) && StringUtils.isNotNull(sysConfig.getColum9())){
//            sysDataDetailVo.setColum9(sysConfig.getColum9());
//            sysDataDetailVo.setData9(sysConfig.getData9());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum10()) && StringUtils.isNotNull(sysConfig.getColum10())){
//            sysDataDetailVo.setColum10(sysConfig.getColum10());
//            sysDataDetailVo.setData10(sysConfig.getData10());
//        }
//        //TODO:
//        if(StringUtils.isNotEmpty(sysConfig.getColum11()) && StringUtils.isNotNull(sysConfig.getColum11())){
//            sysDataDetailVo.setColum11(sysConfig.getColum11());
//            sysDataDetailVo.setData11(sysConfig.getData11());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum12()) && StringUtils.isNotNull(sysConfig.getColum12())){
//            sysDataDetailVo.setColum12(sysConfig.getColum12());
//            sysDataDetailVo.setData12(sysConfig.getData12());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum13()) && StringUtils.isNotNull(sysConfig.getColum13())){
//            sysDataDetailVo.setColum13(sysConfig.getColum13());
//            sysDataDetailVo.setData13(sysConfig.getData13());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum14()) && StringUtils.isNotNull(sysConfig.getColum14())){
//            sysDataDetailVo.setColum14(sysConfig.getColum14());
//            sysDataDetailVo.setData14(sysConfig.getData14());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum15()) && StringUtils.isNotNull(sysConfig.getColum15())){
//            sysDataDetailVo.setColum15(sysConfig.getColum15());
//            sysDataDetailVo.setData15(sysConfig.getData15());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum16()) && StringUtils.isNotNull(sysConfig.getColum16())){
//            sysDataDetailVo.setColum16(sysConfig.getColum16());
//            sysDataDetailVo.setData16(sysConfig.getData16());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum17()) && StringUtils.isNotNull(sysConfig.getColum17())){
//            sysDataDetailVo.setColum17(sysConfig.getColum17());
//            sysDataDetailVo.setData17(sysConfig.getData17());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum18()) && StringUtils.isNotNull(sysConfig.getColum18())){
//            sysDataDetailVo.setColum18(sysConfig.getColum18());
//            sysDataDetailVo.setData18(sysConfig.getData18());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum19()) && StringUtils.isNotNull(sysConfig.getColum19())){
//            sysDataDetailVo.setColum19(sysConfig.getColum19());
//            sysDataDetailVo.setData19(sysConfig.getData19());
//        }
//        if(StringUtils.isNotEmpty(sysConfig.getColum20()) && StringUtils.isNotNull(sysConfig.getColum20())){
//            sysDataDetailVo.setColum20(sysConfig.getColum20());
//            sysDataDetailVo.setData20(sysConfig.getData20());
//        }
        return sysDataDetailVo;
    }

    @Override
    public int insertData(SysConfig config) {
        SysDataDetails sysDataDetails = new SysDataDetails();
        try {
            BeanUtils.copyProperties(sysDataDetails, config);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }

        System.out.println(sysDataDetails.toString());
        return sysDataMapper.insert(sysDataDetails);
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
