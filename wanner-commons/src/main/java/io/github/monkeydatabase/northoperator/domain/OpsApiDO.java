package io.github.monkeydatabase.northoperator.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OpsApiDO {
    /**
     * 运维平台API ID
     */
    Long id;
    /**
     * 运维平台API权限名称, 用于后续SpringSecurity注解校验
     */
    String name;
    /**
     * 运维平台API权限中午名称
     */
    String description;
    /**
     * 保留字段
     */
    String extra;
    /**
     * 创建时间
     */
    LocalDateTime create_time;
    /**
     * 修改时间
     */
    LocalDateTime modified_time;


}
