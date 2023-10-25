package org.example.controller;


import org.example.service.BorrowHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("system/borrow_history")
public class BorrowHistoryController {
    @Autowired
    BorrowHistoryService borrowHistoryService;

    // @GetMapping("user_id")
}
