package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.domain.ResponseResult;
import com.example.domain.dto.BookDto;
import com.example.domain.entity.Book;

/**
 * (Book)表服务接口
 *
 * @author WANGKANG
 * @since 2023-10-24 20:56:22
 */
public interface BookService extends IService<Book> {
    ResponseResult listBook(Integer pageNum, Integer pageSize, String bookName,String author, String category, String isbn, Integer inventory);

    ResponseResult deleteBook(Long id);

    ResponseResult updateBook(BookDto bookDto);

    ResponseResult addBook(BookDto bookDto);

    ResponseResult getBookDetail(Long id);
}

