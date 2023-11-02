package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.example.domain.entity.Book;
/**
 * (Book)表数据库访问层
 *
 * @author WANGKANG
 * @since 2023-10-24 20:57:11
 */

@Mapper
public interface BookMapper extends BaseMapper<Book> {
}
