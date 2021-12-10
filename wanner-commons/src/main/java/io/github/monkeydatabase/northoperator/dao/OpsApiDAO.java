package io.github.monkeydatabase.northoperator.dao;

import io.github.monkeydatabase.northoperator.domain.OpsApiDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OpsApiDAO {
    @Select("select * from ops_api_info where id=#{id}")
    OpsApiDO getApiById(Integer id);
}
