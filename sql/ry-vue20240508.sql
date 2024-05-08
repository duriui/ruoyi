/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 08/05/2024 09:54:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ai_alg_task
-- ----------------------------
DROP TABLE IF EXISTS `ai_alg_task`;
CREATE TABLE `ai_alg_task`  (
  `alg_task_id` int NOT NULL COMMENT 'AI核心平台的算法ID',
  `task_id` int NOT NULL COMMENT '放卸矿任务的ID',
  `locomotive_id` int NOT NULL COMMENT '放卸矿的机车ID',
  `task_type` tinyint NOT NULL COMMENT 'AI核心算法的任务类型',
  `task_status` tinyint NOT NULL COMMENT '任务状态,0-正在运行，1-成功, 2-被中止',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '任务开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '任务结束时间',
  PRIMARY KEY (`alg_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI核心平台算法记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ai_alg_task
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for load_route
-- ----------------------------
DROP TABLE IF EXISTS `load_route`;
CREATE TABLE `load_route`  (
  `start_point_id` int NOT NULL COMMENT '开始点位ID',
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '路线信息以,分隔',
  `well_id` int NOT NULL COMMENT '该路线的溜井ID',
  PRIMARY KEY (`start_point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '放卸矿路线表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of load_route
-- ----------------------------

-- ----------------------------
-- Table structure for load_task
-- ----------------------------
DROP TABLE IF EXISTS `load_task`;
CREATE TABLE `load_task`  (
  `task_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `locomotive_id` int NOT NULL COMMENT '机车ID',
  `user_id` int NULL DEFAULT NULL COMMENT '下发任务者ID',
  `locomotive_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌号',
  `task_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务类型描述',
  `task_type_enum` tinyint NOT NULL COMMENT '任务类型,0-自动放矿，1-遥控放矿,2-遥控卸矿',
  `locomotive_speed` double NULL DEFAULT NULL COMMENT '机车当前速度',
  `arrive_well_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '放卸矿溜井名称',
  `arrive_well_id` int NOT NULL COMMENT '放卸矿溜井ID',
  `carriage_amount` smallint NOT NULL COMMENT '该次放卸矿车厢数量',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '任务开始时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '任务修改时间',
  `route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务路线以,分割。如 8,9,10 ',
  `task_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务状态描述',
  `task_status_enum` tinyint NOT NULL COMMENT '任务状态0-运行中,1-成功,2-成败,3-暂停中',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '放卸矿任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of load_task
-- ----------------------------

-- ----------------------------
-- Table structure for load_task_suspend_record
-- ----------------------------
DROP TABLE IF EXISTS `load_task_suspend_record`;
CREATE TABLE `load_task_suspend_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int NOT NULL COMMENT '放矿任务ID',
  `locomotive_id` int NOT NULL COMMENT '机车ID',
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '暂停原因',
  `speed` double NULL DEFAULT NULL COMMENT '暂停前速度',
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '放卸矿任务暂停记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of load_task_suspend_record
-- ----------------------------

-- ----------------------------
-- Table structure for ore_dispenser_record
-- ----------------------------
DROP TABLE IF EXISTS `ore_dispenser_record`;
CREATE TABLE `ore_dispenser_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int NULL DEFAULT NULL COMMENT '放矿任务ID',
  `controller_id` int NULL DEFAULT NULL COMMENT '放矿控制器ID',
  `type` tinyint NULL DEFAULT NULL COMMENT '类型，0-启动，1-停止',
  `time` timestamp NULL DEFAULT NULL COMMENT '控制时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '放矿控制器记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ore_dispenser_record
-- ----------------------------

-- ----------------------------
-- Table structure for point_info
-- ----------------------------
DROP TABLE IF EXISTS `point_info`;
CREATE TABLE `point_info`  (
  `point_id` int NOT NULL,
  `pos_x` double NULL DEFAULT NULL COMMENT '点位x坐标',
  `pos_y` double NULL DEFAULT NULL COMMENT '点位y坐标',
  `is_turning_point` bit(1) NULL DEFAULT NULL COMMENT '是否是拐点0-否，1-是',
  PRIMARY KEY (`point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '点位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of point_info
-- ----------------------------

-- ----------------------------
-- Table structure for point_route
-- ----------------------------
DROP TABLE IF EXISTS `point_route`;
CREATE TABLE `point_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `current_point` int NULL DEFAULT NULL COMMENT '路线的当前点',
  `target_point` int NULL DEFAULT NULL COMMENT '路线的目标点位',
  `next_point` int NULL DEFAULT NULL COMMENT '路线目标点位的下一个点位',
  `traffic_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'current_point->target_point->next_point需要设置为绿灯信号灯',
  `switch_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'current_point->target_point->next_point需要扳道的岔道',
  `is_target_turning_point` bit(1) NOT NULL COMMENT 'target_point是否是岔道口',
  `is_current_turning_point` bit(1) NOT NULL COMMENT 'current_point是否是岔道口',
  `camera_direction` tinyint NOT NULL COMMENT '该短路线放矿摄像头的相对位置, 0-左边,1-右边',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '路线信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of point_route
-- ----------------------------

-- ----------------------------
-- Table structure for point_traffic
-- ----------------------------
DROP TABLE IF EXISTS `point_traffic`;
CREATE TABLE `point_traffic`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_id` int NOT NULL COMMENT '点位ID',
  `traffic_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '点位对应的信号灯ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '点位信号灯表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of point_traffic
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `column1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sysDataDetails` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集合',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `colum1`(`column1` ASC) USING BTREE,
  UNIQUE INDEX `colum2`(`column2` ASC) USING BTREE,
  UNIQUE INDEX `colum3`(`column3` ASC) USING BTREE,
  UNIQUE INDEX `colum4`(`column4` ASC) USING BTREE,
  UNIQUE INDEX `colum5`(`column5` ASC) USING BTREE,
  UNIQUE INDEX `colum6`(`column6` ASC) USING BTREE,
  UNIQUE INDEX `colum7`(`column7` ASC) USING BTREE,
  UNIQUE INDEX `colum8`(`column8` ASC) USING BTREE,
  UNIQUE INDEX `colum9`(`column9` ASC) USING BTREE,
  UNIQUE INDEX `colum10`(`column10` ASC) USING BTREE,
  UNIQUE INDEX `colum11`(`column11` ASC) USING BTREE,
  UNIQUE INDEX `colum12`(`column12` ASC) USING BTREE,
  UNIQUE INDEX `colum13`(`column13` ASC) USING BTREE,
  UNIQUE INDEX `colum14`(`column14` ASC) USING BTREE,
  UNIQUE INDEX `colum15`(`column15` ASC) USING BTREE,
  UNIQUE INDEX `colum16`(`column16` ASC) USING BTREE,
  UNIQUE INDEX `colum17`(`column17` ASC) USING BTREE,
  UNIQUE INDEX `colum18`(`column18` ASC) USING BTREE,
  UNIQUE INDEX `colum19`(`column19` ASC) USING BTREE,
  UNIQUE INDEX `colum20`(`column20` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (103, '测试', '', '', 'Y', 'admin', '2024-03-18 15:39:57', 'admin', '2024-05-07 13:44:43', '2', '最高光催化活性', '时代的', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_config` VALUES (130, '阿斯顿撒', '', '', 'Y', 'admin', '2024-05-06 14:41:08', 'admin', '2024-05-07 13:46:05', NULL, '11', '2222', '撒啊', '撒打算', '是的阿萨', '撒阿萨阿瑟东', ' 阿德 ', '十分发', '儿童二', '他人我', '突然人', '挺好让他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES (131, '化学', '', '', 'Y', 'admin', '2024-05-07 17:24:38', 'admin', '2024-05-07 17:24:38', NULL, 'Documnet', 'Photocatalytic Material', 'Highest Photocatalytic Activity', 'Cocatalyst', 'Sacrificial Reagent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_copy1`;
CREATE TABLE `sys_config_copy1`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config_copy1
-- ----------------------------
INSERT INTO `sys_config_copy1` VALUES (103, '1233', '', '', 'Y', 'admin', '2024-03-18 15:39:57', 'admin', '2024-04-01 15:16:30', '2');
INSERT INTO `sys_config_copy1` VALUES (104, 'qwqwq', '', '', 'Y', 'admin', '2024-03-18 15:40:39', 'admin', '2024-03-19 13:26:41', '1111');

-- ----------------------------
-- Table structure for sys_data_demo
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_demo`;
CREATE TABLE `sys_data_demo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '数据模板表id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据名称',
  `column1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_demo
-- ----------------------------

-- ----------------------------
-- Table structure for sys_data_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_details`;
CREATE TABLE `sys_data_details`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `config_id` int NULL DEFAULT NULL,
  `data1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_data_details
-- ----------------------------
INSERT INTO `sys_data_details` VALUES (1, 103, '111', '222呜呜呜呜', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (2, 103, '萨达', '萨达  按时为而非而', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (4, 130, '大城市asda gre ferg eriUIus比嘲讽我IE哦水泥厂哪位U币v哦v', NULL, '第三方', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '绿色的额外我无法', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (5, 130, '撒旦发射点', 'f是额外 w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (6, 130, '委任为e', ' 为为', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (8, 130, '啊实打实', '啊实打实', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (9, 130, '撒打算', 'as da', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (10, 130, 'ssss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (11, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (12, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (13, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (14, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (15, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (16, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (17, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (18, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (19, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (20, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (21, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (22, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (23, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (24, 130, '是的是的啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (28, 103, '我去', '委屈恶气', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (30, 131, 'Chem.Commun.2023', 'Na2S-Na2SO3 solution', 'Rhodium(Rh)', 'AQY 18% at 420 nm', 'Co-doped La5Ti2Cu0.9Ag0.1O7S5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (31, 131, 'Joule 2023', 'Note specified', 'Cr2O3/Rh (photocathode),CoOx(photoanode)', 'AQY 16.3% at 420 nm,STH 0.67%', 'LTCA:MgAI(modified La5Ti2Cu0.9Ag0.1O7S5)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_details` VALUES (32, 131, 'Adv.Energy Mater.2023', 'Not specified', 'FeNiCoOx', 'STH = 12.1%', 'Nanostructured Ta3N5(nanorods and thin films)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '合肥工业大学', 0, 'admin', '15888888888', '123@qq.com', '0', '0', 'admin', '2024-03-05 14:49:39', 'admin', '2024-05-08 09:47:39');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '计算机学院', 1, 'admin', '15888888888', '123@qq.com', '0', '0', 'admin', '2024-03-05 14:49:39', 'admin', '2024-05-08 09:47:50');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'admin', '15888888888', '123@qq.com', '0', '0', 'admin', '2024-03-05 14:49:39', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'admin', '15888888888', '123@qq.com', '0', '2', 'admin', '2024-03-05 14:49:39', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'admin', '15888888888', '123@qq.com', '0', '0', 'admin', '2024-03-05 14:49:39', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'admin', '15888888888', '123@qq.com', '0', '2', 'admin', '2024-03-05 14:49:39', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'admin', '15888888888', '123@qq.com', '0', '0', 'admin', '2024-03-05 14:49:39', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', 'sss', 1, NULL, NULL, NULL, '0', '2', 'admin', '2024-03-18 14:53:16', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 100, '0,100', '111', 0, NULL, NULL, NULL, '0', '2', 'admin', '2024-05-08 09:48:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-03-05 14:49:48', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-03-05 14:49:47', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 14:49:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 14:49:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 14:49:50', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 16:03:05');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-05 16:20:03');
INSERT INTO `sys_logininfor` VALUES (102, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-05 16:20:12');
INSERT INTO `sys_logininfor` VALUES (103, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-05 16:20:16');
INSERT INTO `sys_logininfor` VALUES (104, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 16:20:20');
INSERT INTO `sys_logininfor` VALUES (105, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-05 16:20:28');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 16:20:32');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-05 16:22:31');
INSERT INTO `sys_logininfor` VALUES (108, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 16:22:44');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 15:59:46');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-11 13:51:05');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-15 18:00:15');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-15 18:00:40');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-15 18:01:55');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-15 18:02:11');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-15 18:02:16');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-15 18:02:22');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-15 18:03:02');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-18 13:48:19');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-18 18:28:33');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-18 18:28:38');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-19 13:26:26');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-28 14:23:20');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-28 17:02:57');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-28 17:03:01');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-29 14:35:53');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-01 14:49:46');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-01 16:31:24');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-02 11:11:37');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-02 13:23:13');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-02 18:01:36');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-02 18:01:42');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-03 09:40:48');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-03 10:45:24');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-03 11:17:42');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-03 13:34:09');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-03 15:07:14');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-03 17:53:57');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 09:54:38');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-11 15:50:27');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 13:35:34');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 17:26:00');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-29 18:08:27');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 09:45:11');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 10:32:53');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 13:27:10');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-30 13:38:27');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 13:38:33');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 14:32:54');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 15:32:50');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 17:29:47');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-06 13:43:46');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 09:33:49');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 13:23:11');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 16:12:21');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-08 09:31:02');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-03-19 13:26:06', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-03-05 14:49:42', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-03-05 14:49:42', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-03-05 14:49:42', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-03-05 14:49:42', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (106, '数据模板管理', 1, 7, 'data', 'system/data/index', '', 1, 0, 'C', '0', '0', 'system:data:list', 'edit', 'admin', '2024-03-18 15:00:59', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '数据管理', 106, 7, 'data', 'system/data/dataDetail', '', 1, 0, 'C', '0', '0', 'system:data:list', 'edit', 'admin', '2024-03-18 15:00:59', '', NULL, '参数详情菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-03-05 14:49:42', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-03-05 14:49:42', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-03-05 14:49:42', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-03-05 14:49:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 685 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 16:19:57', 136);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-05 16:19:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-03-05 16:20:20\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 16:20:52', 69);
INSERT INTO `sys_oper_log` VALUES (102, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'test', '若依科技', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'D:\\ruoyi\\uploadPath\\avatar\\2024\\03\\05\\1709199294234_20240305162824A001.jpg: 设备未就绪。\r\n', '2024-03-05 16:28:24', 65);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-03-15 18:04:09', 31);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-03-15 18:18:54', 5);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-03-18 13:51:42', 8);
INSERT INTO `sys_oper_log` VALUES (106, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 14:01:26', 35);
INSERT INTO `sys_oper_log` VALUES (107, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 14:01:32', 73);
INSERT INTO `sys_oper_log` VALUES (108, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-05 14:49:41\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"admin\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-03-05 14:49:41\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"admin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 14:47:10', 105);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"sss\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 14:53:16', 94);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/200', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 14:53:21', 39);
INSERT INTO `sys_oper_log` VALUES (111, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"ddd\",\"postId\":5,\"postName\":\"ddd\",\"postSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 14:54:57', 46);
INSERT INTO `sys_oper_log` VALUES (112, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/post/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 14:55:01', 60);
INSERT INTO `sys_oper_log` VALUES (113, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '内置参数【sys.index.skinName】不能删除 ', '2024-03-18 15:03:56', 4);
INSERT INTO `sys_oper_log` VALUES (114, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/03/18/微信图片_20240314095142_20240318152749A001.png\",\"code\":200}', 0, NULL, '2024-03-18 15:27:49', 85);
INSERT INTO `sys_oper_log` VALUES (115, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"123@163.com\",\"nickName\":\"admin\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:28:00', 36);
INSERT INTO `sys_oper_log` VALUES (116, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/03/18/OIP-C_20240318152856A002.jpg\",\"code\":200}', 0, NULL, '2024-03-18 15:28:56', 37);
INSERT INTO `sys_oper_log` VALUES (117, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"1233\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"remark\":\"2222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:39:58', 425);
INSERT INTO `sys_oper_log` VALUES (118, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"121\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"remark\":\"333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:40:10', 96);
INSERT INTO `sys_oper_log` VALUES (119, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"qwqwq\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"remark\":\"qwq\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:40:39', 168);
INSERT INTO `sys_oper_log` VALUES (120, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":101,\"configKey\":\"\",\"configName\":\"121\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:10\",\"params\":{},\"remark\":\"22\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'121\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:43:16', 4);
INSERT INTO `sys_oper_log` VALUES (121, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":101,\"configKey\":\"\",\"configName\":\"121\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:10\",\"params\":{},\"remark\":\"22\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'121\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:43:20', 3);
INSERT INTO `sys_oper_log` VALUES (122, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":101,\"configKey\":\"\",\"configName\":\"121\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:10\",\"params\":{},\"remark\":\"22\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'121\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:43:22', 2);
INSERT INTO `sys_oper_log` VALUES (123, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":100,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"222222\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:43:28', 56);
INSERT INTO `sys_oper_log` VALUES (124, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/101', '127.0.0.1', '内网IP', '{}', NULL, 1, '内置参数【】不能删除 ', '2024-03-18 15:43:31', 3);
INSERT INTO `sys_oper_log` VALUES (125, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/102', '127.0.0.1', '内网IP', '{}', NULL, 1, '内置参数【】不能删除 ', '2024-03-18 15:43:55', 3);
INSERT INTO `sys_oper_log` VALUES (126, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":102,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:44:00', 2);
INSERT INTO `sys_oper_log` VALUES (127, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":100,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"222222222\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 15:43:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:44:06', 103);
INSERT INTO `sys_oper_log` VALUES (128, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":102,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:44:18', 3);
INSERT INTO `sys_oper_log` VALUES (129, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":102,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:44:53', 3);
INSERT INTO `sys_oper_log` VALUES (130, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":102,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:45:46', 6);
INSERT INTO `sys_oper_log` VALUES (131, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":102,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq2\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:55:31', 8);
INSERT INTO `sys_oper_log` VALUES (132, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2222222222\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 15:44:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:57:25', 86);
INSERT INTO `sys_oper_log` VALUES (133, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq2\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:57:28', 4);
INSERT INTO `sys_oper_log` VALUES (134, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq2\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 15:57:32', 6);
INSERT INTO `sys_oper_log` VALUES (135, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq2\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 16:02:24', 5);
INSERT INTO `sys_oper_log` VALUES (136, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq2\",\"updateBy\":\"\"}', '{\"msg\":\"修改参数\'qwqwq\'失败，参数键名已存在\",\"code\":500}', 0, NULL, '2024-03-18 16:06:29', 16);
INSERT INTO `sys_oper_log` VALUES (137, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq2\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 16:09:07', 52);
INSERT INTO `sys_oper_log` VALUES (138, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 16:09:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 16:09:12', 38);
INSERT INTO `sys_oper_log` VALUES (139, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 16:09:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 16:22:02', 42);
INSERT INTO `sys_oper_log` VALUES (140, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 16:22:02\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'remark\' at row 1\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,     update_time = sysdate()          where config_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'remark\' at row 1\n; Data truncation: Data too long for column \'remark\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'remark\' at row 1', '2024-03-18 16:22:11', 38);
INSERT INTO `sys_oper_log` VALUES (141, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 16:22:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 16:22:17', 43);
INSERT INTO `sys_oper_log` VALUES (142, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 \",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 16:22:17\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'remark\' at row 1\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,     update_time = sysdate()          where config_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'remark\' at row 1\n; Data truncation: Data too long for column \'remark\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'remark\' at row 1', '2024-03-18 16:29:38', 5);
INSERT INTO `sys_oper_log` VALUES (143, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 \",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 16:22:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 16:30:12', 38);
INSERT INTO `sys_oper_log` VALUES (144, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒少时诵诗书少时诵诗书是撒是撒是撒是撒是撒 qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上事实上飒飒飒qwq22222事实上事实上', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 16:30:17', 38);
INSERT INTO `sys_oper_log` VALUES (145, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":104,\"configKey\":\"\",\"configName\":\"qwqwq\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:40:39\",\"params\":{},\"remark\":\"1111\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-18 16:30:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-19 13:26:41', 45);
INSERT INTO `sys_oper_log` VALUES (146, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2222222222111\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-19 15:57:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-19 13:55:59', 56);
INSERT INTO `sys_oper_log` VALUES (147, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-19 13:55:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-19 14:05:52', 56);
INSERT INTO `sys_oper_log` VALUES (148, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112222222222211122222222222111222222222221112\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-19 14:05:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-19 14:06:02', 78);
INSERT INTO `sys_oper_log` VALUES (149, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-19 14:06:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-01 14:56:14', 69);
INSERT INTO `sys_oper_log` VALUES (150, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-01 14:56:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-01 15:16:30', 104);
INSERT INTO `sys_oper_log` VALUES (151, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-01 15:16:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-01 16:46:37', 62);
INSERT INTO `sys_oper_log` VALUES (152, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-01 16:46:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-01 16:47:49', 61);
INSERT INTO `sys_oper_log` VALUES (153, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-01 16:47:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-01 16:48:09', 116);
INSERT INTO `sys_oper_log` VALUES (154, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-01 16:48:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-01 16:53:35', 79);
INSERT INTO `sys_oper_log` VALUES (155, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-01 16:53:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-01 16:59:12', 76);
INSERT INTO `sys_oper_log` VALUES (156, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-01 16:59:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:11:56', 137);
INSERT INTO `sys_oper_log` VALUES (157, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:12:58', 121);
INSERT INTO `sys_oper_log` VALUES (158, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:13:45', 140);
INSERT INTO `sys_oper_log` VALUES (159, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:14:58', 37735);
INSERT INTO `sys_oper_log` VALUES (160, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:17:29', 138656);
INSERT INTO `sys_oper_log` VALUES (161, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:18:19', 32020);
INSERT INTO `sys_oper_log` VALUES (162, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:18:32', 90);
INSERT INTO `sys_oper_log` VALUES (163, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:28:13', 184797);
INSERT INTO `sys_oper_log` VALUES (164, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:11:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 11:28:28', 154);
INSERT INTO `sys_oper_log` VALUES (165, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 11:28:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:23:29', 48);
INSERT INTO `sys_oper_log` VALUES (166, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data2\":\"333\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 13:23:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:23:34', 57);
INSERT INTO `sys_oper_log` VALUES (167, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data2\":\"3337777\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 13:23:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:24:48', 66);
INSERT INTO `sys_oper_log` VALUES (168, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"1233\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data2\":\"3337777\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 13:24:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:24:52', 63);
INSERT INTO `sys_oper_log` VALUES (169, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data2\":\"3337777\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 13:24:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:25:47', 74);
INSERT INTO `sys_oper_log` VALUES (170, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 13:25:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:26:03', 87);
INSERT INTO `sys_oper_log` VALUES (171, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 13:26:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:42:34', 96);
INSERT INTO `sys_oper_log` VALUES (172, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"我来试试\",\"configType\":\"Y\",\"createBy\":\"admin\",\"data1\":\"1221\",\"data11\":\" fsd fe \",\"data19\":\"fdsg st \",\"data2\":\"32432\",\"data20\":\"@@@@\",\"data3\":\"额发多少 \",\"data4\":\"鼎折覆餗 \",\"data5\":\"的发生的放\",\"data6\":\"放收到复试发生的\",\"data7\":\" 收到放收到\",\"data8\":\" 发生的fwe\",\"data9\":\"dsg tr tr\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:43:12', 113);
INSERT INTO `sys_oper_log` VALUES (173, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":105,\"configKey\":\"\",\"configName\":\"我来试试\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 13:43:12\",\"data1\":\"1221222\",\"data11\":\" fsd fe \",\"data19\":\"fdsg st \",\"data2\":\"32432\",\"data20\":\"@@@@\",\"data3\":\"额发多少 \",\"data4\":\"鼎折覆餗 \",\"data5\":\"的发生的放\",\"data6\":\"放收到复试发生的\",\"data7\":\" 收到放收到\",\"data8\":\" 发生的fwe\",\"data9\":\"dsg tr tr\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:43:35', 50);
INSERT INTO `sys_oper_log` VALUES (174, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"fdsfsd\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 13:46:56', 72);
INSERT INTO `sys_oper_log` VALUES (175, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 13:42:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 14:16:29', 58);
INSERT INTO `sys_oper_log` VALUES (176, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'colum1\' in \'class com.ruoyi.system.domain.SysConfig\'', '2024-04-02 14:59:35', 16);
INSERT INTO `sys_oper_log` VALUES (177, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1111\',\n            \n            \n            \n            \n            \n       \' at line 28\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,             data1 = ?,             data2 = ?,             data3 = ?,             data4 = ?,             data5 = ?,             data6 = ?,             data7 = ?,             data8 = ?,             data9 = ?,             data10 = ?,                                                    data14 = ?,                                                                                           ?,                                                                                                                                                                                                                                                            update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1111\',\n            \n            \n            \n            \n            \n       \' at line 28\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1111\',\n            \n            \n            \n            \n            \n       \' at line 28', '2024-04-02 15:02:06', 72);
INSERT INTO `sys_oper_log` VALUES (178, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1111\',\n            \n            \n            \n            \n            \n       \' at line 28\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,             data1 = ?,             data2 = ?,             data3 = ?,             data4 = ?,             data5 = ?,             data6 = ?,             data7 = ?,             data8 = ?,             data9 = ?,             data10 = ?,                                                    data14 = ?,                                                                                           ?,                                                                                                                                                                                                                                                            update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1111\',\n            \n            \n            \n            \n            \n       \' at line 28\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1111\',\n            \n            \n            \n            \n            \n       \' at line 28', '2024-04-02 15:05:52', 69);
INSERT INTO `sys_oper_log` VALUES (179, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"222\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,             data1 = ?,             data2 = ?,             data3 = ?,             data4 = ?,             data5 = ?,             data6 = ?,             data7 = ?,             data8 = ?,             data9 = ?,             data10 = ?,                                                    data14 = ?,                                                                                           ?,                                                                                                                                                                                                                                                            update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28', '2024-04-02 15:08:37', 13);
INSERT INTO `sys_oper_log` VALUES (180, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"222\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,             data1 = ?,             data2 = ?,             data3 = ?,             data4 = ?,             data5 = ?,             data6 = ?,             data7 = ?,             data8 = ?,             data9 = ?,             data10 = ?,                                                    data14 = ?,                                                                                           ?,                                                                                                                                                                                                                                                            update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28', '2024-04-02 15:11:11', 87);
INSERT INTO `sys_oper_log` VALUES (181, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"222\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,             data1 = ?,             data2 = ?,             data3 = ?,             data4 = ?,             data5 = ?,             data6 = ?,             data7 = ?,             data8 = ?,             data9 = ?,             data10 = ?,                                                    data14 = ?,                                                                                           ?,                                                                                                                                                                                                                                                            update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28', '2024-04-02 15:12:30', 17);
INSERT INTO `sys_oper_log` VALUES (182, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"222\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                       config_type = ?,             update_by = ?,             remark = ?,             data1 = ?,             data2 = ?,             data3 = ?,             data4 = ?,             data5 = ?,             data6 = ?,             data7 = ?,             data8 = ?,             data9 = ?,             data10 = ?,                                                    data14 = ?,                                                                                           ?,                                                                                                                                                                                                                                                            update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \n            \n            \n            \n            \n        \' at line 28', '2024-04-02 15:25:19', 584252);
INSERT INTO `sys_oper_log` VALUES (183, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"111\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 14:16:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 15:26:10', 86);
INSERT INTO `sys_oper_log` VALUES (184, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"2222\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 15:26:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 15:28:59', 191);
INSERT INTO `sys_oper_log` VALUES (185, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"最高光催化活性\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 15:28:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-02 15:33:14', 135);
INSERT INTO `sys_oper_log` VALUES (186, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"test\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-03 15:28:04', 77);
INSERT INTO `sys_oper_log` VALUES (187, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"最高光催化活性\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"2222222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-02 15:33:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-03 15:28:45', 119);
INSERT INTO `sys_oper_log` VALUES (188, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"最高光催化活性\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"2222222\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-03 15:28:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-03 15:49:35', 132);
INSERT INTO `sys_oper_log` VALUES (189, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-03 16:37:17', 127);
INSERT INTO `sys_oper_log` VALUES (190, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-03 16:38:00', 105);
INSERT INTO `sys_oper_log` VALUES (191, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (     config_name,                     create_by,                                                                                                                                                                                                                        colum1,                                                                                                                                                                                                    create_time,     update_time         )values(     ?,                     ?,                                                                                                                                                                                                                        ?,                                                                                                                                                                                                    sysdate(),              sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\n; Duplicate entry \'1111\' for key \'sys_config.colum1\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'', '2024-04-03 16:39:38', 87);
INSERT INTO `sys_oper_log` VALUES (192, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (     config_name,                     create_by,                                                                                                                                                                                                                        colum1,                                                                                                                                                                                                    create_time,     update_time         )values(     ?,                     ?,                                                                                                                                                                                                                        ?,                                                                                                                                                                                                    sysdate(),              sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\n; Duplicate entry \'1111\' for key \'sys_config.colum1\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'', '2024-04-03 16:40:56', 31400);
INSERT INTO `sys_oper_log` VALUES (193, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (     config_name,                     create_by,                                                                                                                                                                                                                        colum1,                                                                                                                                                                                                    create_time,     update_time         )values(     ?,                     ?,                                                                                                                                                                                                                        ?,                                                                                                                                                                                                    sysdate(),              sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\n; Duplicate entry \'1111\' for key \'sys_config.colum1\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'', '2024-04-03 16:41:15', 233);
INSERT INTO `sys_oper_log` VALUES (194, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (     config_name,                     create_by,                                                                                                                                                                                                                        colum1,                                                                                                                                                                                                    create_time,     update_time         )values(     ?,                     ?,                                                                                                                                                                                                                        ?,                                                                                                                                                                                                    sysdate(),              sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\n; Duplicate entry \'1111\' for key \'sys_config.colum1\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'', '2024-04-03 16:42:37', 34657);
INSERT INTO `sys_oper_log` VALUES (195, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"data8\":\"45435\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (     config_name,                     create_by,                                                                                      data8,                                                                                                                                   colum1,                                                                                                                                                                                                    create_time,     update_time         )values(     ?,                     ?,                                                                                      ?,                                                                                                                                   ?,                                                                                                                                                                                                    sysdate(),              sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'\n; Duplicate entry \'1111\' for key \'sys_config.colum1\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1111\' for key \'sys_config.colum1\'', '2024-04-03 16:42:58', 17632);
INSERT INTO `sys_oper_log` VALUES (196, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"sdsad\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-03 17:06:59', 39);
INSERT INTO `sys_oper_log` VALUES (197, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"dsfds\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-03 17:15:40', 42);
INSERT INTO `sys_oper_log` VALUES (198, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"dsfds\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-03 17:17:50', 44);
INSERT INTO `sys_oper_log` VALUES (199, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"撒大声地\",\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-03 17:54:49', 38);
INSERT INTO `sys_oper_log` VALUES (200, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"data8\":\"45435\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-03 18:01:03', 142621);
INSERT INTO `sys_oper_log` VALUES (201, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"data8\":\"45435\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-03 18:15:41', 55);
INSERT INTO `sys_oper_log` VALUES (202, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"1111\",\"configName\":\"test\",\"createBy\":\"admin\",\"data8\":\"45435\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-03 18:16:15', 7918);
INSERT INTO `sys_oper_log` VALUES (203, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"最高光催化活性\",\"configId\":103,\"configKey\":\"\",\"configName\":\"test\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"data1\":\"我试试\",\"data10\":\"dasdasdqw\",\"data14\":\"望闻问切FF\",\"data2\":\"3337777\",\"data3\":\"sdasdsa\",\"data4\":\"sad\",\"data5\":\"dsadas\",\"data6\":\"dasd\",\"data7\":\"sadsa\",\"data8\":\"dasdas\",\"data9\":\"eqweqw额王菲菲\",\"params\":{},\"remark\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-03 15:49:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-03 18:16:51', 132);
INSERT INTO `sys_oper_log` VALUES (204, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"test\",\"createBy\":\"admin\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-22 14:23:10', 59);
INSERT INTO `sys_oper_log` VALUES (205, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"呜呜呜\",\"createBy\":\"admin\",\"data1\":\"EREW\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-22 14:30:13', 38);
INSERT INTO `sys_oper_log` VALUES (206, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"呜呜呜\",\"createBy\":\"admin\",\"data1\":\"EREW\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-22 14:30:20', 10);
INSERT INTO `sys_oper_log` VALUES (207, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"colum1\":\"呜呜呜\",\"createBy\":\"admin\",\"data1\":\"EREW\",\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-04-22 14:30:25', 6);
INSERT INTO `sys_oper_log` VALUES (208, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sfsf\",\"config_id\":103,\"data1\":\"ddd\"}', NULL, 1, '', '2024-04-22 14:33:11', 6);
INSERT INTO `sys_oper_log` VALUES (209, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sfsf\",\"config_id\":103,\"data1\":\"ddd\"}', NULL, 1, '', '2024-04-22 14:35:39', 21);
INSERT INTO `sys_oper_log` VALUES (210, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sfsf\",\"config_id\":103,\"data1\":\"ddd\"}', NULL, 1, '', '2024-04-22 14:42:50', 346143);
INSERT INTO `sys_oper_log` VALUES (211, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sfsf\",\"config_id\":103,\"data1\":\"ddd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-22 14:43:06', 88);
INSERT INTO `sys_oper_log` VALUES (212, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"dsfsd\",\"config_id\":103}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'sysDataDetails\'. It was either not specified and/or could not be found for the javaType (java.util.List) : jdbcType (null) combination.\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'sysDataDetails\'. It was either not specified and/or could not be found for the javaType (java.util.List) : jdbcType (null) combination.', '2024-04-22 14:47:51', 19);
INSERT INTO `sys_oper_log` VALUES (213, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sss\",\"config_id\":103,\"data1\":\"dd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-22 15:08:14', 133);
INSERT INTO `sys_oper_log` VALUES (214, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 6', '2024-04-22 15:18:38', 11);
INSERT INTO `sys_oper_log` VALUES (215, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"testww\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-22 15:08:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-22 15:22:07', 59935);
INSERT INTO `sys_oper_log` VALUES (216, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"testww\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-22 15:08:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-22 15:22:34', 69);
INSERT INTO `sys_oper_log` VALUES (217, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"testwwdsfsdfds\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-22 15:08:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-22 15:22:45', 47);
INSERT INTO `sys_oper_log` VALUES (218, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"测试\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-22 15:22:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-22 15:23:22', 129);
INSERT INTO `sys_oper_log` VALUES (219, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-22 15:23:41', 77);
INSERT INTO `sys_oper_log` VALUES (220, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"测试22\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-22 15:23:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-23 17:49:33', 53);
INSERT INTO `sys_oper_log` VALUES (221, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5', '2024-04-23 18:06:40', 8);
INSERT INTO `sys_oper_log` VALUES (222, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5', '2024-04-23 18:08:41', 3);
INSERT INTO `sys_oper_log` VALUES (223, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'D:\\gitSpace\\ruoyi\\uploadPath\\avatar\\2024\\04\\29\\OIP-C_20240429180846A001.jpg: 设备未就绪。\r\n', '2024-04-29 18:08:47', 77);
INSERT INTO `sys_oper_log` VALUES (224, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"我去恶趣味\",\"config_id\":103,\"data1\":\"饿请问\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-29 18:10:40', 137);
INSERT INTO `sys_oper_log` VALUES (225, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"测试\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"},{\\\"colum1\\\":\\\"我去恶趣味\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"饿请问\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-29 18:10:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-29 18:10:44', 69);
INSERT INTO `sys_oper_log` VALUES (226, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"飒按时 \",\"configType\":\"Y\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-29 18:10:58', 84);
INSERT INTO `sys_oper_log` VALUES (227, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:48:27', 117);
INSERT INTO `sys_oper_log` VALUES (228, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:48:48', 99);
INSERT INTO `sys_oper_log` VALUES (229, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"测试\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"},{\\\"colum1\\\":\\\"我去恶趣味\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"饿请问\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-29 18:10:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:49:18', 118);
INSERT INTO `sys_oper_log` VALUES (230, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"萨达\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:53:31', 85);
INSERT INTO `sys_oper_log` VALUES (231, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/118', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:55:34', 70);
INSERT INTO `sys_oper_log` VALUES (232, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/117', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:55:36', 102);
INSERT INTO `sys_oper_log` VALUES (233, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/116', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:55:58', 79);
INSERT INTO `sys_oper_log` VALUES (234, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/115', '127.0.0.1', '内网IP', '{}', NULL, 1, '内置参数【】不能删除 ', '2024-04-30 09:57:32', 5);
INSERT INTO `sys_oper_log` VALUES (235, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/115', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 09:57:48', 147);
INSERT INTO `sys_oper_log` VALUES (236, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/107', '127.0.0.1', '内网IP', '{}', NULL, 1, '内置参数【】不能删除 ', '2024-04-30 09:57:50', 3);
INSERT INTO `sys_oper_log` VALUES (237, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:00:17', 103);
INSERT INTO `sys_oper_log` VALUES (238, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:00:19', 72);
INSERT INTO `sys_oper_log` VALUES (239, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"测试阿达\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"colum1\\\":\\\"sss\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"dd\\\"},{\\\"colum1\\\":\\\"我去恶趣味\\\",\\\"config_id\\\":103,\\\"data1\\\":\\\"饿请问\\\"}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-30 09:49:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:00:28', 88);
INSERT INTO `sys_oper_log` VALUES (240, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"萨达 啊按时阿萨德\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:00:51', 296);
INSERT INTO `sys_oper_log` VALUES (241, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":119,\"configKey\":\"\",\"configName\":\"萨达啊按时阿萨德\",\"configType\":\"N\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-30 10:00:51\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-04-30 10:00:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:01:04', 59);
INSERT INTO `sys_oper_log` VALUES (242, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sadasd\",\"config_id\":103,\"data1\":\"sa ddsa\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:33:04', 158);
INSERT INTO `sys_oper_log` VALUES (243, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"sada \"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:33:23', 112);
INSERT INTO `sys_oper_log` VALUES (244, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sadas\",\"config_id\":120,\"data1\":\"sadasd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:33:32', 77);
INSERT INTO `sys_oper_log` VALUES (245, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"colum1\":\"sadas\",\"config_id\":120,\"data1\":\"das\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:33:50', 64);
INSERT INTO `sys_oper_log` VALUES (246, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-30 10:34:59', 11);
INSERT INTO `sys_oper_log` VALUES (247, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addDataDemo()', 'POST', 1, 'admin', '研发部门', '/system/config/addDataDemo', '127.0.0.1', '内网IP', '{\"column1\":\"111\",\"createBy\":\"admin\",\"createTime\":\"2024-04-30T17:30:56.582\",\"dataName\":\"dr\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-30T17:30:56.582\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataDemoMapper.insert', '2024-04-30 17:30:56', 6);
INSERT INTO `sys_oper_log` VALUES (248, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addDataDemo()', 'POST', 1, 'admin', '研发部门', '/system/config/addDataDemo', '127.0.0.1', '内网IP', '{\"column1\":\"111\",\"createBy\":\"admin\",\"createTime\":\"2024-04-30T17:33:38.128\",\"dataName\":\"dr\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-30T17:33:38.128\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataDemoMapper.insert', '2024-04-30 17:33:38', 10);
INSERT INTO `sys_oper_log` VALUES (249, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addDataDemo()', 'POST', 1, 'admin', '研发部门', '/system/config/addDataDemo', '127.0.0.1', '内网IP', '{\"column1\":\"111\",\"createBy\":\"admin\",\"createTime\":\"2024-04-30T17:43:14.256\",\"dataName\":\"dr\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-30T17:43:14.256\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataDemoMapper.insert', '2024-04-30 17:43:14', 0);
INSERT INTO `sys_oper_log` VALUES (250, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addDataDemo()', 'POST', 1, 'admin', '研发部门', '/system/config/addDataDemo', '127.0.0.1', '内网IP', '{\"column1\":\"111\",\"createBy\":\"admin\",\"createTime\":\"2024-04-30T17:45:17.646\",\"dataName\":\"dr\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-30T17:45:17.646\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataDemoMapper.insert', '2024-04-30 17:46:45', 87660);
INSERT INTO `sys_oper_log` VALUES (251, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addDataDemo()', 'POST', 1, 'admin', '研发部门', '/system/config/addDataDemo', '127.0.0.1', '内网IP', '{\"column1\":\"111\",\"createBy\":\"admin\",\"createTime\":\"2024-04-30T17:47:08.572\",\"dataName\":\"dr\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-30T17:47:08.573\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataDemoMapper.insert', '2024-04-30 17:47:08', 12);
INSERT INTO `sys_oper_log` VALUES (252, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:12:24', 68);
INSERT INTO `sys_oper_log` VALUES (253, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:15:27', 55);
INSERT INTO `sys_oper_log` VALUES (254, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/121,122', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:16:01', 129);
INSERT INTO `sys_oper_log` VALUES (255, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:16:11', 148);
INSERT INTO `sys_oper_log` VALUES (256, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:17:53', 85);
INSERT INTO `sys_oper_log` VALUES (257, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/123,124', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:19:48', 161);
INSERT INTO `sys_oper_log` VALUES (258, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"萨达擦拭\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:20:23', 32132);
INSERT INTO `sys_oper_log` VALUES (259, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"萨达擦拭\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:20:24', 89);
INSERT INTO `sys_oper_log` VALUES (260, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/126', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:21:41', 62);
INSERT INTO `sys_oper_log` VALUES (261, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/119,120', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:21:53', 119);
INSERT INTO `sys_oper_log` VALUES (262, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"测试\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:25:10', 64);
INSERT INTO `sys_oper_log` VALUES (263, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":\"大萨达\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:28:00', 66);
INSERT INTO `sys_oper_log` VALUES (264, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"configName\":\"1212\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"updateBy\":\"admin\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'column1\' in \'field list\'\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (          config_name,                               config_type,           create_by,                     column1,           column2,                                                                                                                                                                                               update_by,                create_time,     update_time         )values(          ?,                               ?,           ?,                     ?,           ?,                                                                                                                                                                                               ?,                    sysdate(),      sysdate()   )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'column1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'column1\' in \'field list\'', '2024-05-06 14:39:13', 51);
INSERT INTO `sys_oper_log` VALUES (265, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"configName\":\"1212\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 14:41:08', 45);
INSERT INTO `sys_oper_log` VALUES (266, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2024-05-06 15:10:19', 17);
INSERT INTO `sys_oper_log` VALUES (267, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2024-05-06 15:15:00', 227758);
INSERT INTO `sys_oper_log` VALUES (268, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select config_id, config_name, config_key, config_value, config_type, create_by,\' at line 3\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.selectConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT column1, column2, column3, column4, column5, column6, column7, column8, column9, column10, column11, column12, column13, column14, column15, column16, column17, column18, column19, column20                    select config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark,sysDataDetails   from sys_config                    WHERE  config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select config_id, config_name, config_key, config_value, config_type, create_by,\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select config_id, config_name, config_key, config_value, config_type, create_by,\' at line 3', '2024-05-06 15:15:15', 63);
INSERT INTO `sys_oper_log` VALUES (269, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[\"11\",\"2222\"]}', 0, NULL, '2024-05-06 15:19:11', 18);
INSERT INTO `sys_oper_log` VALUES (270, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 15:23:40', 16);
INSERT INTO `sys_oper_log` VALUES (271, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:36:10', 6);
INSERT INTO `sys_oper_log` VALUES (272, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 15:36:43', 5);
INSERT INTO `sys_oper_log` VALUES (273, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:37:07', 3);
INSERT INTO `sys_oper_log` VALUES (274, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:38:54', 4);
INSERT INTO `sys_oper_log` VALUES (275, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:39:44', 5);
INSERT INTO `sys_oper_log` VALUES (276, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"config_id\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 15:40:03', 94);
INSERT INTO `sys_oper_log` VALUES (277, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:40:54', 3);
INSERT INTO `sys_oper_log` VALUES (278, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"config_id\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 15:40:59', 45);
INSERT INTO `sys_oper_log` VALUES (279, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:44:16', 4);
INSERT INTO `sys_oper_log` VALUES (280, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:44:16', 3);
INSERT INTO `sys_oper_log` VALUES (281, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:47:29', 4);
INSERT INTO `sys_oper_log` VALUES (282, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:47:37', 4);
INSERT INTO `sys_oper_log` VALUES (283, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:50:30', 2);
INSERT INTO `sys_oper_log` VALUES (284, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 15:51:53', 4);
INSERT INTO `sys_oper_log` VALUES (285, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:51:56', 3);
INSERT INTO `sys_oper_log` VALUES (286, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:52:03', 2);
INSERT INTO `sys_oper_log` VALUES (287, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:52:08', 3);
INSERT INTO `sys_oper_log` VALUES (288, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:52:50', 3);
INSERT INTO `sys_oper_log` VALUES (289, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:53:14', 2);
INSERT INTO `sys_oper_log` VALUES (290, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 15:53:26', 2);
INSERT INTO `sys_oper_log` VALUES (291, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:56:38', 5);
INSERT INTO `sys_oper_log` VALUES (292, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:59:20', 3);
INSERT INTO `sys_oper_log` VALUES (293, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 15:59:54', 5);
INSERT INTO `sys_oper_log` VALUES (294, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:00:28', 3);
INSERT INTO `sys_oper_log` VALUES (295, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:00:39', 2);
INSERT INTO `sys_oper_log` VALUES (296, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:00:45', 2);
INSERT INTO `sys_oper_log` VALUES (297, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:02:28', 2);
INSERT INTO `sys_oper_log` VALUES (298, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:02:30', 2);
INSERT INTO `sys_oper_log` VALUES (299, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:03:13', 3);
INSERT INTO `sys_oper_log` VALUES (300, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:03:16', 2);
INSERT INTO `sys_oper_log` VALUES (301, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:03:21', 2);
INSERT INTO `sys_oper_log` VALUES (302, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:04:38', 6);
INSERT INTO `sys_oper_log` VALUES (303, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:04:45', 2);
INSERT INTO `sys_oper_log` VALUES (304, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:04:45', 3);
INSERT INTO `sys_oper_log` VALUES (305, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:04:55', 2);
INSERT INTO `sys_oper_log` VALUES (306, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:07:49', 2);
INSERT INTO `sys_oper_log` VALUES (307, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:08:03', 4);
INSERT INTO `sys_oper_log` VALUES (308, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:12:50', 2);
INSERT INTO `sys_oper_log` VALUES (309, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:12:55', 2);
INSERT INTO `sys_oper_log` VALUES (310, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:12:58', 3);
INSERT INTO `sys_oper_log` VALUES (311, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:13:07', 4);
INSERT INTO `sys_oper_log` VALUES (312, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:13:16', 4);
INSERT INTO `sys_oper_log` VALUES (313, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:13:40', 2);
INSERT INTO `sys_oper_log` VALUES (314, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:13:41', 2);
INSERT INTO `sys_oper_log` VALUES (315, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"config_id\":103,\"data1\":\"撒打算\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 16:13:44', 81);
INSERT INTO `sys_oper_log` VALUES (316, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:17:08', 2);
INSERT INTO `sys_oper_log` VALUES (317, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"config_id\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 16:17:10', 74);
INSERT INTO `sys_oper_log` VALUES (318, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:19:00', 17);
INSERT INTO `sys_oper_log` VALUES (319, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"config_id\":103,\"data1\":\"萨达\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysDataMapper.insert', '2024-05-06 16:19:02', 3);
INSERT INTO `sys_oper_log` VALUES (320, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"config_id\":103,\"data1\":\"萨达\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'configId\' in \'class com.ruoyi.system.domain.SysDataDetails\'', '2024-05-06 16:26:44', 11);
INSERT INTO `sys_oper_log` VALUES (321, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"data1\":\"萨达\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'萨达\', \n         \n         \n         \n         \n \' at line 24\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysDataMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDataMapper.insertData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_data_details (                    data1,                                                                                                                                                                                                         )values(                    ?,                                                                                                                                                                                                        )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'萨达\', \n         \n         \n         \n         \n \' at line 24\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'萨达\', \n         \n         \n         \n         \n \' at line 24', '2024-05-06 16:27:48', 52);
INSERT INTO `sys_oper_log` VALUES (322, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"data1\":\"萨达\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'data1 ) \n        )values(\n         ( \'萨达\' ) \n        )\' at line 2\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysDataMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDataMapper.insertData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_data_details (          ( data1 )          )values(          ( ? )          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'data1 ) \n        )values(\n         ( \'萨达\' ) \n        )\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'data1 ) \n        )values(\n         ( \'萨达\' ) \n        )\' at line 2', '2024-05-06 16:31:29', 57);
INSERT INTO `sys_oper_log` VALUES (323, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"data1\":\"萨达\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 16:32:37', 92);
INSERT INTO `sys_oper_log` VALUES (324, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:34:22', 16);
INSERT INTO `sys_oper_log` VALUES (325, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":103,\"data1\":\"萨达\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'configId\' in \'field list\'\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysDataMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDataMapper.insertData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_data_details          ( configId,         data1 )          values          ( ?,         ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'configId\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'configId\' in \'field list\'', '2024-05-06 16:34:24', 37);
INSERT INTO `sys_oper_log` VALUES (326, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":103,\"data1\":\"萨达\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'config_id\' in \'class com.ruoyi.system.domain.SysDataDetails\'', '2024-05-06 16:35:27', 12);
INSERT INTO `sys_oper_log` VALUES (327, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":103,\"data1\":\"萨达\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 16:36:33', 59);
INSERT INTO `sys_oper_log` VALUES (328, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:36:50', 4);
INSERT INTO `sys_oper_log` VALUES (329, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"撒打算\",\"data2\":\" 按时打\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 16:36:53', 35);
INSERT INTO `sys_oper_log` VALUES (330, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"\",\"configName\":\"测试\",\"configType\":\"Y\",\"configValue\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"remark\":\"2\",\"sysDataDetails\":\"[{\\\"config_id\\\":103}]\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 16:17:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-06 16:37:18', 44);
INSERT INTO `sys_oper_log` VALUES (331, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:38:06', 4);
INSERT INTO `sys_oper_log` VALUES (332, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:38:25', 3);
INSERT INTO `sys_oper_log` VALUES (333, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:38:42', 3);
INSERT INTO `sys_oper_log` VALUES (334, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:38:44', 4);
INSERT INTO `sys_oper_log` VALUES (335, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:38:46', 4);
INSERT INTO `sys_oper_log` VALUES (336, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:38:52', 3);
INSERT INTO `sys_oper_log` VALUES (337, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:39:58', 19);
INSERT INTO `sys_oper_log` VALUES (338, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:40:44', 6);
INSERT INTO `sys_oper_log` VALUES (339, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:40:47', 3);
INSERT INTO `sys_oper_log` VALUES (340, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:40:49', 4);
INSERT INTO `sys_oper_log` VALUES (341, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/105', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:40:52', 5);
INSERT INTO `sys_oper_log` VALUES (342, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/105', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:40:53', 7);
INSERT INTO `sys_oper_log` VALUES (343, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:40:56', 4);
INSERT INTO `sys_oper_log` VALUES (344, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:41:27', 4);
INSERT INTO `sys_oper_log` VALUES (345, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/105', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:41:30', 3);
INSERT INTO `sys_oper_log` VALUES (346, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:41:38', 3);
INSERT INTO `sys_oper_log` VALUES (347, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:42:20', 19);
INSERT INTO `sys_oper_log` VALUES (348, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:42:22', 3);
INSERT INTO `sys_oper_log` VALUES (349, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/105', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:42:24', 4);
INSERT INTO `sys_oper_log` VALUES (350, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:42:29', 3);
INSERT INTO `sys_oper_log` VALUES (351, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/105', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:42:49', 4);
INSERT INTO `sys_oper_log` VALUES (352, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:43:34', 4);
INSERT INTO `sys_oper_log` VALUES (353, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:43:37', 4);
INSERT INTO `sys_oper_log` VALUES (354, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:44:06', 5);
INSERT INTO `sys_oper_log` VALUES (355, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:44:31', 2);
INSERT INTO `sys_oper_log` VALUES (356, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:44:34', 2);
INSERT INTO `sys_oper_log` VALUES (357, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-06 16:44:36', 2);
INSERT INTO `sys_oper_log` VALUES (358, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:50:15', 11);
INSERT INTO `sys_oper_log` VALUES (359, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:50:15', 77018);
INSERT INTO `sys_oper_log` VALUES (360, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:50:18', 8);
INSERT INTO `sys_oper_log` VALUES (361, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:50:20', 8);
INSERT INTO `sys_oper_log` VALUES (362, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:50:22', 8);
INSERT INTO `sys_oper_log` VALUES (363, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-06 16:50:25', 10);
INSERT INTO `sys_oper_log` VALUES (364, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:50:27', 8);
INSERT INTO `sys_oper_log` VALUES (365, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:50:29', 9);
INSERT INTO `sys_oper_log` VALUES (366, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 16:51:01', 15);
INSERT INTO `sys_oper_log` VALUES (367, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 16:52:26', 11);
INSERT INTO `sys_oper_log` VALUES (368, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:19:02', 7);
INSERT INTO `sys_oper_log` VALUES (369, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:20:05', 11);
INSERT INTO `sys_oper_log` VALUES (370, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:37:48', 16);
INSERT INTO `sys_oper_log` VALUES (371, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:43:28', 3);
INSERT INTO `sys_oper_log` VALUES (372, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:50:37', 8);
INSERT INTO `sys_oper_log` VALUES (373, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:51:01', 3);
INSERT INTO `sys_oper_log` VALUES (374, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:51:27', 4);
INSERT INTO `sys_oper_log` VALUES (375, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:51:42', 3);
INSERT INTO `sys_oper_log` VALUES (376, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:52:45', 8);
INSERT INTO `sys_oper_log` VALUES (377, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:52:52', 3);
INSERT INTO `sys_oper_log` VALUES (378, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:53:08', 4);
INSERT INTO `sys_oper_log` VALUES (379, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:54:50', 5);
INSERT INTO `sys_oper_log` VALUES (380, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:55:03', 4);
INSERT INTO `sys_oper_log` VALUES (381, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:55:17', 2);
INSERT INTO `sys_oper_log` VALUES (382, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:56:07', 6);
INSERT INTO `sys_oper_log` VALUES (383, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:56:24', 4);
INSERT INTO `sys_oper_log` VALUES (384, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:56:45', 4);
INSERT INTO `sys_oper_log` VALUES (385, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 17:57:10', 4);
INSERT INTO `sys_oper_log` VALUES (386, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 17:57:25', 4);
INSERT INTO `sys_oper_log` VALUES (387, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 17:58:15', 4);
INSERT INTO `sys_oper_log` VALUES (388, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 17:58:15', 3);
INSERT INTO `sys_oper_log` VALUES (389, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:10:31', 13);
INSERT INTO `sys_oper_log` VALUES (390, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:10:31', 13);
INSERT INTO `sys_oper_log` VALUES (391, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:12:25', 4);
INSERT INTO `sys_oper_log` VALUES (392, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:13:45', 4);
INSERT INTO `sys_oper_log` VALUES (393, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:16:50', 8);
INSERT INTO `sys_oper_log` VALUES (394, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:20:50', 5);
INSERT INTO `sys_oper_log` VALUES (395, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:23:07', 4);
INSERT INTO `sys_oper_log` VALUES (396, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-06 18:24:31', 3);
INSERT INTO `sys_oper_log` VALUES (397, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 18:24:40', 2);
INSERT INTO `sys_oper_log` VALUES (398, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-06 18:30:14', 3);
INSERT INTO `sys_oper_log` VALUES (399, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 09:34:00', 5);
INSERT INTO `sys_oper_log` VALUES (400, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-07 09:34:03', 3);
INSERT INTO `sys_oper_log` VALUES (401, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-07 09:34:06', 3);
INSERT INTO `sys_oper_log` VALUES (402, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 09:34:07', 4);
INSERT INTO `sys_oper_log` VALUES (403, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 09:34:20', 4);
INSERT INTO `sys_oper_log` VALUES (404, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 09:44:45', 5);
INSERT INTO `sys_oper_log` VALUES (405, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 09:45:05', 3);
INSERT INTO `sys_oper_log` VALUES (406, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 09:45:31', 2);
INSERT INTO `sys_oper_log` VALUES (407, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 09:57:41', 17);
INSERT INTO `sys_oper_log` VALUES (408, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 09:58:06', 5);
INSERT INTO `sys_oper_log` VALUES (409, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:03:15', 12);
INSERT INTO `sys_oper_log` VALUES (410, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:04:18', 4);
INSERT INTO `sys_oper_log` VALUES (411, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:05:31', 3);
INSERT INTO `sys_oper_log` VALUES (412, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:10:11', 5);
INSERT INTO `sys_oper_log` VALUES (413, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:10:38', 3);
INSERT INTO `sys_oper_log` VALUES (414, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:12:50', 3);
INSERT INTO `sys_oper_log` VALUES (415, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:13:00', 5);
INSERT INTO `sys_oper_log` VALUES (416, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:14:30', 4);
INSERT INTO `sys_oper_log` VALUES (417, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:16:46', 5);
INSERT INTO `sys_oper_log` VALUES (418, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:16:55', 3);
INSERT INTO `sys_oper_log` VALUES (419, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:21:15', 3);
INSERT INTO `sys_oper_log` VALUES (420, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-07 10:22:11', 3);
INSERT INTO `sys_oper_log` VALUES (421, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-07 10:22:14', 3);
INSERT INTO `sys_oper_log` VALUES (422, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:22:19', 3);
INSERT INTO `sys_oper_log` VALUES (423, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:22:26', 3);
INSERT INTO `sys_oper_log` VALUES (424, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:24:34', 3);
INSERT INTO `sys_oper_log` VALUES (425, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:24:40', 3);
INSERT INTO `sys_oper_log` VALUES (426, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:25:41', 2);
INSERT INTO `sys_oper_log` VALUES (427, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:25:45', 2);
INSERT INTO `sys_oper_log` VALUES (428, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:25:58', 2);
INSERT INTO `sys_oper_log` VALUES (429, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"大城市的\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 10:26:01', 83);
INSERT INTO `sys_oper_log` VALUES (430, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:26:03', 3);
INSERT INTO `sys_oper_log` VALUES (431, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:26:07', 3);
INSERT INTO `sys_oper_log` VALUES (432, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"撒旦发射点\",\"data2\":\"f是额外 w\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 10:26:12', 23);
INSERT INTO `sys_oper_log` VALUES (433, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:26:13', 3);
INSERT INTO `sys_oper_log` VALUES (434, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"委任为e\",\"data2\":\" 为为\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 10:26:17', 46);
INSERT INTO `sys_oper_log` VALUES (435, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:26:19', 3);
INSERT INTO `sys_oper_log` VALUES (436, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:26:39', 4);
INSERT INTO `sys_oper_log` VALUES (437, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:27:03', 2);
INSERT INTO `sys_oper_log` VALUES (438, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:27:20', 2);
INSERT INTO `sys_oper_log` VALUES (439, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:33:15', 3);
INSERT INTO `sys_oper_log` VALUES (440, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:40:19', 4);
INSERT INTO `sys_oper_log` VALUES (441, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:44:03', 7);
INSERT INTO `sys_oper_log` VALUES (442, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:44:22', 2);
INSERT INTO `sys_oper_log` VALUES (443, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 10:56:27', 3);
INSERT INTO `sys_oper_log` VALUES (444, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:56:31', 2);
INSERT INTO `sys_oper_log` VALUES (445, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:57:56', 3);
INSERT INTO `sys_oper_log` VALUES (446, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:59:37', 2);
INSERT INTO `sys_oper_log` VALUES (447, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 10:59:38', 22);
INSERT INTO `sys_oper_log` VALUES (448, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:59:41', 4);
INSERT INTO `sys_oper_log` VALUES (449, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:59:47', 2);
INSERT INTO `sys_oper_log` VALUES (450, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"啊实打实\",\"data2\":\"啊实打实\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 10:59:51', 33);
INSERT INTO `sys_oper_log` VALUES (451, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:59:53', 2);
INSERT INTO `sys_oper_log` VALUES (452, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"撒打算\",\"data2\":\"as da\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 10:59:56', 20);
INSERT INTO `sys_oper_log` VALUES (453, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 10:59:57', 4);
INSERT INTO `sys_oper_log` VALUES (454, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"ssss\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 10:59:59', 24);
INSERT INTO `sys_oper_log` VALUES (455, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:01', 3);
INSERT INTO `sys_oper_log` VALUES (456, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:08', 32);
INSERT INTO `sys_oper_log` VALUES (457, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:09', 2);
INSERT INTO `sys_oper_log` VALUES (458, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:11', 50);
INSERT INTO `sys_oper_log` VALUES (459, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:12', 3);
INSERT INTO `sys_oper_log` VALUES (460, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:14', 110);
INSERT INTO `sys_oper_log` VALUES (461, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:14', 2);
INSERT INTO `sys_oper_log` VALUES (462, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:16', 35);
INSERT INTO `sys_oper_log` VALUES (463, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:17', 2);
INSERT INTO `sys_oper_log` VALUES (464, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:19', 39);
INSERT INTO `sys_oper_log` VALUES (465, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:20', 2);
INSERT INTO `sys_oper_log` VALUES (466, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:22', 30);
INSERT INTO `sys_oper_log` VALUES (467, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:24', 4);
INSERT INTO `sys_oper_log` VALUES (468, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:25', 43);
INSERT INTO `sys_oper_log` VALUES (469, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:27', 4);
INSERT INTO `sys_oper_log` VALUES (470, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:35', 2);
INSERT INTO `sys_oper_log` VALUES (471, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:38', 74);
INSERT INTO `sys_oper_log` VALUES (472, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:39', 2);
INSERT INTO `sys_oper_log` VALUES (473, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:41', 55);
INSERT INTO `sys_oper_log` VALUES (474, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:43', 2);
INSERT INTO `sys_oper_log` VALUES (475, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:45', 40);
INSERT INTO `sys_oper_log` VALUES (476, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:46', 2);
INSERT INTO `sys_oper_log` VALUES (477, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:48', 56);
INSERT INTO `sys_oper_log` VALUES (478, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:49', 2);
INSERT INTO `sys_oper_log` VALUES (479, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:52', 68);
INSERT INTO `sys_oper_log` VALUES (480, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:53', 2);
INSERT INTO `sys_oper_log` VALUES (481, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:55', 48);
INSERT INTO `sys_oper_log` VALUES (482, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:00:57', 2);
INSERT INTO `sys_oper_log` VALUES (483, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:00:58', 40);
INSERT INTO `sys_oper_log` VALUES (484, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:01:00', 3);
INSERT INTO `sys_oper_log` VALUES (485, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"是的是的啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 11:01:01', 62);
INSERT INTO `sys_oper_log` VALUES (486, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:01:03', 4);
INSERT INTO `sys_oper_log` VALUES (487, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:01:17', 3);
INSERT INTO `sys_oper_log` VALUES (488, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:01:47', 2);
INSERT INTO `sys_oper_log` VALUES (489, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/selectColumns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:03:48', 2);
INSERT INTO `sys_oper_log` VALUES (490, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-07 11:09:13', 14);
INSERT INTO `sys_oper_log` VALUES (491, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:09:15', 3);
INSERT INTO `sys_oper_log` VALUES (492, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 11:09:21', 3);
INSERT INTO `sys_oper_log` VALUES (493, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\"}}', 0, NULL, '2024-05-07 13:23:18', 6);
INSERT INTO `sys_oper_log` VALUES (494, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysDataMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDataMapper.insertData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_data_details                    values\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-05-07 13:28:01', 47);
INSERT INTO `sys_oper_log` VALUES (495, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysDataMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDataMapper.insertData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_data_details                    values\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-05-07 13:30:04', 6);
INSERT INTO `sys_oper_log` VALUES (496, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysDataMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDataMapper.insertData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_data_details                    values\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-05-07 13:32:02', 45);
INSERT INTO `sys_oper_log` VALUES (497, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:32:36', 8);
INSERT INTO `sys_oper_log` VALUES (498, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"吃撒从\",\"data2\":\"按市场撒\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:32:40', 71);
INSERT INTO `sys_oper_log` VALUES (499, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 14:41:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:32:49', 86);
INSERT INTO `sys_oper_log` VALUES (500, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:32:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:32:53', 45);
INSERT INTO `sys_oper_log` VALUES (501, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"撒打算\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:32:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:33:03', 81);
INSERT INTO `sys_oper_log` VALUES (502, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:33:05', 6);
INSERT INTO `sys_oper_log` VALUES (503, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:33:13', 5);
INSERT INTO `sys_oper_log` VALUES (504, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:34:07', 5);
INSERT INTO `sys_oper_log` VALUES (505, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:34:51', 4);
INSERT INTO `sys_oper_log` VALUES (506, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"阿达\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:33:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:34:57', 48);
INSERT INTO `sys_oper_log` VALUES (507, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:34:59', 5);
INSERT INTO `sys_oper_log` VALUES (508, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"撒打算\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:34:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:35:10', 116);
INSERT INTO `sys_oper_log` VALUES (509, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"撒啊\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:35:10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                                    update_by = ?,                                       ?,             ?,             ?,                                                                                                                                                                                                                                  update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9', '2024-05-07 13:39:00', 54);
INSERT INTO `sys_oper_log` VALUES (510, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"撒啊\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:35:10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                                    update_by = ?,                                       ?,             ?,             ?,                                                                                                                                                                                                                                  update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9', '2024-05-07 13:40:34', 41101);
INSERT INTO `sys_oper_log` VALUES (511, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"撒啊\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:35:10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                                    update_by = ?,                                       ?,             ?,             ?,                                                                                                                                                                                                                                  update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9', '2024-05-07 13:40:59', 58);
INSERT INTO `sys_oper_log` VALUES (512, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"撒啊\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:35:10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\r\n### The error may exist in file [E:\\ideaProjects\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_config           SET config_name = ?,                                                    update_by = ?,                                       ?,             ?,             ?,                                                                                                                                                                                                                                  update_time = sysdate()          where config_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'11\',\n            \'2222\',\n            \'撒啊\',\n            \n            \n      \' at line 9', '2024-05-07 13:41:14', 12);
INSERT INTO `sys_oper_log` VALUES (513, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column2\":\"2222\",\"column3\":\"撒啊\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:35:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:43:36', 83);
INSERT INTO `sys_oper_log` VALUES (514, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column3\":\"撒啊\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:43:43', 5);
INSERT INTO `sys_oper_log` VALUES (515, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column3\":\"撒啊\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:44:10', 5);
INSERT INTO `sys_oper_log` VALUES (516, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column3\":\"撒啊\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:44:32', 3);
INSERT INTO `sys_oper_log` VALUES (517, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\",\"configId\":103,\"configName\":\"测试\",\"createBy\":\"admin\",\"createTime\":\"2024-03-18 15:39:57\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 16:37:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:44:43', 70);
INSERT INTO `sys_oper_log` VALUES (518, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 13:44:52', 4);
INSERT INTO `sys_oper_log` VALUES (519, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":103,\"data1\":\"请问\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:44:55', 56);
INSERT INTO `sys_oper_log` VALUES (520, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 13:44:56', 3);
INSERT INTO `sys_oper_log` VALUES (521, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":103,\"data1\":\"我去\",\"data2\":\"委屈恶气\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:45:01', 60);
INSERT INTO `sys_oper_log` VALUES (522, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 13:45:03', 5);
INSERT INTO `sys_oper_log` VALUES (523, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column3\":\"撒啊\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:45:13', 4);
INSERT INTO `sys_oper_log` VALUES (524, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":130,\"data1\":\"111\",\"data2\":\"222\",\"data3\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:45:22', 45);
INSERT INTO `sys_oper_log` VALUES (525, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column3\":\"撒啊\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:45:25', 7);
INSERT INTO `sys_oper_log` VALUES (526, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column3\":\"撒啊\",\"column2\":\"2222\"}}', 0, NULL, '2024-05-07 13:45:48', 4);
INSERT INTO `sys_oper_log` VALUES (527, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"column1\":\"11\",\"column10\":\"他人我\",\"column11\":\"突然人\",\"column12\":\"挺好让他\",\"column2\":\"2222\",\"column3\":\"撒啊\",\"column4\":\"撒打算\",\"column5\":\"是的阿萨\",\"column6\":\"撒阿萨阿瑟东\",\"column7\":\" 阿德 \",\"column8\":\"十分发\",\"column9\":\"儿童二\",\"configId\":130,\"configName\":\"阿斯顿撒\",\"createBy\":\"admin\",\"createTime\":\"2024-05-06 14:41:08\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-07 13:43:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 13:46:05', 117);
INSERT INTO `sys_oper_log` VALUES (528, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 13:46:08', 3);
INSERT INTO `sys_oper_log` VALUES (529, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 13:48:17', 3);
INSERT INTO `sys_oper_log` VALUES (530, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 13:51:24', 14);
INSERT INTO `sys_oper_log` VALUES (531, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 13:53:09', 5);
INSERT INTO `sys_oper_log` VALUES (532, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 13:53:20', 3);
INSERT INTO `sys_oper_log` VALUES (533, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.removeData()', 'DELETE', 1, 'admin', '研发部门', '/system/config/data/29', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 14:02:02', 14);
INSERT INTO `sys_oper_log` VALUES (534, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.removeData()', 'DELETE', 1, 'admin', '研发部门', '/system/config/data/29', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 14:04:05', 55);
INSERT INTO `sys_oper_log` VALUES (535, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:04:20', 5);
INSERT INTO `sys_oper_log` VALUES (536, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/26', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-05-07 14:04:25', 5);
INSERT INTO `sys_oper_log` VALUES (537, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:05:38', 7);
INSERT INTO `sys_oper_log` VALUES (538, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.removeData()', 'DELETE', 1, 'admin', '研发部门', '/system/config/data/26', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 14:05:41', 118);
INSERT INTO `sys_oper_log` VALUES (539, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:07:31', 6);
INSERT INTO `sys_oper_log` VALUES (540, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:07:36', 5);
INSERT INTO `sys_oper_log` VALUES (541, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.removeData()', 'DELETE', 1, 'admin', '研发部门', '/system/config/data/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 14:07:41', 66);
INSERT INTO `sys_oper_log` VALUES (542, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:07:42', 4);
INSERT INTO `sys_oper_log` VALUES (543, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:08:01', 3);
INSERT INTO `sys_oper_log` VALUES (544, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.removeData()', 'DELETE', 1, 'admin', '研发部门', '/system/config/data/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 14:08:05', 37);
INSERT INTO `sys_oper_log` VALUES (545, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:08:05', 4);
INSERT INTO `sys_oper_log` VALUES (546, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.removeData()', 'DELETE', 1, 'admin', '研发部门', '/system/config/data/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 14:08:20', 42);
INSERT INTO `sys_oper_log` VALUES (547, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:08:21', 3);
INSERT INTO `sys_oper_log` VALUES (548, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:09:29', 4);
INSERT INTO `sys_oper_log` VALUES (549, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:13:33', 4);
INSERT INTO `sys_oper_log` VALUES (550, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:13:49', 4);
INSERT INTO `sys_oper_log` VALUES (551, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:14:13', 3);
INSERT INTO `sys_oper_log` VALUES (552, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:15:13', 7);
INSERT INTO `sys_oper_log` VALUES (553, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:15:55', 3);
INSERT INTO `sys_oper_log` VALUES (554, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:16:27', 3);
INSERT INTO `sys_oper_log` VALUES (555, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:19:01', 6);
INSERT INTO `sys_oper_log` VALUES (556, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:19:53', 3);
INSERT INTO `sys_oper_log` VALUES (557, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:20:14', 3);
INSERT INTO `sys_oper_log` VALUES (558, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:31:23', 7);
INSERT INTO `sys_oper_log` VALUES (559, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 14:44:51', 7);
INSERT INTO `sys_oper_log` VALUES (560, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:01:05', 6);
INSERT INTO `sys_oper_log` VALUES (561, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:03:01', 10);
INSERT INTO `sys_oper_log` VALUES (562, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:06:55', 4);
INSERT INTO `sys_oper_log` VALUES (563, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:15:15', 9);
INSERT INTO `sys_oper_log` VALUES (564, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:15:33', 4);
INSERT INTO `sys_oper_log` VALUES (565, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:19:49', 7);
INSERT INTO `sys_oper_log` VALUES (566, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:21:31', 6);
INSERT INTO `sys_oper_log` VALUES (567, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:22:21', 4);
INSERT INTO `sys_oper_log` VALUES (568, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:24:11', 5);
INSERT INTO `sys_oper_log` VALUES (569, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:27:29', 4);
INSERT INTO `sys_oper_log` VALUES (570, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:28:36', 3);
INSERT INTO `sys_oper_log` VALUES (571, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 15:33:19', 4);
INSERT INTO `sys_oper_log` VALUES (572, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:12:29', 2);
INSERT INTO `sys_oper_log` VALUES (573, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 16:12:50', 3);
INSERT INTO `sys_oper_log` VALUES (574, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:22:52', 3);
INSERT INTO `sys_oper_log` VALUES (575, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:26:08', 4);
INSERT INTO `sys_oper_log` VALUES (576, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:26:43', 2);
INSERT INTO `sys_oper_log` VALUES (577, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:27:33', 4);
INSERT INTO `sys_oper_log` VALUES (578, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:28:02', 2);
INSERT INTO `sys_oper_log` VALUES (579, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:31:27', 4);
INSERT INTO `sys_oper_log` VALUES (580, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:32:49', 3);
INSERT INTO `sys_oper_log` VALUES (581, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:33:01', 2);
INSERT INTO `sys_oper_log` VALUES (582, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:37:28', 9);
INSERT INTO `sys_oper_log` VALUES (583, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:46:20', 5);
INSERT INTO `sys_oper_log` VALUES (584, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:47:30', 5);
INSERT INTO `sys_oper_log` VALUES (585, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:53:45', 10);
INSERT INTO `sys_oper_log` VALUES (586, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 16:59:23', 10);
INSERT INTO `sys_oper_log` VALUES (587, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:00:51', 14);
INSERT INTO `sys_oper_log` VALUES (588, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:01:19', 5);
INSERT INTO `sys_oper_log` VALUES (589, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:02:53', 5);
INSERT INTO `sys_oper_log` VALUES (590, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:03:10', 4);
INSERT INTO `sys_oper_log` VALUES (591, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:03:11', 4);
INSERT INTO `sys_oper_log` VALUES (592, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:03:38', 3);
INSERT INTO `sys_oper_log` VALUES (593, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:05:05', 3);
INSERT INTO `sys_oper_log` VALUES (594, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:07:52', 3);
INSERT INTO `sys_oper_log` VALUES (595, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:09:45', 6);
INSERT INTO `sys_oper_log` VALUES (596, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:11:32', 5);
INSERT INTO `sys_oper_log` VALUES (597, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:13:03', 4);
INSERT INTO `sys_oper_log` VALUES (598, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:14:28', 7);
INSERT INTO `sys_oper_log` VALUES (599, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:16:56', 6);
INSERT INTO `sys_oper_log` VALUES (600, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:17:28', 3);
INSERT INTO `sys_oper_log` VALUES (601, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:17:56', 5);
INSERT INTO `sys_oper_log` VALUES (602, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:21:02', 3);
INSERT INTO `sys_oper_log` VALUES (603, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:21:06', 3);
INSERT INTO `sys_oper_log` VALUES (604, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:21:12', 5);
INSERT INTO `sys_oper_log` VALUES (605, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.removeData()', 'DELETE', 1, 'admin', '研发部门', '/system/config/data/27', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 17:21:23', 84);
INSERT INTO `sys_oper_log` VALUES (606, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:21:23', 3);
INSERT INTO `sys_oper_log` VALUES (607, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 17:21:35', 4);
INSERT INTO `sys_oper_log` VALUES (608, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 17:21:42', 3);
INSERT INTO `sys_oper_log` VALUES (609, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 17:21:50', 3);
INSERT INTO `sys_oper_log` VALUES (610, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addData()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"column1\":\"Documnet\",\"column2\":\"Photocatalytic Material\",\"column3\":\"Highest Photocatalytic Activity\",\"column4\":\"Cocatalyst\",\"column5\":\"Sacrificial Reagent\",\"configName\":\"化学\",\"configType\":\"Y\",\"createBy\":\"admin\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 17:24:39', 59);
INSERT INTO `sys_oper_log` VALUES (611, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:24:40', 2);
INSERT INTO `sys_oper_log` VALUES (612, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:24:47', 3);
INSERT INTO `sys_oper_log` VALUES (613, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":131,\"data1\":\"Chem.Commun.2023\",\"data2\":\"Na2S-Na2SO3 solution\",\"data3\":\"Rhodium(Rh)\",\"data4\":\"AQY 18% at 420 nm\",\"data5\":\"Co-doped La5Ti2Cu0.9Ag0.1O7S5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 17:26:11', 55);
INSERT INTO `sys_oper_log` VALUES (614, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:26:13', 2);
INSERT INTO `sys_oper_log` VALUES (615, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:26:20', 3);
INSERT INTO `sys_oper_log` VALUES (616, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:26:23', 2);
INSERT INTO `sys_oper_log` VALUES (617, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":131,\"data1\":\"Joule 2023\",\"data5\":\"LTCA:MgAI(modified La5)\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 17:27:11', 78);
INSERT INTO `sys_oper_log` VALUES (618, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:27:13', 2);
INSERT INTO `sys_oper_log` VALUES (619, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:27:18', 2);
INSERT INTO `sys_oper_log` VALUES (620, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:28:22', 4);
INSERT INTO `sys_oper_log` VALUES (621, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addNewData()', 'POST', 1, 'admin', '研发部门', '/system/config/addOne', '127.0.0.1', '内网IP', '{\"configId\":131,\"data1\":\"Adv.Energy Mater.2023\",\"data2\":\"Not specified\",\"data3\":\"FeNiCoOx\",\"data4\":\"STH = 12.1%\",\"data5\":\"Nanostructured Ta3N5(nanorods and thin films)\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 17:29:57', 51);
INSERT INTO `sys_oper_log` VALUES (622, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:29:59', 3);
INSERT INTO `sys_oper_log` VALUES (623, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:30:20', 2);
INSERT INTO `sys_oper_log` VALUES (624, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:31:37', 4);
INSERT INTO `sys_oper_log` VALUES (625, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/05/07/OIP-C_20240507173348A001.jpg\",\"code\":200}', 0, NULL, '2024-05-07 17:33:48', 115);
INSERT INTO `sys_oper_log` VALUES (626, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:34:04', 6);
INSERT INTO `sys_oper_log` VALUES (627, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 17:36:50', 3);
INSERT INTO `sys_oper_log` VALUES (628, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-07 17:37:13', 5);
INSERT INTO `sys_oper_log` VALUES (629, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:38:30', 3);
INSERT INTO `sys_oper_log` VALUES (630, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{}}', 0, NULL, '2024-05-07 17:38:39', 3);
INSERT INTO `sys_oper_log` VALUES (631, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 17:38:45', 111);
INSERT INTO `sys_oper_log` VALUES (632, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/config/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-07 17:38:48', 85);
INSERT INTO `sys_oper_log` VALUES (633, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-07 17:38:49', 3);
INSERT INTO `sys_oper_log` VALUES (634, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:42:33', 6);
INSERT INTO `sys_oper_log` VALUES (635, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:43:23', 6);
INSERT INTO `sys_oper_log` VALUES (636, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:47:23', 4);
INSERT INTO `sys_oper_log` VALUES (637, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:47:31', 3);
INSERT INTO `sys_oper_log` VALUES (638, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 17:47:37', 3);
INSERT INTO `sys_oper_log` VALUES (639, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:06:25', 11);
INSERT INTO `sys_oper_log` VALUES (640, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:23:09', 9);
INSERT INTO `sys_oper_log` VALUES (641, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:23:28', 6);
INSERT INTO `sys_oper_log` VALUES (642, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:29:05', 5);
INSERT INTO `sys_oper_log` VALUES (643, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:29:07', 3);
INSERT INTO `sys_oper_log` VALUES (644, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:30:52', 5);
INSERT INTO `sys_oper_log` VALUES (645, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:34:11', 4);
INSERT INTO `sys_oper_log` VALUES (646, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:34:56', 4);
INSERT INTO `sys_oper_log` VALUES (647, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:34:58', 3);
INSERT INTO `sys_oper_log` VALUES (648, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:35:00', 4);
INSERT INTO `sys_oper_log` VALUES (649, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:35:22', 3);
INSERT INTO `sys_oper_log` VALUES (650, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:35:40', 4);
INSERT INTO `sys_oper_log` VALUES (651, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:35:50', 2);
INSERT INTO `sys_oper_log` VALUES (652, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:35:57', 3);
INSERT INTO `sys_oper_log` VALUES (653, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:36:02', 3);
INSERT INTO `sys_oper_log` VALUES (654, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-07 18:36:04', 4);
INSERT INTO `sys_oper_log` VALUES (655, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:32:21', 4);
INSERT INTO `sys_oper_log` VALUES (656, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:34:06', 4);
INSERT INTO `sys_oper_log` VALUES (657, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:34:09', 5);
INSERT INTO `sys_oper_log` VALUES (658, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:34:18', 3);
INSERT INTO `sys_oper_log` VALUES (659, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:34:22', 3);
INSERT INTO `sys_oper_log` VALUES (660, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-08 09:34:26', 2);
INSERT INTO `sys_oper_log` VALUES (661, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-08 09:35:15', 3);
INSERT INTO `sys_oper_log` VALUES (662, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-08 09:39:16', 5);
INSERT INTO `sys_oper_log` VALUES (663, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-08 09:39:18', 2);
INSERT INTO `sys_oper_log` VALUES (664, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-08 09:39:19', 2);
INSERT INTO `sys_oper_log` VALUES (665, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:42:32', 4);
INSERT INTO `sys_oper_log` VALUES (666, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:42:55', 2);
INSERT INTO `sys_oper_log` VALUES (667, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:43:57', 4);
INSERT INTO `sys_oper_log` VALUES (668, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:44:30', 2);
INSERT INTO `sys_oper_log` VALUES (669, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:44:36', 4);
INSERT INTO `sys_oper_log` VALUES (670, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-08 09:44:40', 4);
INSERT INTO `sys_oper_log` VALUES (671, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"最高光催化活性\",\"column2\":\"时代的\"}}', 0, NULL, '2024-05-08 09:44:45', 3);
INSERT INTO `sys_oper_log` VALUES (672, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:44:49', 5);
INSERT INTO `sys_oper_log` VALUES (673, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:45:26', 3);
INSERT INTO `sys_oper_log` VALUES (674, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:45:31', 2);
INSERT INTO `sys_oper_log` VALUES (675, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:45:37', 3);
INSERT INTO `sys_oper_log` VALUES (676, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-08 09:45:41', 2);
INSERT INTO `sys_oper_log` VALUES (677, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/130', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"11\",\"column12\":\"挺好让他\",\"column11\":\"突然人\",\"column10\":\"他人我\",\"column5\":\"是的阿萨\",\"column4\":\"撒打算\",\"column3\":\"撒啊\",\"column2\":\"2222\",\"column9\":\"儿童二\",\"column8\":\"十分发\",\"column7\":\" 阿德 \",\"column6\":\"撒阿萨阿瑟东\"}}', 0, NULL, '2024-05-08 09:45:51', 2);
INSERT INTO `sys_oper_log` VALUES (678, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.getsColumns()', 'GET', 1, 'admin', '研发部门', '/system/config/columns/131', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"column1\":\"Documnet\",\"column5\":\"Sacrificial Reagent\",\"column4\":\"Cocatalyst\",\"column3\":\"Highest Photocatalytic Activity\",\"column2\":\"Photocatalytic Material\"}}', 0, NULL, '2024-05-08 09:45:55', 4);
INSERT INTO `sys_oper_log` VALUES (679, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"合肥工业大学\",\"email\":\"123@qq.com\",\"leader\":\"admin\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-08 09:47:39', 93);
INSERT INTO `sys_oper_log` VALUES (680, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"计算机学院\",\"email\":\"123@qq.com\",\"leader\":\"admin\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"合肥工业大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-08 09:47:50', 53);
INSERT INTO `sys_oper_log` VALUES (681, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-08 09:47:59', 58);
INSERT INTO `sys_oper_log` VALUES (682, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-08 09:48:03', 39);
INSERT INTO `sys_oper_log` VALUES (683, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"111\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-08 09:48:47', 47);
INSERT INTO `sys_oper_log` VALUES (684, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/201', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-08 09:48:52', 41);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-03-05 14:49:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-03-05 14:49:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-03-05 14:49:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-03-05 14:49:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-03-05 14:49:42', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-05 14:49:42', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', '123@163.com', '15888888888', '0', '/profile/avatar/2024/05/07/OIP-C_20240507173348A001.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-08 09:31:02', 'admin', '2024-03-05 14:49:41', '', '2024-05-08 09:31:02', '管理员');
INSERT INTO `sys_user` VALUES (100, 100, 'test', 'test', '00', '', '', '0', '', '$2a$10$TxnYNVQVZI1wVVwa.HZh0emwJFvEN5SlU6gNpFPCJ1iHS2y8eaCU6', '0', '0', '127.0.0.1', '2024-03-05 16:22:45', 'admin', '2024-03-05 16:19:57', 'admin', '2024-03-05 16:22:44', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);

SET FOREIGN_KEY_CHECKS = 1;
