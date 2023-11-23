package com.example.controller;


import com.example.domain.ResponseResult;
import com.example.domain.dto.BorrowHistoryDto;
import com.example.service.BorrowHistoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user/borrow_history")
@Tag(name = "借阅历史", description = "借阅历史相关接口")
public class BorrowHistoryController {
    @Autowired
    BorrowHistoryService borrowHistoryService;

    @GetMapping
    @Operation(summary = "查询借阅历史")
    public ResponseResult getBorrowHistory(@Parameter(description = "第几页") Integer pageNum,
                                           @Parameter(description = "每页大小") Integer pageSize,
                                           @Parameter(description = "用户id") Long userId,
                                           @Parameter(description = "图书id") Long bookId,
                                           @Parameter(description = "借阅状态 0已借出 / 1已归还 / 2过期未还 / 3已预约") String borrowStatus) {
        return borrowHistoryService.getBorrowHistory(pageNum, pageSize, userId, bookId, borrowStatus);
    }

    @PostMapping
    @Operation(summary = "新增借阅")
    @Parameters(
            @Parameter(name = "borrowHistoryDto", description = "需要传两个参数userId, bookId， 形式{ \"userId\": 0, \"bookId\": 0 }")
    )
    public ResponseResult addBorrowHistory(@RequestBody BorrowHistoryDto borrowHistoryDto) {
        return borrowHistoryService.addBorrowHistory(borrowHistoryDto);
    }

    // 归还图书
    @PutMapping
    @Operation(summary = "归还图书")
    @Parameters(
            @Parameter(name = "borrowHistoryDto", description = "需要传两个参数userId, bookId， 形式{ \"userId\": 0, \"bookId\": 0 }")
    )
    public ResponseResult returnBook(@RequestBody BorrowHistoryDto borrowHistoryDto) {
        return borrowHistoryService.returnBook(borrowHistoryDto);
    }

    @GetMapping("/statistics")
    @Operation(summary = "根据用户id拿到统计数据")
    public ResponseResult getStatistics(Long userId) {
        return borrowHistoryService.getStatistics(userId);
    }

    @PostMapping("/reserve")
    @Operation(summary = "预约图书")
    @Parameters(
            @Parameter(name = "borrowHistoryDto", description = "需要传两个参数userId, bookId， 形式{ \"userId\": 0, \"bookId\": 0 }")
    )
    public ResponseResult reserveBook(@RequestBody BorrowHistoryDto borrowHistoryDto) {
        return borrowHistoryService.reserveBook(borrowHistoryDto);
    }
}
