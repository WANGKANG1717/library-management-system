package org.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.example.domain.entity.BorrowHistory;

/**
 * (BorrowHistory)表数据库访问层
 *
 * @author WANGKANG
 * @since 2023-10-25 17:11:41
 */

@Mapper
public interface BorrowHistoryMapper extends BaseMapper<BorrowHistory> {
}
