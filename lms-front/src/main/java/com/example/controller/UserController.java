package com.example.controller;

import com.example.constants.SystemConstants;
import com.example.domain.ResponseResult;
import com.example.domain.dto.UserDto;
import com.example.domain.entity.User;
import com.example.service.UserService;
import com.example.utils.BeanCopyUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user")
@Tag(name = "用户", description = "用户相关接口")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    @Operation(summary = "根据id拿到用户详细信息")
    public ResponseResult getLoginUserDetail() {
        return userService.getLoginUserDetail();
    }

    @PostMapping
    @Operation(summary = "添加普通用户")
    public ResponseResult addUser(@RequestBody UserDto userDto) {
        User user = BeanCopyUtils.copyBean(userDto, User.class);
        user.setId(null);
        user.setType(SystemConstants.NORMAL);
        return userService.addUser(user);
    }

    @GetMapping("/{id}")
    @Operation(summary = "根据id拿到用户详细信息")
    public ResponseResult getUserDetail(@PathVariable("id") Long id) {
        return userService.getUserDetail(id);
    }

    @PutMapping
    @Operation(summary = "更新用户信息")
    @Parameters(
            @Parameter(name = "userDto", description = "需要传一个userDto实体")
    )
    public ResponseResult updateUser(@RequestBody UserDto userDto) {
        return userService.updateUser(userDto);
    }
}
