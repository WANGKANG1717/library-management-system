package com.example.controller;

import com.example.domain.ResponseResult;
import com.example.domain.dto.UserDto;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("/{id}")
    public ResponseResult getUserDetail(@PathVariable("id") Long id) {
        return userService.getUserDetail(id);
    }

    @PutMapping
    public ResponseResult updateUser(@RequestBody UserDto userDto) {
        return userService.updateUser(userDto);
    }
}
