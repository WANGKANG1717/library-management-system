package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.injector.methods.SelectList;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.constants.SystemConstants;
import com.example.domain.ResponseResult;
import com.example.domain.dto.BorrowHistoryDto;
import com.example.domain.entity.Book;
import com.example.domain.entity.BorrowHistory;
import com.example.domain.entity.LoginUser;
import com.example.domain.entity.User;
import com.example.domain.vo.*;
import com.example.enums.AppHttpCodeEnum;
import com.example.mapper.BorrowHistoryMapper;
import com.example.service.BookService;
import com.example.service.BorrowHistoryService;
import com.example.service.UserService;
import com.example.utils.BeanCopyUtils;
import com.example.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    @Transactional
    public ResponseResult getBorrowHistory(Integer pageNum, Integer pageSize, Long userId, Long bookId, String borrowStatus) {
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
        queryWrapper.eq(!Objects.isNull(userId), BorrowHistory::getUserId, userId);
        queryWrapper.eq(!Objects.isNull(bookId), BorrowHistory::getBookId, bookId);
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
        // 借书之前首先判断此书是不是被预约了
        LambdaQueryWrapper<BorrowHistory> queryWrapper1 = new LambdaQueryWrapper<>();
        queryWrapper1.eq(BorrowHistory::getBookId, borrowHistoryDto.getBookId());
        queryWrapper1.eq(BorrowHistory::getBorrowStatus, SystemConstants.RESERVATION);
        List<BorrowHistory> list_reservation = getBaseMapper().selectList(queryWrapper1);
        // 如果有人预约，需要判断是不是本人预约了
        Boolean flag_reservation = false; // 是否被本人预约
        if (list_reservation.size() != 0) {
            for (BorrowHistory borrowHistory : list_reservation) {
                if (Objects.equals(borrowHistory.getUserId(), borrowHistoryDto.getUserId())) {
                    flag_reservation = true;
                    break;
                }
            }
            if (!flag_reservation) { // 说明没有被本人预约
                return ResponseResult.errorResult(AppHttpCodeEnum.RESERVATION_BY_OTHER);
            }
            // 说明本人预约了
        }
        // 在借书之前，要看下读者当前有没有借过相同id的书
        BorrowHistory borrowHistory = BeanCopyUtils.copyBean(borrowHistoryDto, BorrowHistory.class);
        LambdaQueryWrapper<BorrowHistory> queryWrapper = new LambdaQueryWrapper<BorrowHistory>();
        queryWrapper.eq(BorrowHistory::getUserId, borrowHistory.getUserId());
        queryWrapper.eq(BorrowHistory::getBookId, borrowHistory.getBookId());
        queryWrapper.eq(BorrowHistory::getBorrowStatus, SystemConstants.BORROWING);
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
        // 如果预约了，只需要更新信息
        if (flag_reservation) {
            LambdaUpdateWrapper<BorrowHistory> updateWrapper = new LambdaUpdateWrapper<>();
            updateWrapper.eq(BorrowHistory::getUserId, borrowHistory.getUserId());
            updateWrapper.eq(BorrowHistory::getBookId, borrowHistory.getBookId());
            updateWrapper.eq(BorrowHistory::getBorrowStatus, SystemConstants.RESERVATION);
            updateWrapper.set(BorrowHistory::getBorrowDate, borrowHistory.getBorrowDate());
            updateWrapper.set(BorrowHistory::getBorrowStatus, borrowHistory.getBorrowStatus());
            update(updateWrapper);
        } else {
            save(borrowHistory);
        }
        return ResponseResult.okResult();
    }

    @Override
    @Transactional
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
    @Transactional
    public ResponseResult getStatistics(Long userId) {
        if (userId == null) {
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

    @Override
    @Transactional
    public ResponseResult reserveBook(BorrowHistoryDto borrowHistoryDto) {
        // 获取当前登录的用户
        User loginUser = SecurityUtils.getLoginUser().getUser();
        // 如果是普通用户需要先判断当前用户是不是登录用户
        if (!Objects.equals(loginUser.getId(), borrowHistoryDto.getUserId())) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
        }
        // 首先先看一下这本书有没有库存，如果有，则不需要预约
        Book book = bookService.getById(borrowHistoryDto.getBookId());
        if (book.getInventory() > 0) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NO_NEED_RESERVE);
        }
        // 禁止同一人预约一本书两次
        LambdaQueryWrapper<BorrowHistory> queryWrapper2 = new LambdaQueryWrapper<>();
        queryWrapper2.eq(BorrowHistory::getBookId, borrowHistoryDto.getBookId());
        queryWrapper2.eq(BorrowHistory::getUserId, borrowHistoryDto.getUserId());
        queryWrapper2.eq(BorrowHistory::getBorrowStatus, SystemConstants.RESERVATION);
        if (getBaseMapper().selectOne(queryWrapper2) != null) {
            return ResponseResult.errorResult(AppHttpCodeEnum.NO_REPEAT_RESERVATION);
        }
        // 如果没有库存了，先看下此书有没有人预约了，如果有两个人预约了，则拒绝其他人的预约 （不允许两个人以及更多人预约同一本书）
        LambdaQueryWrapper<BorrowHistory> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(BorrowHistory::getBookId, borrowHistoryDto.getBookId());
        queryWrapper.eq(BorrowHistory::getBorrowStatus, SystemConstants.RESERVATION);
        Integer reservationNum = getBaseMapper().selectList(queryWrapper).size();
        if (reservationNum >= 2) {
            return ResponseResult.errorResult(AppHttpCodeEnum.MAX_RESERVATION);
        }
        // 不满足上面的限制条件，才可以预约
        BorrowHistory borrowHistory = BeanCopyUtils.copyBean(borrowHistoryDto, BorrowHistory.class);
        borrowHistory.setBorrowStatus(SystemConstants.RESERVATION);

        borrowHistory.setReservationTime(new Date());

        // 计算一周后的时间
        // 也就是最长预约时间
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_WEEK, 7);
        borrowHistory.setReservationToTime(calendar.getTime());

        save(borrowHistory);

        return ResponseResult.okResult();
    }
}
