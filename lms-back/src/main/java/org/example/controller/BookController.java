package org.example.controller;

import org.example.domain.ResponseResult;
import org.example.domain.dto.BookDto;
import org.example.domain.entity.Book;
import org.example.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("system/book")
public class BookController {
    @Autowired
    BookService bookService;

    // 查
    @GetMapping("/list")
    public ResponseResult listBook(Integer pageNum, Integer pageSize, String bookName, String category, String isbn, Integer inventory){
        return bookService.listBook(pageNum, pageSize, bookName, category, isbn, inventory);
    }
    // 删
    @DeleteMapping("/delete/{id}")
    public ResponseResult deleteBook(@PathVariable Long id){
        return bookService.deleteBook(id);
    }
    // 改
    @PutMapping("/update")
    public ResponseResult updateBook(@RequestBody BookDto bookDto){
        return bookService.updateBook(bookDto);
    }
    // 增
    @PostMapping("/add")
    public ResponseResult addBook(@RequestBody BookDto bookDto){
        return bookService.addBook(bookDto);
    }
}
