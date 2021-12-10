package io.github.monkeydatabase.northoperator.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OpsUserDO {
    /**
     * 运维用户ID
     */
    Long id;
    /**
     * 所属公司ID
     */
    Long company_id;
    /**
     * 所属分支ID
     */
    Long branch_id;
    /**
     * 所属站点ID
     */
    Long site_id;
    /**
     * 运维人员姓名
     */
    String username;
    /**
     * 运维人员邮箱
     */
    String email;
    /**
     * 运维人员密码
     */
    String password;
    /**
     * 运维人员职位
     */
    String job_title;
    /**
     * 运维人员手机号
     */
    String phone_number;
    /**
     * 是否订阅新产品广告信息，通过邮件下发
     */
    Boolean ads_accepted;
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


}
