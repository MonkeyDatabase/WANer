package io.github.monkeydatabase.billing.dao;

import io.github.monkeydatabase.billing.domain.OpsUserDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OpsUserDAO {

    @Select("select * from ops_user_info where id=#{id}")
    OpsUserDO getUser(Integer id);
}
