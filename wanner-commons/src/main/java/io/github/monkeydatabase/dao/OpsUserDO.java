package io.github.monkeydatabase.dao;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OpsUserDO {
    /**
     * 运维人员ID
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
     * 是否是所属机构的管理员
     */
    Boolean is_admin;

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
     * 保留字段
     */
    String extra;

    /**
     * 创建时间
     */
    LocalDateTime create_time;

}
