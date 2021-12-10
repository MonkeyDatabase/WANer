package io.github.monkeydatabase.northoperator.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OpsRoleDAO {
    @Select("select * from ops_role_info where id=#{id}")
    OpsUserDAO getRoleById(Integer id);

    @Select("SELECT DISTINCT name " +
            "FROM ops_api_info a " +
            "LEFT JOIN ops_role_api_relation ra ON a.id = ra.api_id " +
            "LEFT JOIN ops_role_info r ON r.id = ra.user_id " +
            "WHERE " +
                "r.name = #{roleName}")
    List<String> getApisByRoleName(@Param("roleName")String roleName);


    @Select({
            "<script>",
                "SELECT DISTINCT a.name ",
                "FROM ops_api_info a ",
                "LEFT JOIN ops_role_api_relation ra ON a.id = ra.api_id ",
                "LEFT JOIN ops_role_info r ON r.id = ra.role_id ",
                "WHERE r.name IN ",
                "<foreach collection='roleNames' item='roleName' open='(' separator=',' close=')' >",
                    "#{roleName}",
                "</foreach>",
            "</script>"
    })
    List<String> getApisByRoleNames(@Param("roleNames")List<String> roleNames);
}
