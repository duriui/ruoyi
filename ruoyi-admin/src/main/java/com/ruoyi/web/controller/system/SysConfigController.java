package com.ruoyi.web.controller.system;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.ruoyi.system.domain.SysDataDemo;
import com.ruoyi.system.domain.SysDataDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.ISysConfigService;

//TODO: 1、新增一种数据模板，需要输入数据名称、所需要的列名
//TODO: 2、修改一种数据模板，需要输入数据名称、列名
//TODO: 3、新增一条数据，根据列名弹出一个输入界面，输入数据，保存数据
//TODO: 4、修改一条数据，根据列名弹出一个输入界面，输入数据，保存数据
//TODO: 5、删除一条数据，根据列名弹出一个确认界面，确认是否删除，确认后删除数据

/**
 * 参数配置 信息操作处理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/config")
public class SysConfigController extends BaseController
{
    @Autowired
    private ISysConfigService configService;

    /**
     * 获取参数配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:config:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysConfig config)
    {
        startPage();
        List<SysConfig> list = configService.selectConfigList(config);
        return getDataTable(list);
    }

    @Log(title = "参数管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('system:config:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysConfig config)
    {
        List<SysConfig> list = configService.selectConfigList(config);
        ExcelUtil<SysConfig> util = new ExcelUtil<SysConfig>(SysConfig.class);
        util.exportExcel(response, list, "参数数据");
    }

    /**
     * 根据参数编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:config:query')")
    @GetMapping(value = "/{configId}")
    public AjaxResult getInfo(@PathVariable Long configId)
    {
        return success(configService.selectConfigById(configId));
    }

    /**
     * 根据参数键名查询参数值
     */
    @GetMapping(value = "/configKey/{configKey}")
    public AjaxResult getConfigKey(@PathVariable String configKey)
    {
        return success(configService.selectConfigByKey(configKey));
    }

    /**
     * 根据参数id查询数据详情
     */
    @GetMapping(value = "/dataDetail/{configId}")
    public AjaxResult getDataDetail(@PathVariable Long configId)
    {
        return success(configService.selectDataDetailById(configId));
    }

    /**
     * 新增参数配置
     */
    @PreAuthorize("@ss.hasPermi('system:config:add')")
    @Log(title = "参数管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysConfig config)
    {
        if (!configService.checkConfigKeyUnique(config))
        {
            return error("新增参数'" + config.getConfigName() + "'失败，参数键名已存在");
        }
        config.setCreateBy(getUsername());
        return toAjax(configService.insertData(config));
    }


    /**
     * 根据id返回用户
     */
    @GetMapping("/name/{configId}")
    public AjaxResult getName(@PathVariable Long configId)
    {
        if(configId ==null){
            return error("传入的参数无效");
        }
        SysConfig sysConfig = configService.selectConfigById(configId);
        if(sysConfig == null){
            return error("无该用户");
        }
        SysDataDetails sysDataDetails = new SysDataDetails();
        sysDataDetails.setConfig_id(configId);
        return success(sysDataDetails);
    }

    /**
     * 新增一条数据
     */
    @PreAuthorize("@ss.hasPermi('system:config:add')")
    @Log(title = "参数管理", businessType = BusinessType.INSERT)
    @PostMapping("addOne")
    public AjaxResult addNewData(@Validated @RequestBody SysDataDetails sysDataDetails)
    {
        SysConfig config = configService.selectConfigById(sysDataDetails.getConfig_id());
        config.setUpdateBy(getUsername());

        List<SysDataDetails> sysDataDetailsOld = JSON.parseArray(config.getSysDataDetails(), SysDataDetails.class);
        if(sysDataDetailsOld == null || sysDataDetailsOld.size() == 0){
            ArrayList<SysDataDetails> sysDataDetailsNew = new ArrayList<SysDataDetails>();
            sysDataDetailsNew.add(sysDataDetails);
            config.setSysDataDetails(JSON.toJSONString(sysDataDetailsNew));
        }else{
            sysDataDetailsOld.add(sysDataDetails);
            config.setSysDataDetails(JSON.toJSONString(sysDataDetailsOld));
        }
        return toAjax(configService.updateConfig(config));
    }

    /**
     * 新增一种数据
     */
    @PreAuthorize("@ss.hasPermi('system:config:add')")
    @Log(title = "参数管理", businessType = BusinessType.INSERT)
    @PostMapping("add")
    public AjaxResult addData(@Validated @RequestBody SysDataDemo sysData)
    {
        SysConfig sysConfig = new SysConfig();
        sysConfig.setUpdateBy(getUsername());
        sysConfig.setCreateBy(getUsername());

        sysConfig.setConfigName(sysData.getDataName());
        return toAjax(configService.insertConfig(sysConfig));
    }

    /**
     * 新增一种数据模板
     */
    @PreAuthorize("@ss.hasPermi('system:config:add')")
    @Log(title = "参数管理", businessType = BusinessType.INSERT)
    @PostMapping("addDataDemo")
    public AjaxResult addDataDemo(@Validated @RequestBody SysDataDemo sysData)
    {
        if(null == sysData.getDataName() || "".equals(sysData.getDataName())){
            return AjaxResult.error("数据名称不能为空");
        }
        sysData.setCreateBy(getUsername());
        sysData.setUpdateBy(getUsername());
        sysData.setCreateTime(LocalDateTime.now().toString());
        sysData.setUpdateTime(LocalDateTime.now().toString());
        return toAjax(configService.insertSysData(sysData));
    }

    /**
     * 修改参数配置
     */
    @PreAuthorize("@ss.hasPermi('system:config:edit')")
    @Log(title = "参数管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysConfig config)
    {
//        if (!configService.checkConfigKeyUnique(config))
//        {
//            return error("修改参数'" + config.getConfigName() + "'失败，参数键名已存在");
//        }
        config.setUpdateBy(getUsername());
        return toAjax(configService.updateConfig(config));
    }

    /**
     * 删除参数配置
     */
    @PreAuthorize("@ss.hasPermi('system:config:remove')")
    @Log(title = "参数管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{configIds}")
    public AjaxResult remove(@PathVariable Long[] configIds)
    {
        configService.deleteConfigByIds(configIds);
        return success();
    }

    /**
     * 刷新参数缓存
     */
    @PreAuthorize("@ss.hasPermi('system:config:remove')")
    @Log(title = "参数管理", businessType = BusinessType.CLEAN)
    @DeleteMapping("/refreshCache")
    public AjaxResult refreshCache()
    {
        configService.resetConfigCache();
        return success();
    }
}
