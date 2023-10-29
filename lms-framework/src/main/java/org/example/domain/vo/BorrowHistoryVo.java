package org.example.domain.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BorrowHistoryVo  {
    private Long userId;
    
    private Long bookId;
    
    private Date reservationTime;
    
    private Date borrowDate;
    
    private Date returnDate;
    // 借阅状态 0已借出 / 1已归还 / 2过期未还 / 3已预约
    private String borrowStatus;
}
