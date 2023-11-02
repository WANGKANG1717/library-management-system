package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.domain.ResponseResult;
import com.example.domain.entity.User;

public interface LoginService extends IService<User> {
    ResponseResult login(User user);

    ResponseResult logout();
}
