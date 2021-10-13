/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = app_user_info   */
/******************************************/
DROP TABLE IF EXISTS `app_user_info`;
CREATE TABLE `app_user_info`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '政企员工ID',
    `company_id`      bigint(20) DEFAULT NULL COMMENT '所属公司ID',
    `branch_id`       bigint(20) DEFAULT NULL COMMENT '所属分支ID',
    `site_id`         bigint(20) DEFAULT NULL COMMENT '所属站点ID',
    `username`        varchar(255) NOT NULL COMMENT '姓名',
    `email`           varchar(255) NOT NULL COMMENT '邮箱',
    `password`        varchar(500) NOT NULL COMMENT '密码',
    `job_title`       varchar(255)          DEFAULT NULL COMMENT '职位',
    `phone_number`    varchar(255) NOT NULL COMMENT '手机号',
    `account_creator` bigint(20) NOT NULL COMMENT '创建该员工账号的运维人员ID',
    `extra`           varchar(255)          DEFAULT NULL COMMENT '保留字段',
    `create_time`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='政企员工账号,用于登录APP';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = ops_user_info   */
/******************************************/
DROP TABLE IF EXISTS `ops_user_info`;
CREATE TABLE `ops_user_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '运维人员ID',
    `company_id`    bigint(20) DEFAULT NULL COMMENT '所属公司ID',
    `branch_id`     bigint(20) DEFAULT NULL COMMENT '所属分支ID',
    `site_id`       bigint(20) DEFAULT NULL COMMENT '所属站点ID',
    `username`      varchar(255) NOT NULL COMMENT '运维人员姓名',
    `is_admin`      boolean      NOT NULL DEFAULT FALSE COMMENT '是否是所属机构的管理员',
    `email`         varchar(255) NOT NULL COMMENT '运维人员邮箱',
    `password`      varchar(500) NOT NULL COMMENT '运维人员密码',
    `job_title`     varchar(255)          DEFAULT NULL COMMENT '运维人员职位',
    `phone_number`  varchar(255) NOT NULL COMMENT '运维人员手机号',
    `ads_accepted`  boolean      NOT NULL DEFAULT TRUE COMMENT '是否订阅新产品广告信息，通过邮件下发',
    `extra`         varchar(255)          DEFAULT NULL COMMENT '保留字段',
    `create_time`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运维人员账号';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = organization_info   */
/******************************************/
DROP TABLE IF EXISTS `organization_info`;
CREATE TABLE `organization_info`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构ID',
    `name`                 varchar(255) NOT NULL COMMENT '机构名称',
    `level`                int UNSIGNED NOT NULL DEFAULT 0 COMMENT '机构层级, 0表示company, 1表示branch, 2表示site',
    `parent_id`            bigint(20) DEFAULT NULL COMMENT '上级机构ID，level=0时该值为空，因为company为最顶层机构',
    `desc`                 varchar(255)          DEFAULT NULL COMMENT '机构描述信息',
    `notification_enabled` boolean      NOT NULL DEFAULT FALSE COMMENT '是否开启通知',
    `notification_type`    int UNSIGNED DEFAULT NULL DEFAULT 0 COMMENT '通知方式，0表示邮件，1表示短信，2表示钉钉，3表示企业微信',
    `extra`                varchar(255)          DEFAULT NULL COMMENT '保留字段',
    `create_time`          datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time`        datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组织机构信息';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = billing_user_info   */
