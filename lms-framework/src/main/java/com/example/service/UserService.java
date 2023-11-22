package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.domain.ResponseResult;
import com.example.domain.dto.UserDto;
import com.example.domain.entity.User;

/**
 * 用户表(User)表服务接口
 *
 * @author WANGKANG
 * @since 2023-10-23 14:34:41
 */
public interface UserService extends IService<User> {
    ResponseResult listUser(Integer pageNum, Integer pageSize, String userName, String status, String type);

    ResponseResult addUser(User user);

    ResponseResult deleteUser(Long id);

    ResponseResult getUserDetail(Long id);

    ResponseResult updateUser(UserDto userDto);
}

