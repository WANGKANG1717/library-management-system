package org.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.domain.entity.BorrowHistory;
import org.example.mapper.BorrowHistoryMapper;
import org.example.service.BorrowHistoryService;
import org.springframework.stereotype.Service;

/**
 * (BorrowHistory)表服务实现类
 *
 * @author WANGKANG
 * @since 2023-10-25 17:11:41
 */

@Service("borrowHistoryService")
public class BorrowHistoryServiceImpl extends ServiceImpl<BorrowHistoryMapper, BorrowHistory> implements BorrowHistoryService {
}
