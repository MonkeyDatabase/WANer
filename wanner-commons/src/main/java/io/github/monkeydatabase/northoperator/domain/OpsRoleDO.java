package io.github.monkeydatabase.northoperator.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OpsRoleDO {
    /**
     * 运维角色ID
     */
    Long id;
    /**
     * 运维角色英文名称
     */
    String name;
    /**
     * 运维角色中文描述
     */
    String description;
    /**
     * 启用状态 0表示禁用 1表示启用
     */
    Integer status;
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
