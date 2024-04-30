package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("sys_data_demo")
public class SysDataDemo {

    /** 主键 */
    @TableId(type = IdType.AUTO)
    private Long id;

    private String createBy;

    private String createTime;

    private String updateBy;

    private String updateTime;

    private String dataName;

    private String column1;

    private String column2;

    private String column3;

    private String column4;

    private String column5;

    private String column6;

    private String column7;

    private String column8;

    private String column9;

    private String column10;

    private String column11;

    private String column12;

    private String column13;

    private String column14;

    private String column15;

    private String column16;

    private String column17;

    private String column18;

    private String column19;

    private String column20;
//
//    private String data1;
//
//    private String data2;
//
//    private String data3;
//
//    private String data4;
//
//    private String data5;
//
//    private String data6;
//
//    private String data7;
//
//    private String data8;
//
//    private String data9;
//
//    private String data10;
//
//    private String data11;
//
//    private String data12;
//
//    private String data13;
//
//    private String data14;
//
//    private String data15;
//
//    private String data16;
//
//    private String data17;
//
//    private String data18;
//
//    private String data19;
//
//    private String data20;


}
