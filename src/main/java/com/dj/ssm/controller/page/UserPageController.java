package com.dj.ssm.controller.page;

import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user/")
@Controller
public class UserPageController {

    @Autowired
    private UserService userService;

    /**
     * 去展示页面
     * @return
     */
    @RequestMapping("toShow")
    public String toShow(){
        return "show";
    }

    /**
     * 根据id获取用户信息
     * 去修改页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("get")
    public String get (Integer id, Model model) {
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "update";
    }

    /**
     * 去添加页面
     * @return
     */
    @RequestMapping("toAdd")
    public String toAdd(){
        return "insert";
    }

    @RequestMapping("toAdds")
    public String toAdds(){
        return "add";
    }

}
