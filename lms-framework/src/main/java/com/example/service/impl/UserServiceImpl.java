package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.domain.ResponseResult;
import com.example.domain.dto.UserDto;
import com.example.domain.entity.User;
import com.example.domain.vo.PageVo;
import com.example.domain.vo.UserDetailVo;
import com.example.enums.AppHttpCodeEnum;
import com.example.exception.SystemException;
import com.example.mapper.UserMapper;
import com.example.service.UserService;
import com.example.utils.BeanCopyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 用户表(User)表服务实现类
 *
 * @author WANGKANG
 * @since 2023-10-23 14:34:41
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public ResponseResult listUser(Integer pageNum, Integer pageSize, String userName, String status, String type) {
        // 可以根据用户名模糊搜索
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.hasText(userName), User::getUserName, userName);
        queryWrapper.eq(StringUtils.hasText(status), User::getStatus, status);
        queryWrapper.eq(StringUtils.hasText(type), User::getType, type);
        // 可以进行状态的查询
        queryWrapper.eq(StringUtils.hasText(status), User::getStatus, status);
        // 需要用户分页列表接口
        Page page = new Page(pageNum, pageSize);
        page(page, queryWrapper);
        // 封装数据返回
        List<UserDetailVo> userDetailVos = BeanCopyUtils.copyBeanList(page.getRecords(), UserDetailVo.class);
        PageVo pageVo = new PageVo(userDetailVos, page.getTotal());
        return ResponseResult.okResult(pageVo);
    }

    @Override
    public ResponseResult addUser(UserDto userDto) {
        User user = BeanCopyUtils.copyBean(userDto, User.class);
        user.setId(null);
        // user.setType(SystemConstants.ADMIN);
        // 对数据进行非空判断
        if (!StringUtils.hasText(user.getNumber())) {
            throw new SystemException(AppHttpCodeEnum.NUMBER_NOT_NULL1);
        }
        if (!StringUtils.hasText(user.getUserName())) {
            throw new SystemException(AppHttpCodeEnum.USERNAME_NOT_NULL);
        }
        if (!StringUtils.hasText(user.getPassword())) {
            throw new SystemException(AppHttpCodeEnum.PASSWORD_NOT_NULL);
        }
        // 对数据是否存在的判断
        if (numberExist(user.getNumber())) {
            throw new SystemException(AppHttpCodeEnum.NUMBER_EXISTS);
        }
        if (userNameExist(user.getUserName())) {
            throw new SystemException(AppHttpCodeEnum.USERNAME_EXIST);
        }
        // 密码加密
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        save(user);
        return ResponseResult.okResult();
    }

    @Override
    public ResponseResult deleteUser(Long id) {
        removeById(id);
        return ResponseResult.okResult();
    }

    @Override
    public ResponseResult getUserDetail(Long id) {
        User user = getById(id);
        if (user == null) {
            return ResponseResult.okResult();
        }
        UserDetailVo userDetailVo = BeanCopyUtils.copyBean(user, UserDetailVo.class);
        return ResponseResult.okResult(userDetailVo);
    }

    @Override
    public ResponseResult updateUser(UserDto userDto) {
        User user = BeanCopyUtils.copyBean(userDto, User.class);
        // 对数据进行非空判断
        // if (!StringUtils.hasText(user.getNumber())) {
        //     throw new SystemException(AppHttpCodeEnum.NUMBER_NOT_NULL1);
        // }
        // if (!StringUtils.hasText(user.getUserName())) {
        //     throw new SystemException(AppHttpCodeEnum.USERNAME_NOT_NULL);
        // }
        // if (!StringUtils.hasText(user.getPassword())) {
        //     throw new SystemException(AppHttpCodeEnum.PASSWORD_NOT_NULL);
        // }
        // 对数据是否存在的判断
        if (numberExist(user.getNumber())) {
            throw new SystemException(AppHttpCodeEnum.NUMBER_EXISTS);
        }
        if (userNameExist(user.getUserName())) {
            throw new SystemException(AppHttpCodeEnum.USERNAME_EXIST);
        }
        if (user.getPassword() != null) {
            String encodePassword = passwordEncoder.encode(user.getPassword());
            user.setPassword(encodePassword);
        }
        updateById(user);
        return ResponseResult.okResult();
    }

    private boolean numberExist(String number) {
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getNumber, number);
        return count(queryWrapper) > 0;
    }

    private boolean userNameExist(String userName) {
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getUserName, userName);
        return count(queryWrapper) > 0;
    }
}
