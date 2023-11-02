package com.example.controller;

import com.example.domain.ResponseResult;
import com.example.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("book")
public class BookController {
    @Autowired
    BookService bookService;

    // 查
    @GetMapping("/list")
    public ResponseResult listBook(Integer pageNum, Integer pageSize, String bookName, String author, String category, String isbn, Integer inventory){
        return bookService.listBook(pageNum, pageSize, bookName,author, category, isbn, inventory);
    }
    @GetMapping("/get/{id}")
    public ResponseResult getBookDetail(@PathVariable("id") Long id){
        return bookService.getBookDetail(id);
    }
}
