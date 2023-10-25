package org.example.domain.entity;

import java.util.Date;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;

/**
 * (Book)表实体类
 *
 * @author WANGKANG
 * @since 2023-10-24 20:56:22
 */
@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("book")
public class Book  {
        
    @TableId

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
    @TableField(fill = FieldFill.INSERT)
    private Long createBy;
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateBy;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;
    
    private String delFlag;
}
