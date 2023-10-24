package org.example.controller;

import org.example.domain.ResponseResult;
import org.example.domain.entity.LoginUser;
import org.example.domain.entity.User;
import org.example.enums.AppHttpCodeEnum;
import org.example.exception.SystemException;
import org.example.service.LoginService;
import org.example.utils.BeanCopyUtils;
import org.example.utils.RedisCache;
import org.example.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
        return loginService.login(user);
    }
    @PostMapping("/user/logout")
    public ResponseResult logout() {
        return loginService.logout();
    }
}
