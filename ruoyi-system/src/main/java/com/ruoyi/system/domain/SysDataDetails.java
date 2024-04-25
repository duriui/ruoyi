package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

/**
 * @Description: 数据详情表 sys_config_details
 * @Author: DR
 * @Date: 2024/4/3 15:24
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("sys_data_details")
public class SysDataDetails  {
    /** 主键 */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 参数ID */
    private Long config_id;

    private String colum1;
    private String colum2;
    private String colum3;
    private String colum4;
    private String colum5;
    private String colum6;
    private String colum7;
    private String colum8;
    private String colum9;
    private String colum10;
    private String colum11;
    private String colum12;
    private String colum13;
    private String colum14;
    private String colum15;
    private String colum16;
    private String colum17;
    private String colum18;
    private String colum19;
    private String colum20;

    @Excel(name = "数据列")
    private String data1;
    @Excel(name = "数据列")
    private String data2;
    @Excel(name = "数据列")
    private String data3;
    @Excel(name = "数据列")
    private String data4;
    @Excel(name = "数据列")
    private String data5;
    @Excel(name = "数据列")
    private String data6;
    @Excel(name = "数据列")
    private String data7;
    @Excel(name = "数据列")
    private String data8;
    @Excel(name = "数据列")
    private String data9;
    @Excel(name = "数据列")
    private String data10;
    @Excel(name = "数据列")
    private String data11;
    @Excel(name = "数据列")
    private String data12;
    @Excel(name = "数据列")
    private String data13;
    @Excel(name = "数据列")
    private String data14;
    @Excel(name = "数据列")
    private String data15;
    @Excel(name = "数据列")
    private String data16;
    @Excel(name = "数据列")
    private String data17;
    @Excel(name = "数据列")
    private String data18;
    @Excel(name = "数据列")
    private String data19;
    @Excel(name = "数据列")
    private String data20;

}
