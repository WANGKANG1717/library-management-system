package org.example.domain.entity;

import java.util.Date;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 用户表(User)表实体类
 *
 * @author WANGKANG
 * @since 2023-10-23 14:44:07
 */
@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("user")
public class User  {
    // 主键    
    @TableId
    private Long id;

    // 工号 / 学号
    private String number;
    // 用户名
    private String userName;
    // 密码
    private String password;
    // 头像
    private String avatar;
    // 用户性别（0男，1女，2未知）
    private String sex;
    // 用户类型：0代表普通用户，1代表管理员
    private String type;
    // 手机号
    private String phone;
    // 邮箱
    private String email;
    // 地址
    private String address;
    // 账号状态（0正常 1停用）
    private String status;
    // 创建人的用户id
    private Long createBy;
    // 创建时间
    private Date createTime;
    // 更新人
    private Long updateBy;
    // 更新时间
    private Date updateTime;
    // 删除标志（0代表未删除，1代表已删除）
    private Integer delFlag;
    // 剩余借阅次数
    private Integer remainingTimes;
}
