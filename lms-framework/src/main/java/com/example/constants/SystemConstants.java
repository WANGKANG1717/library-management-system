package com.example.constants;

public class SystemConstants {
    /**
     * 文章是草稿
     */
    public static final int ARTICLE_STATUS_DRAFT = 1;
    /**
     * 文章是正常分布状态
     */
    public static final int ARTICLE_STATUS_NORMAL = 0;

    public static final String STATUS_NORMAL = "0";
    /*
     * 友链审核通过
     */
    public static final String LINK_STATUS_NORMAL = "0";
    /*
     * 文章注释
     * */
    public static final String ARTICLE_COMMENT = "0";
    /*
     * 友联注释
     * */
    public static final String LINK_COMMENT = "1";
    public static final String DIRECTORY = "M";  // 目录
    public static final String MENU = "C"; // 菜单
    public static final String BUTTON = "F"; // 按钮
    /**
     * 正常状态
     */
    public static final String NORMAL = "0";
    public static final String ADMIN = "1";

    //     0已借出 / 1已归还 / 2过期未还 / 3已预约
    public static final String BORROWING = "0";
    public static final String RETURN = "1";
    public static final String EXPIRED = "2";
    public static final String RESERVATION = "3";
}