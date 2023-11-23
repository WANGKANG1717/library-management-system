package com.example.controller;

import com.example.constants.SystemConstants;
import com.example.domain.ResponseResult;
import com.example.domain.dto.UserDto;
import com.example.domain.entity.User;
import com.example.service.UserService;
import com.example.utils.BeanCopyUtils;
import com.example.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("system/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public ResponseResult listUser(Integer pageNum, Integer pageSize, String userName, String status, String type) {
        return userService.listUser(pageNum, pageSize, userName, status, type);
    }

    @PostMapping
    public ResponseResult addUser(@RequestBody UserDto userDto) {
        User user = BeanCopyUtils.copyBean(userDto, User.class);
        user.setId(null);
//        user.setType(SystemConstants.ADMIN);
        return userService.addUser(user);
    }

    @DeleteMapping("/{id}")
    public ResponseResult deleteUser(@PathVariable("id") Long id) {
        return userService.deleteUser(id);
    }

    @GetMapping("/{id}")
    public ResponseResult getUserDetail(@PathVariable("id") Long id) {
        return userService.getUserDetail(id);
    }

    @GetMapping()
    public ResponseResult getCurrentUserDetail() {
        Long userId = SecurityUtils.getUserId();
        return userService.getUserDetail(userId);
    }

    @PutMapping
    public ResponseResult updateUser(@RequestBody UserDto userDto) {
        return userService.updateUser(userDto);
    }
}
