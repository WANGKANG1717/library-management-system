package org.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.constants.SystemConstants;
import org.example.domain.ResponseResult;
import org.example.domain.dto.BorrowHistoryDto;
import org.example.domain.entity.BorrowHistory;
import org.example.domain.entity.User;
import org.example.domain.vo.BorrowHistoryVo;
import org.example.domain.vo.PageVo;
import org.example.domain.vo.UserDetailVo;
import org.example.mapper.BorrowHistoryMapper;
import org.example.service.BorrowHistoryService;
import org.example.utils.BeanCopyUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * (BorrowHistory)表服务实现类
 *
 * @author WANGKANG
 * @since 2023-10-25 17:11:41
 */

@Service("borrowHistoryService")
public class BorrowHistoryServiceImpl extends ServiceImpl<BorrowHistoryMapper, BorrowHistory> implements BorrowHistoryService {

    @Override
    public ResponseResult getBorrowHistory(Integer pageNum, Integer pageSize, Long userId, String borrowStatus) {
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
    public ResponseResult addBorrowHistory(BorrowHistoryDto borrowHistoryDto) {
        BorrowHistory borrowHistory = BeanCopyUtils.copyBean(borrowHistoryDto, BorrowHistory.class);
        borrowHistory.setBorrowDate(new Date());
        borrowHistory.setBorrowStatus(SystemConstants.BORROWING);
        save(borrowHistory);
        return ResponseResult.okResult();
    }
}
