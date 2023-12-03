package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.constants.SystemConstants;
import com.example.domain.ResponseResult;
import com.example.domain.entity.LoginUser;
import com.example.domain.entity.User;
import com.example.enums.AppHttpCodeEnum;
import com.example.mapper.UserMapper;
import com.example.service.LoginService;
import com.example.utils.TokenUtil;
import com.example.utils.RedisCache;
import com.example.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class SystemLoginServiceImpl extends ServiceImpl<UserMapper, User> implements LoginService {
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;

    @Override
    @Transactional
    public ResponseResult login(User user) {
        if (!StringUtils.hasText(user.getNumber())) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NUMBER_NOT_NULL3);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("number", user.getNumber());
        if (!Objects.isNull(user.getType())) {
            map.put("type", user.getType());
        }
        List<User> list = getBaseMapper().selectByMap(map);
        if (list.size() == 0) {
            if (user.getType() == SystemConstants.ADMIN) {
                return ResponseResult.errorResult(AppHttpCodeEnum.NUMBER_NOT_EXISTS);
            } else if (user.getType() == SystemConstants.NORMAL) {
                return ResponseResult.errorResult(AppHttpCodeEnum.NUMBER_NOT_EXISTS2);
            } else {
                return ResponseResult.errorResult(AppHttpCodeEnum.NUMBER_NOT_EXISTS3);
            }
        }

        String username = list.get(0).getUserName();
        String password = user.getPassword();

        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authenticate = authenticationManager.authenticate(authenticationToken);

        // 判断是否认证通过
        if (Objects.isNull(authenticate)) {
            throw new RuntimeException("用户名或密码错误");
        }
        // 获取UserId生成token
        LoginUser loginUser = (LoginUser) authenticate.getPrincipal();
        String userId = loginUser.getUser().getId().toString();
        String jwt = TokenUtil.genAccessToken(userId);
        // 把用户信息存入redis
        redisCache.setCacheObject("login:" + userId, loginUser);
        // 把token封装返回
        Map<String, String> map_return = new HashMap<>();
        map_return.put("token", jwt);

        return ResponseResult.okResult(map_return);
    }

    @Override
    @Transactional
    public ResponseResult logout() {
        // 获取当前登录用户的id
        Long userId = SecurityUtils.getUserId();
        // 删除redis中对应的值
        redisCache.deleteObject("login:" + userId);
        return ResponseResult.okResult();
    }
}
