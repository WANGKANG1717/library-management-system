package com.example.domain.entity;

import java.util.Date;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * (Book)表实体类
 *
 * @author WANGKANG
 * @since 2023-11-28 17:14:25
 */
@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("book")
public class Book  {
    // id    
    @TableId
    private Long id;

    // 书名
    private String bookName;
    // 价格
    private Double price;
    // 作者
    private String author;
    // 译者
    private String translator;
    // 类型
    private String category;
    // 封面
    private String cover;
    // ISBN
    private String isbn;
    // 当前库存
    private Integer currentInventory;
    // 总库存
    private Integer inventory;
    // 藏书位置
    private String position;
    // 借阅次数
    private Integer borrowedTimes;
    // 出版社id
    private Long publisherId;
    // 出版时间
    private Date publishTime;
    // 图书添加人
    @TableField(fill = FieldFill.INSERT)
    private Long createBy;
    // 图书添加时间
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    // 图书更新人
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateBy;
    // 图书更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;
    // 删除标志 0未删除 1已删除
    private String delFlag;
}
