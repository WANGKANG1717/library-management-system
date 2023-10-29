package org.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.injector.methods.SelectList;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.constants.SystemConstants;
import org.example.domain.ResponseResult;
import org.example.domain.dto.BorrowHistoryDto;
import org.example.domain.entity.Book;
import org.example.domain.entity.BorrowHistory;
import org.example.domain.entity.LoginUser;
import org.example.domain.entity.User;
import org.example.domain.vo.*;
import org.example.enums.AppHttpCodeEnum;
import org.example.mapper.BorrowHistoryMapper;
import org.example.service.BookService;
import org.example.service.BorrowHistoryService;
import org.example.service.UserService;
import org.example.utils.BeanCopyUtils;
import org.example.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * (BorrowHistory)表服务实现类
 *
 * @author WANGKANG
 * @since 2023-10-25 17:11:41
 */

@Service("borrowHistoryService")
public class BorrowHistoryServiceImpl extends ServiceImpl<BorrowHistoryMapper, BorrowHistory> implements BorrowHistoryService {
    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;

    @Override
    public ResponseResult getBorrowHistory(Integer pageNum, Integer pageSize, Long userId, String borrowStatus) {
        // 获取当前登录的用户
        User loginUser = SecurityUtils.getLoginUser().getUser();
        // 如果是普通用户需要先判断当前用户是不是登录用户
        if (Objects.equals(loginUser.getType(), SystemConstants.NORMAL)) {
            if (!Objects.equals(loginUser.getId(), userId)) {
                return ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
            }
        }
        // 可以根据用户名模糊搜索
        LambdaQueryWrapper<BorrowHistory> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(BorrowHistory::getUserId, userId);
        queryWrapper.like(StringUtils.hasText(borrowStatus), BorrowHistory::getBorrowStatus, borrowStatus);

        Page page = new Page(pageNum, pageSize);
        page(page, queryWrapper);
        List borrowHistoryVos = BeanCopyUtils.copyBeanList(page.getRecords(), BorrowHistoryVo.class);
        PageVo pageVo = new PageVo(borrowHistoryVos, page.getTotal());
        return ResponseResult.okResult(pageVo);
    }

    @Override
    @Transactional
    public ResponseResult addBorrowHistory(BorrowHistoryDto borrowHistoryDto) {
        // 注意 借书的时候，需要确保当前登录用户和借书id一致
        // 获取当前登录的用户
        User loginUser = SecurityUtils.getLoginUser().getUser();
        // 如果是普通用户需要先判断当前用户是不是登录用户
        if (!Objects.equals(loginUser.getId(), borrowHistoryDto.getUserId())) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
        }
        // 在借书之前，要看下读者之前有没有借过形同id的书
        BorrowHistory borrowHistory = BeanCopyUtils.copyBean(borrowHistoryDto, BorrowHistory.class);
        LambdaQueryWrapper<BorrowHistory> queryWrapper = new LambdaQueryWrapper<BorrowHistory>();
        queryWrapper.eq(BorrowHistory::getUserId, borrowHistory.getUserId());
        queryWrapper.eq(BorrowHistory::getBookId, borrowHistory.getBookId());
        BorrowHistory tmp = getBaseMapper().selectOne(queryWrapper);
        if (!Objects.equals(tmp, null)) {
            return ResponseResult.errorResult(AppHttpCodeEnum.ALEARDY_BORROW);
        }

