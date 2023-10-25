package org.example.domain.entity;

import java.util.Date;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * (BorrowHistory)表实体类
 *
 * @author WANGKANG
 * @since 2023-10-25 17:11:39
 */
@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("borrow_history")
public class BorrowHistory  {
    private Long userId;
    
    private Long bookId;
    
    private Date reservationTime;
    
    private Date borrowDate;
    
    private Date returnDate;
    // 借阅状态 0已借出 / 1已归还 / 2过期未还 / 3已预约
    private String borrowStatus;
}
