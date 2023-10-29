package org.example.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookStatistics {
    // 总借阅次数
    Integer borrowSum;

    // 目前借阅数目
    Integer currentNum;

    // 违约次数
    Integer expiredNum;
}
