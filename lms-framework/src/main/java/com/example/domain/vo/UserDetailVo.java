package com.example.domain.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDetailVo {
    // 主键
    @TableId
    private Long id;

    // 工号 / 学号
    private String number;
    // 用户名
    private String userName;
    // 用户类型：0代表普通用户，1代表管理员
    private String type;
    // 账号状态（0正常 1停用）
    private String status;
    // 邮箱
    private String email;
    // 手机号
    private String phone;
    // 地址
    private String address;
    // 用户性别（0男，1女，2未知）
    private String sex;
    // 头像
    private String avatar;
    private Long updateBy;
    // 更新时间
    private Date updateTime;
        // 剩余借阅次数
    private Integer remainingTimes;
    // 最大借阅次数 默认为6
    private Integer maxBorrowTimes;
    // 当前借阅数
    private Integer currentBorrowTimes;
    // 总借阅数
    private Integer totalBorrowTimes;
    // 总逾期数
    private Integer overdueBorrowTimes;
}
