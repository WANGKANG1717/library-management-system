package org.example.utils;

import org.example.domain.entity.LoginUser;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtils {

    /**
     * 获取用户
     **/
    public static LoginUser getLoginUser() {
        return (LoginUser) getAuthentication().getPrincipal();
    }

    /**
     * 获取Authentication
     */
    public static Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    public static Boolean isAdmin() {
        Long id = getLoginUser().getUser().getId();
        return id != null && 1L == id;   // TODO 这里用来判断是否是管理员的方法可能不是很好，需要进一步完善
    }

    public static Long getUserId() {
        return getLoginUser().getUser().getId();
    }
}