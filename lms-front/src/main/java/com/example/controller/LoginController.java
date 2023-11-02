package com.example.controller;

import com.example.constants.SystemConstants;
import com.example.domain.ResponseResult;
import com.example.domain.entity.User;
import com.example.enums.AppHttpCodeEnum;
import com.example.exception.SystemException;
import com.example.service.LoginService;
import com.example.utils.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private RedisCache redisCache;

    @PostMapping("/user/login")
    public ResponseResult login(@RequestBody User user) {
        if (!StringUtils.hasText(user.getNumber())) {
            // 提示 需要传工号
            throw new SystemException(AppHttpCodeEnum.NUMBER_NOT_NULL1);
        }
        if (!StringUtils.hasText(user.getPassword())) {
             // 提示 需要传工号
            throw new SystemException(AppHttpCodeEnum.PASSWORD_NOT_NULL);
        }
        user.setType(SystemConstants.NORMAL);
        return loginService.login(user);
    }
    @PostMapping("/user/logout")
    public ResponseResult logout() {
        return loginService.logout();
    }
}
