package org.example.service.impl;

import com.baomidou.mybatisplus.core.injector.methods.SelectById;
import com.baomidou.mybatisplus.core.injector.methods.SelectByMap;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.constants.SystemConstants;
import org.example.domain.ResponseResult;
import org.example.domain.entity.LoginUser;
import org.example.domain.entity.User;
import org.example.enums.AppHttpCodeEnum;
import org.example.mapper.UserMapper;
import org.example.service.LoginService;
import org.example.utils.JwtUtil;
import org.example.utils.RedisCache;
import org.example.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SystemLoginServiceImpl extends ServiceImpl<UserMapper, User> implements LoginService {
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;

    @Override
    public ResponseResult login(User user) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("number",user.getNumber());
        map.put("type", SystemConstants.ADMIN);
        List<User> list = getBaseMapper().selectByMap(map);
        if (list.size() == 0) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NUMBER_NOT_EXISTS);
        }

        String username = list.get(0).getUserName();
        String password = user.getPassword();

        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username,password);
        Authentication authenticate = authenticationManager.authenticate(authenticationToken);

        // 判断是否认证通过
        if (Objects.isNull(authenticate)) {
            throw new RuntimeException("用户名或密码错误");
        }
        // 获取UserId生成token
        LoginUser loginUser = (LoginUser) authenticate.getPrincipal();
        String userId = loginUser.getUser().getId().toString();
        String jwt = JwtUtil.createJWT(userId);
        // 把用户信息存入redis
        redisCache.setCacheObject("login:" + userId, loginUser);
        // 把token封装返回
        Map<String, String> map_return = new HashMap<>();
        map_return.put("token", jwt);

        return ResponseResult.okResult(map_return);
    }

    @Override
    public ResponseResult logout() {
        // 获取当前登录用户的id
        Long userId = SecurityUtils.getUserId();
        // 删除redis中对应的值
        redisCache.deleteObject("login:" + userId);
        return ResponseResult.okResult();
    }
}
