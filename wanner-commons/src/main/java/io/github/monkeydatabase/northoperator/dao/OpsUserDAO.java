package io.github.monkeydatabase.northoperator.dao;

import io.github.monkeydatabase.northoperator.domain.OpsUserDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OpsUserDAO {

    @Select("select * from ops_user_info where id=#{id}")
    OpsUserDO getUserById(Integer id);

    @Select("SELECT * " +
            "FROM ops_user_info " +
            "WHERE username = #{username}")
    OpsUserDO getUserDOByUsername(@Param("username")String username);

    @Select("SELECT name " +
            "FROM ops_role_info r " +
                "left join ops_user_role_relation ur ON r.id = ur.role_id " +
                "left join ops_user_info u ON u.id = ur.user_id " +
            "WHERE " +
                "u.username = #{username}")
    List<String> getRolesByUsername(@Param("username")String username);
}