/******************************************/
DROP TABLE IF EXISTS `billing_user_info`;
CREATE TABLE `billing_user_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '计费账号ID',
    `company_id`    bigint(20) DEFAULT NULL COMMENT '所属公司ID',
    `branch_id`     bigint(20) DEFAULT NULL COMMENT '所属分支ID',
    `site_id`       bigint(20) DEFAULT NULL COMMENT '所属站点ID',
    `username`      varchar(255)          DEFAULT NULL COMMENT '计费账号名称',
    `status`        int          NOT NULL DEFAULT 0 COMMENT '计费账号状态 0:正常，1：冻结，2：销户',
    `password`      varchar(500) NOT NULL COMMENT '计费账号密码',
    `money`         decimal(20, 2)        DEFAULT 0 COMMENT '计费账号余额',
    `credit_line`   decimal(20, 2)        DEFAULT 0 COMMENT '计费账号信用额度，用于后付费控制额度',
    `type`          int          NOT NULL DEFAULT 0 COMMENT '计费账号类型 0：预付费，1：后付费 2：Both',
    `extra`         varchar(255)          DEFAULT NULL COMMENT '保留字段',
    `create_time`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='计费账号信息，即PoP账号，用于钱包系统充值、退费、提现';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = billing_cost_info   */
/******************************************/
DROP TABLE IF EXISTS `billing_cost_info`;
CREATE TABLE `billing_cost_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资费ID',
    `name`          varchar(255)            DEFAULT NULL COMMENT '资费名称',
    `cost_type`     int            NOT NULL DEFAULT 0 COMMENT '资费类型 0:包年/包月，1：按时长，2：按流量',
    `status`        int            NOT NULL DEFAULT 0 COMMENT '资费状态 0:正常销售，1：暂停销售，2：永久下架 注意永久下架也不应删除资费记录',
    `desc`          varchar(255)   NOT NULL COMMENT '资费详细信息描述',
    `base_cost`     decimal(20, 2) NOT NULL COMMENT '基本资费，包年、包月的基本资费即单价，若为实时计费、流量计费则基本资费为0',
    `unit_cost`     decimal(20, 2) NOT NULL COMMENT '单元费用，实时计费就是1H多少钱，流量计费就是1G多少钱，若包年、包月则单元费用为0',
    `extra`         varchar(255)            DEFAULT NULL COMMENT '保留字段，用于存储不同套餐中的差异字段',
    `create_time`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time` datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='资费信息，用于存储平台方各种产品的套餐内容和资费信息';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = billing_contract_info   */
/******************************************/
DROP TABLE IF EXISTS `billing_contract_info`;
CREATE TABLE `billing_contract_info`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT COMMENT '合同ID',
    `name`              varchar(255)      DEFAULT NULL COMMENT '名称',
    `billing_id`        bigint(20) NOT NULL COMMENT '计费账号ID',
    `cost_id`           bigint(20) NOT NULL COMMENT '资费ID',
    `bandwidth`         bigint(20) NOT NULL DEFAULT 0 COMMENT '购买带宽 单位:MB',
    `traffic_sum`       float    NOT NULL DEFAULT 0 COMMENT '购买流量 单位:GB',
    `traffic_available` float    NOT NULL DEFAULT 0 COMMENT '剩余流量 单位:GB',
    `start_time`        datetime NOT NULL COMMENT '生效时间',
    `end_time`          datetime NOT NULL COMMENT '终止时间',
    `status`            int      NOT NULL DEFAULT 0 COMMENT '合同状态 0:正常 1:冻结 2：过期 3:未生效',
    `extra`             varchar(255)      DEFAULT NULL COMMENT '保留字段',
    `create_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time`     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='合同信息';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = billing_flow_info   */
/******************************************/
DROP TABLE IF EXISTS `billing_flow_info`;
CREATE TABLE `billing_flow_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水ID',
    `name`          varchar(255)            DEFAULT NULL COMMENT '流水名称',
    `billing_id`    bigint(20) NOT NULL COMMENT '计费账号ID',
    `action`        int            NOT NULL COMMENT '计费动作 0：日常扣费 1：签订合同扣费 2：退款 3：充值',
    `contract_id`   bigint(20) NOT NULL COMMENT '本次扣费所用的合同ID，当有多个合同时优先使用按流量计费合同',
    `cost_id`       bigint(20) NOT NULL COMMENT '资费ID',
    `cost`          decimal(20, 2) NOT NULL COMMENT '本次扣费金钱数额，单位RMB，当签订包年、包月合同时该值为合同的base_count，签订之后消费包年、包月合同时该值为0',
    `traffic`       float                   DEFAULT NULL COMMENT '本次扣费流量，单位MB，当被扣费合同是包年、包月时该值为0',
    `extra`         varchar(255)            DEFAULT NULL COMMENT '保留字段',
    `create_time`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time` datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='计费流水信息，流水每5分钟统计一次';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = asset_cpe_info   */
/******************************************/
DROP TABLE IF EXISTS `asset_machine_info`;
CREATE TABLE `asset_machine_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'CPE ID',
    `name`          varchar(255)          DEFAULT NULL COMMENT 'CPE名称',
    `serial_number` varchar(255) NOT NULL COMMENT 'CPE序列号',
    `token`         text         NOT NULL COMMENT 'CPE令牌，由Controller对CPE序列号签名后生成的令牌',
    `company_id`    bigint(20) DEFAULT NULL COMMENT '所属公司ID',
    `branch_id`     bigint(20) DEFAULT NULL COMMENT '所属分支ID',
    `site_id`       bigint(20) DEFAULT NULL COMMENT '所属站点ID',
    `is_soled`      boolean      NOT NULL DEFAULT false COMMENT '是否售出',
    `is_approved`   boolean      NOT NULL DEFAULT false COMMENT '是否准入，可用于冻结设备接入SDWAN',
    `is_connected`  boolean      NOT NULL DEFAULT false COMMENT '是否连接到Controller',
    `is_synced`     boolean      NOT NULL DEFAULT true COMMENT '是否同步完成',
    `type`          int          NOT NULL DEFAULT 0 COMMENT '设备类型 0：CPE 1：POP',
    `address`       varchar(255)          DEFAULT NULL COMMENT 'CPE所在地址',
    `latitude`      varchar(255)          DEFAULT NULL COMMENT 'CPE所在纬度',
    `longitude`     varchar(255)          DEFAULT NULL COMMENT 'CPE所在经度',
    `extra`         varchar(255)          DEFAULT NULL COMMENT '保留字段',
    `create_time`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='CPE设备信息';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = asset_ip_info   */
