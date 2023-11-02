package com.example.controller;


import com.example.domain.ResponseResult;
import com.example.domain.dto.BorrowHistoryDto;
import com.example.service.BorrowHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user/borrow_history")
public class BorrowHistoryController {
    @Autowired
    BorrowHistoryService borrowHistoryService;

    @GetMapping
    public ResponseResult getBorrowHistory(Integer pageNum, Integer pageSize, Long userId,String borrowStatus){
        return borrowHistoryService.getBorrowHistory(pageNum, pageSize, userId, borrowStatus);
    }

    @PostMapping
    public ResponseResult addBorrowHistory(@RequestBody BorrowHistoryDto borrowHistoryDto){
        return borrowHistoryService.addBorrowHistory(borrowHistoryDto);
    }

    // 归还图书
    @PutMapping
    public ResponseResult returnBook(@RequestBody BorrowHistoryDto borrowHistoryDto) {
        return borrowHistoryService.returnBook(borrowHistoryDto);
    }

    @GetMapping("/statistics")
    public ResponseResult getStatistics(Long userId) {
        return borrowHistoryService.getStatistics(userId);
    }

    @PostMapping ("/reserve")
    public ResponseResult reserveBook(@RequestBody BorrowHistoryDto borrowHistoryDto) {
        return borrowHistoryService.reserveBook(borrowHistoryDto);
    }
}
