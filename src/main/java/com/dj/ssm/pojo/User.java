package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigInteger;

@Data
@TableName("user_mp")
public class User {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户密码
     */
    private String userPwd;

    /**
     * 用户年龄
     */
    private Integer age;

    /**
     * 用户性别 1男 2女
     */
    private Integer sex;

    /**
     * 用户手机号
     */
    private BigInteger phoneNumber;

    /**
     * 用户班级
     */
    private String classes;

    /**
     * 用户类型
     */
    private Integer type;
}