/******************************************/
DROP TABLE IF EXISTS `asset_ip_info`;
CREATE TABLE `asset_ip_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'IP ID',
    `ip`            varchar(255) NOT NULL COMMENT 'IP地址',
    `owner_id`      bigint(20) NOT NULL COMMENT '持有该IP地址的POP ID',
    `user_id`       bigint(20) NOT NULL COMMENT '使用该IP地址的CPE ID',
    `start_time`    datetime     NOT NULL COMMENT '生效时间',
    `end_time`      datetime     NOT NULL COMMENT '终止时间',
    `extra`         varchar(255)          DEFAULT NULL COMMENT '保留字段',
    `create_time`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='IP资产信息';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = asset_interface_info   */
/******************************************/
DROP TABLE IF EXISTS `asset_interface_info`;
CREATE TABLE `asset_interface_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Interface ID',
    `machine_id`    bigint(20) NOT NULL COMMENT '所属设备Machine ID',
    `mac`           varchar(255)      DEFAULT NULL COMMENT 'MAC地址',
    `ipv4`          varchar(255)      DEFAULT NULL COMMENT 'IPv4地址',
    `ipv4_mask`     int               DEFAULT NULL COMMENT 'IPv4地址掩码',
    `ipv6`          varchar(255)      DEFAULT NULL COMMENT 'IPv6地址',
    `ipv6_mask`     varchar(255)      DEFAULT NULL COMMENT 'IPv6地址掩码',
    `gateway`       varchar(255)      DEFAULT NULL COMMENT '网关地址',
    `dns_address`   varchar(255)      DEFAULT NULL COMMENT 'DNS地址',
    `type`          int               DEFAULT NULL COMMENT '接口类型 0:WAN 1:LAN',
    `stun_enabled`  boolean  NOT NULL DEFAULT false COMMENT '是否启用STUN进行NAT穿越',
    `path_labels`   varchar(255)      DEFAULT NULL COMMENT '路径标签列表,存储List经序列化后的JSON串',
    `extra`         varchar(255)      DEFAULT NULL COMMENT '保留字段',
    `create_time`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='IP资产信息';

/******************************************/
/*   数据库全名 = sdwan_controller   */
/*   表名称 = asset_tunnel_info   */
/******************************************/
DROP TABLE IF EXISTS `asset_tunnel_info`;
CREATE TABLE `asset_tunnel_info`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '隧道ID',
    `type`                int      NOT NULL COMMENT '接口类型 0:拨号加载 1:政企组网 2:海外加速',
    `machine_a_id`        bigint(20) NOT NULL COMMENT '隧道A侧CPE ID',
    `interface_a_id`      bigint(20) NOT NULL COMMENT '隧道A侧Interface ID',
    `machine_b_id`        bigint(20) NOT NULL COMMENT '隧道B侧CPE ID',
    `interface_b_id`      bigint(20) NOT NULL COMMENT '隧道B侧Interface ID',
    `path_label`          varchar(255)      DEFAULT NULL COMMENT '路径标签列表',
    `status`              int               DEFAULT 1 COMMENT '隧道状态 0:启用 1:未启用',
    `statistic_drop_rate` float             DEFAULT 0 COMMENT '丢包率 单位:%',
    `extra`               varchar(255)      DEFAULT NULL COMMENT '保留字段',
    `create_time`         datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modified_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='隧道资产信息';