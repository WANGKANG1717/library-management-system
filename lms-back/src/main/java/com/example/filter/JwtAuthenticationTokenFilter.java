package com.example.filter;

import com.alibaba.fastjson2.JSON;
import com.example.domain.ResponseResult;
import com.example.domain.entity.LoginUser;
import com.example.enums.AppHttpCodeEnum;
import com.example.utils.RedisCache;
import com.example.utils.TokenUtil;
import com.example.utils.WebUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Objects;

@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private RedisCache redisCache;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        // 获取请求头中的token
        String token = request.getHeader("token");
        if (!StringUtils.hasText(token)) {
            // 说明该接口不需要登录  直接放行
            filterChain.doFilter(request, response);
            return;
        }
        // 解析获取userid
        Claims claims = null;
        try {
            claims = TokenUtil.parsePayload(token);
        } catch (Exception e) {
            e.printStackTrace();
            // token超时  token非法
            // 响应告诉前端需要重新登录
            System.out.println("异常1");
            ResponseResult result = ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
            WebUtils.renderString(response, JSON.toJSONString(result));
            return;
        }
        String userId = (String) claims.get("userId");
        // 从redis中获取用户信息
        LoginUser loginUser = redisCache.getCacheObject("login:" + userId);
        // 如果获取不到
        if (Objects.isNull(loginUser)) {
            System.out.println("异常2");
            // 说明登录过期  提示重新登录
            ResponseResult result = ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
            WebUtils.renderString(response, JSON.toJSONString(result));
            return;
        }
        // 存入SecurityContextHolder
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(loginUser, null, null);
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        //
        filterChain.doFilter(request, response);
    }
}