package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.domain.dto.BookCategoryDto;
import org.apache.ibatis.annotations.Mapper;
import com.example.domain.entity.Book;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * (Book)表数据库访问层
 *
 * @author WANGKANG
 * @since 2023-10-24 20:57:11
 */

@Mapper
public interface BookMapper extends BaseMapper<Book> {
    @Select("select count(id) count, category from book GROUP BY category")
    List<BookCategoryDto> countCategory();
}
