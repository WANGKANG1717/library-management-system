package org.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.example.domain.ResponseResult;
import org.example.domain.entity.User;

public interface LoginService extends IService<User> {
    ResponseResult login(User user);

    ResponseResult logout();
}
