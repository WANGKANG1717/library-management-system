package org.example.controller;

import org.example.domain.ResponseResult;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static org.example.constants.SystemConstants.ADMIN;

@RestController
@RequestMapping("system/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public ResponseResult listUser(Integer pageNum, Integer pageSize, String userName,  String status) {
        return userService.listUser(pageNum, pageSize, userName, status, ADMIN);
    }

    // @PostMapping
    // public ResponseResult addUser(@RequestBody AddUserDto addUserDto) {
    //     return userService.addUser(addUserDto);
    // }
    //
    // @DeleteMapping("/{id}")
    // public ResponseResult deleteUser(@PathVariable("id") Long id) {
    //     return userService.deleteUser(id);
    // }
    //
    // @GetMapping("/{id}")
    // public ResponseResult getUserDetail(@PathVariable("id") Long id) {
    //     return userService.getUserDetail(id);
    // }
    //
    // @PutMapping
    // public ResponseResult updateUser(@RequestBody UpdateUserDto updateUserDto) {
    //     return userService.updateUser(updateUserDto);
    // }
}
