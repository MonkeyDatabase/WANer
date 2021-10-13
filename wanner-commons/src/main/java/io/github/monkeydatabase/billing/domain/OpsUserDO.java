package io.github.monkeydatabase.billing.domain;

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
    Long companyId;

    /**
     * 所属分支ID
     */
    Long branchId;

    /**
     * 所属站点ID
     */
    Long siteId;

    /**
     * 运维人员姓名
     */

    String userName;

    /**
     * 是否是所属机构的管理员
     */
    Boolean isAdmin;

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
    String jobTitle;

    /**
     * 运维人员手机号
     */
    String phoneNumber;

    /**
     * 是否订阅新产品广告信息，通过邮件下发
     */
    Boolean adsAccepted;

    /**
     * 保留字段
     */
    String extra;

    /**
     * 创建时间
     */
    LocalDateTime createTime;

    /**
     * 修改时间
     */
    LocalDateTime modifiedTime;
}