        // 查找用户，判断是否还有借书次数
        User user = userService.getById(borrowHistory.getUserId());
        // 更新用户的借阅信息
        if (user.getRemainingTimes() == 0) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NO_REMAININGTIMES);
        }
        user.setRemainingTimes(user.getRemainingTimes() - 1);
        userService.updateById(user);

        // 更新图书的库存信息
        Book book = bookService.getById(borrowHistory.getBookId());
        if (book.getInventory() == 0) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NO_INVENTORY);
        }
        book.setInventory(book.getInventory() - 1);
        bookService.updateById(book);
        //
        borrowHistory.setBorrowDate(new Date());
        borrowHistory.setBorrowStatus(SystemConstants.BORROWING);
        save(borrowHistory);
        return ResponseResult.okResult();
    }

    @Override
    public ResponseResult returnBook(BorrowHistoryDto borrowHistoryDto) {
        // 注意 借书的时候，需要确保当前登录用户和借书id一致
        // 获取当前登录的用户
        User loginUser = SecurityUtils.getLoginUser().getUser();
        // 如果是普通用户需要先判断当前用户是不是登录用户
        if (!Objects.equals(loginUser.getId(), borrowHistoryDto.getUserId())) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
        }

        BorrowHistory borrowHistory = BeanCopyUtils.copyBean(borrowHistoryDto, BorrowHistory.class);
        LambdaQueryWrapper<BorrowHistory> queryWrapper = new LambdaQueryWrapper<BorrowHistory>();
        queryWrapper.eq(BorrowHistory::getUserId, borrowHistory.getUserId());
        queryWrapper.eq(BorrowHistory::getBookId, borrowHistory.getBookId());
        queryWrapper.eq(BorrowHistory::getBorrowStatus, SystemConstants.BORROWING);
        BorrowHistory tmp = getBaseMapper().selectOne(queryWrapper);
        if (Objects.equals(tmp, null)) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NOT_BORROW);
        }

        // 查找用户，判断是否还有借书次数
        User user = userService.getById(borrowHistory.getUserId());
        user.setRemainingTimes(user.getRemainingTimes() + 1);
        userService.updateById(user);

        // 更新图书的库存信息
        Book book = bookService.getById(borrowHistory.getBookId());
        book.setInventory(book.getInventory() + 1);
        bookService.updateById(book);
        //
        borrowHistory.setReturnDate(new Date());
        borrowHistory.setBorrowStatus(SystemConstants.RETURN);
        LambdaUpdateWrapper<BorrowHistory> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(BorrowHistory::getUserId, borrowHistory.getUserId());
        updateWrapper.eq(BorrowHistory::getBookId, borrowHistory.getBookId());
        updateWrapper.set(BorrowHistory::getBorrowStatus, borrowHistory.getBorrowStatus());
        update(updateWrapper);
        return ResponseResult.okResult();
    }

    @Override
    public ResponseResult getStatistics(Long userId) {
        if(userId == null) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NO_USER_ID);
        }
        User loginUser = SecurityUtils.getLoginUser().getUser();
        // 如果是普通用户需要先判断当前用户是不是登录用户
        if (!Objects.equals(loginUser.getId(), userId)) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
        }
        LambdaQueryWrapper<BorrowHistory> queryWrapper1 = new LambdaQueryWrapper<BorrowHistory>();
        queryWrapper1.eq(BorrowHistory::getUserId, userId);
        Integer borrowSum = getBaseMapper().selectList(queryWrapper1).size();
        //
        LambdaQueryWrapper<BorrowHistory> queryWrapper2 = new LambdaQueryWrapper<>();
        queryWrapper2.eq(BorrowHistory::getUserId, userId);
        queryWrapper2.eq(BorrowHistory::getBorrowStatus, SystemConstants.BORROWING);
        Integer currentNum = getBaseMapper().selectList(queryWrapper2).size();
        //
        LambdaQueryWrapper<BorrowHistory> queryWrapper3 = new LambdaQueryWrapper<>();
        queryWrapper3.eq(BorrowHistory::getUserId, userId);
        queryWrapper3.eq(BorrowHistory::getBorrowStatus, SystemConstants.EXPIRED);
        Integer expiredNum = getBaseMapper().selectList(queryWrapper3).size();
        //
        BookStatistics bookStatistics = new BookStatistics(borrowSum, currentNum, expiredNum);

        return ResponseResult.okResult(bookStatistics);
    }
}
