package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.domain.ResponseResult;
import com.example.domain.dto.BookCategoryDto;
import com.example.domain.dto.BookDto;
import com.example.domain.entity.Book;
import com.example.domain.vo.BookVo;
import com.example.domain.vo.PageVo;
import com.example.enums.AppHttpCodeEnum;
import com.example.mapper.BookMapper;
import com.example.service.BookService;
import com.example.utils.BeanCopyUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * (Book)表服务实现类
 *
 * @author WANGKANG
 * @since 2023-10-24 20:56:22
 */

@Service("bookService")
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {
    @Override
    @Transactional
    public ResponseResult listBook(Integer pageNum, Integer pageSize, String bookName, String author, String category, String isbn, Integer inventory) {
        LambdaQueryWrapper<Book> queryWrapper = new LambdaQueryWrapper<Book>();
        queryWrapper.like(StringUtils.hasText(bookName), Book::getBookName, bookName);
        queryWrapper.like(StringUtils.hasText(author), Book::getAuthor, author);
        queryWrapper.like(StringUtils.hasText(category), Book::getCategory, category);
        queryWrapper.eq(StringUtils.hasText(isbn), Book::getIsbn, isbn);
        queryWrapper.eq(inventory != null && inventory >= 0, Book::getInventory, inventory);
        // 需要用户分页列表接口
        Page page = new Page(pageNum, pageSize);
        page(page, queryWrapper);
        // 封装数据返回
        List<BookVo> bookVos = BeanCopyUtils.copyBeanList(page.getRecords(), BookVo.class);
        PageVo pageVo = new PageVo(bookVos, page.getTotal());
        return ResponseResult.okResult(pageVo);
    }

    @Override
    @Transactional
    public ResponseResult deleteBook(Long id) {
        removeById(id);
        return ResponseResult.okResult();
    }

    @Override
    @Transactional
    public ResponseResult updateBook(BookDto bookDto) {
        Book book = BeanCopyUtils.copyBean(bookDto, Book.class);
        updateById(book);
        return ResponseResult.okResult();
    }

    @Override
    @Transactional
    public ResponseResult addBook(BookDto bookDto) {
        Book book = BeanCopyUtils.copyBean(bookDto, Book.class);
        book.setId(null);
        // 为了赶时间，暂时不对数据进行过多的校验，主要在于迅速的完成任务
        if (!StringUtils.hasText(book.getBookName())) {
            return ResponseResult.errorResult(AppHttpCodeEnum.BOOKNAME_IS_NULL);
        }
        if (!StringUtils.hasText(book.getIsbn())) {
            return ResponseResult.errorResult(AppHttpCodeEnum.ISBN_IS_NULL);
        }
        save(book);
        return ResponseResult.okResult();
    }

    @Override
    @Transactional
    public ResponseResult getBookDetail(Long id) {
        Book book = getById(id);
        if (book == null) {
            return ResponseResult.okResult();
        }
        BookVo bookVo = BeanCopyUtils.copyBean(book, BookVo.class);
        return ResponseResult.okResult(bookVo);
    }

    @Override
    @Transactional
    public ResponseResult bookCount() {
        List<BookCategoryDto> bookCategoryDtos = getBaseMapper().countCategory();
        return ResponseResult.okResult(bookCategoryDtos);
    }

    @Override
    @Transactional
    public ResponseResult deleteBatchBooks(List<Long> bookIds) {
        for (Long book_id : bookIds) {
            removeById(book_id);
        }
        return ResponseResult.okResult();
    }
}
