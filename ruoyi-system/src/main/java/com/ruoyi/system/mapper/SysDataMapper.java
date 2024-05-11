package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysDataDetails;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SysDataMapper  {

    @Select("select * from sys_data_details where config_id = #{configId}")
    List<SysDataDetails> selectDataDetailById(Long configId);


    int insertData(SysDataDetails sysDataDetails);

    @Delete("delete from sys_data_details where id = #{id}")
    void deleteDataById(Long id);

    @Select("select * from sys_data_details where id = #{id}")
    SysDataDetails selectDataById(Long id);

    int updateData(SysDataDetails sysDataDetails);
}
