package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/user/")
@RestController
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 展示
     * @param userQuery
     * @param phoneNumber
     * @param type
     * @param pageNo
     * @return
     */
    @RequestMapping("getList")
    public ResultModel getList (UserQuery userQuery, String phoneNumber, Integer[] type, Integer pageNo){
        Map<String, Object> map = new HashMap<>();
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            if (null != phoneNumber && !"".equals("phoneNumber") ){
                queryWrapper.like("phone_number",phoneNumber);

            }
            if (null != type){
                queryWrapper.in("type", type);
            }
            IPage<User> page = new Page<>(pageNo, 2);
            IPage<User> pageInfo = userService.page(page,queryWrapper);
            map.put("pages", pageInfo.getPages());
            map.put("list", pageInfo.getRecords());
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }


    /**
     * 添加
     * @param user
     * @return
     */
    @RequestMapping("insert")
    public ResultModel insert (User user){
        try {
            userService.save(user);
            return new ResultModel<Object>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 修改
     * @param user
     * @return
     */
    @RequestMapping("update")
    public ResultModel update (User user){
        try {
            userService.updateById(user);
            return new ResultModel<Object>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("delete")
    public ResultModel delete (Integer id){
        try {
            userService.removeById(id);
            return new ResultModel<Object>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    @RequestMapping("adds")
    public ResultModel adds (UserQuery userQuery){
        try {
            userService.saveBatch(userQuery.getList());
            return new ResultModel<Object>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    @RequestMapping("delUser")
    public ResultModel delUser (@RequestParam("ids[]") Integer[] ids){
        try {
            List<Integer> list = Arrays.asList(ids);
            userService.removeByIds(list);
            return new ResultModel<Object>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常");
        }
    }

    @GetMapping("/{userId}")
    public ResultModel get(@PathVariable Integer userId) {
        try {
            User user = userService.getById(userId);
            return new ResultModel().success(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
}
