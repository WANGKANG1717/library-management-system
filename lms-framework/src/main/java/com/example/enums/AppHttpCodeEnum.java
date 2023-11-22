package com.example.enums;

public enum AppHttpCodeEnum {
    // 成功
    SUCCESS(200, "操作成功"),
    // 登录
    NEED_LOGIN(401, "需要登录后操作"),
    NO_OPERATOR_AUTH(403, "无权限操作"),
    SYSTEM_ERROR(500, "出现错误"),
    USERNAME_EXIST(501, "用户名已存在"),
    PHONENUMBER_EXIST(502, "手机号已存在"),
    EMAIL_EXIST(503, "邮箱已存在"),
    REQUIRE_USERNAME(504, "必需填写用户名"),
    LOGIN_ERROR(505, "用户名或密码错误"),
    CONTENT_NOT_NULL(506, "评论内容不能为空"),
    FILE_TYPE_ERROR(507, "文件类型错误，请上传png,jpg,jpeg,gif,bmp格式图片"),
    USERNAME_NOT_NULL(508, "用户名不能为空"),
    NICKNAME_NOT_NULL(509, "昵称不能为空"),
    PASSWORD_NOT_NULL(510, "密码不能为空"),
    EMAIL_NOT_NULL(511, "邮箱不能为空"),
    NICKNAME_EXIST(512, "昵称已经存在"),
    TAG_NAME_NULL(513, "标签名称不能为空"),
    HAS_CHILDREN(514, "存在子菜单不允许删除"),
    DELETE_CURRENT_USER(515, "不删除当前用户"),
    NUMBER_NOT_NULL1(516, "工号不能为空"),
    NUMBER_NOT_NULL2(517, "学号不能为空"),
    NUMBER_NOT_EXISTS(518, "工号不存在"),
    NUMBER_NOT_EXISTS2(518, "学号不存在"),
    BOOKNAME_IS_NULL(519, "书名为空"),
    ISBN_IS_NULL(520, "isbn为空"),
    NUMBER_EXISTS(521, "编号已存在"),
    NO_REMAININGTIMES(522, "剩余借阅次数不足"),
    NO_INVENTORY(523, "没有库存"),
    ALEARDY_BORROW(524, "不可重复借同一本书"),
    NOT_BORROW(525, "还没有借阅此书"),
    NO_USER_ID(526, "没有用户id"),
    NO_NEED_RESERVE(527, "不需要预约"),
    MAX_RESERVATION(528, "已经达到最大预约数量"),
    NO_REPEAT_RESERVATION(529, "禁止重复预约"),
    RESERVATION_BY_OTHER(530, "已经被其他人预约了，看看其他书吧"),
    FILE_UPLOAD_ERROR(531, "文件上传失败");
    int code;
    String msg;

    AppHttpCodeEnum(int code, String errorMessage) {
        this.code = code;
        this.msg = errorMessage;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
