package com.example.controller;

import com.example.domain.ResponseResult;
import com.example.domain.dto.BookDto;
import com.example.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("system/book")
public class BookController {
    @Autowired
    BookService bookService;

    // 查
    @GetMapping("/list")
    public ResponseResult listBook(Integer pageNum, Integer pageSize, String bookName, String author, String category, String isbn, Integer inventory) {
        return bookService.listBook(pageNum, pageSize, bookName, author, category, isbn, inventory);
    }

    @GetMapping("/get/{id}")
    public ResponseResult getBookDetail(@PathVariable("id") Long id) {
        return bookService.getBookDetail(id);
    }

    // 删
    @DeleteMapping("/delete/{id}")
    public ResponseResult deleteBook(@PathVariable("id") Long id) {
        return bookService.deleteBook(id);
    }

    // 改
    @PutMapping("/update")
    public ResponseResult updateBook(@RequestBody BookDto bookDto) {
        return bookService.updateBook(bookDto);
    }

    // 增
    @PostMapping("/add")
    public ResponseResult addBook(@RequestBody BookDto bookDto) {
        return bookService.addBook(bookDto);
    }

    // 用来统计图书类型和每种图书类型的图书数
    @GetMapping("/count")
    public ResponseResult bookCount() {
        return bookService.bookCount();
    }

    @PostMapping("/deleteBatch")
    public ResponseResult deleteBatchBooks(@RequestBody List<Long> book_ids) {
        return bookService.deleteBatchBooks(book_ids);
    }
}
