package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysDataDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SysDataMapper  {

    @Select("select * from sys_data_details where config_id = #{configId}")
    List<SysDataDetails> selectDataDetailById(Long configId);


    int insertData(SysDataDetails sysDataDetails);
}
