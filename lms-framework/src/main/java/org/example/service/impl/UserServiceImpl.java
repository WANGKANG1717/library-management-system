package org.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.domain.ResponseResult;
import org.example.domain.entity.User;
import org.example.domain.vo.PageVo;
import org.example.domain.vo.UserDetailVo;
import org.example.mapper.UserMapper;
import org.example.service.UserService;
import org.example.utils.BeanCopyUtils;
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
    @Override
    public ResponseResult listUser(Integer pageNum, Integer pageSize, String userName, String status, String type) {
        // 可以根据用户名模糊搜索
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<User>();
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
}
