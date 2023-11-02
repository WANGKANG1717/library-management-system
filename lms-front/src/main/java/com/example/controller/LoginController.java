package com.example.controller;

import com.example.constants.SystemConstants;
import com.example.domain.ResponseResult;
import com.example.domain.dto.UserDto;
import com.example.domain.entity.User;
import com.example.enums.AppHttpCodeEnum;
import com.example.exception.SystemException;
import com.example.service.LoginService;
import com.example.utils.BeanCopyUtils;
import com.example.utils.RedisCache;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Tag(name = "登录", description = "登录相关接口")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private RedisCache redisCache;

    @PostMapping("/user/login")
    @Operation(summary = "登录接口")
    @Parameters(
            @Parameter(name = "userDto", description = "需要传两个参数number, password， 形式{ \"number\": 0, \"password\": 0 }")
    )
    public ResponseResult login(@RequestBody UserDto userDto) {
        if (!StringUtils.hasText(userDto.getNumber())) {
            // 提示 需要传工号
            throw new SystemException(AppHttpCodeEnum.NUMBER_NOT_NULL1);
        }
        if (!StringUtils.hasText(userDto.getPassword())) {
             // 提示 需要传工号
            throw new SystemException(AppHttpCodeEnum.PASSWORD_NOT_NULL);
        }
        User user = BeanCopyUtils.copyBean(userDto, User.class);
        user.setType(SystemConstants.NORMAL);
        return loginService.login(user);
    }
    @PostMapping("/user/logout")
    @Operation(summary = "登出接口，需要在网络请求headers里面带上token")
    public ResponseResult logout() {
        return loginService.logout();
    }
}
