package com.example.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto  {
    // 主键
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
}
