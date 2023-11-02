package com.example.controller;

import com.example.domain.ResponseResult;
import com.example.service.BookService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("book")
@Tag(name = "图书管理", description = "图书相关接口")
public class BookController {
    @Autowired
    BookService bookService;

    // 查
    @GetMapping("/list")
    @Operation(summary = "查询图书列表")
    public ResponseResult listBook(@Parameter(name = "pageNum", description = "第几页") Integer pageNum,
                                   @Parameter(description = "每页大小") Integer pageSize,
                                   @Parameter(description = "书名") String bookName,
                                   @Parameter(description = "作者") String author,
                                   @Parameter(description = "分类") String category,
                                   @Parameter(description = "isbn") String isbn,
                                   @Parameter(description = "库存") Integer inventory){
        return bookService.listBook(pageNum, pageSize, bookName,author, category, isbn, inventory);
    }
    @GetMapping("/get/{id}")
    @Operation(summary = "根据图书id查询图书详细信息")
    public ResponseResult getBookDetail(@PathVariable("id") @Parameter(description = "图书id")Long id){
        return bookService.getBookDetail(id);
    }
}
