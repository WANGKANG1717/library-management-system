package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.domain.ResponseResult;
import com.example.domain.dto.BorrowHistoryDto;
import com.example.domain.entity.BorrowHistory;

/**
 * (BorrowHistory)表服务接口
 *
 * @author WANGKANG
 * @since 2023-10-25 17:11:41
 */
public interface BorrowHistoryService extends IService<BorrowHistory> {
    ResponseResult getBorrowHistory(Integer pageNum, Integer pageSize, Long userId, String borrowStatus);

    ResponseResult addBorrowHistory(BorrowHistoryDto borrowHistoryDto);

    ResponseResult returnBook(BorrowHistoryDto borrowHistoryDto);

    ResponseResult getStatistics(Long userId);

    ResponseResult reserveBook(BorrowHistoryDto borrowHistoryDto);
}

