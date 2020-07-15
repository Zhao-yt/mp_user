package com.dj.ssm.pojo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

@Data
public class UserQuery implements Serializable {

   private String userName;

   private String userPwd;

   private Integer age;

   private Integer sex;

   private BigInteger phoneNumber;

   private String classes;

   private Integer type;

   private List<User> list;

}
