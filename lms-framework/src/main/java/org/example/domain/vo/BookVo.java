package org.example.domain.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookVo  {
    private Long id;
    
    private String bookName;
    
    private Double price;
    
    private String author;
    
    private String translator;
    
    private String category;
    
    private String cover;
    
    private String isbn;
    
    private Integer inventory;
    
    private Long publisherId;
    
    private Date publishTime;
}
