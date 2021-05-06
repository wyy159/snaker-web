package com.snakerflow.framework.frontsystem.web;

import com.snakerflow.framework.flow.service.SnakerEngineFacets;
import com.snakerflow.framework.security.entity.User;
import com.snakerflow.framework.security.service.UserManager;
import com.snakerflow.framework.security.shiro.ShiroUtils;
import com.snakerflow.framework.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 员工前台系统入口
 * 控制类
 */
@Controller
@RequestMapping(value = "/front")
public class FrontSystemController {
    @Autowired
    private SnakerEngineFacets facets;
    @Autowired
    private UserManager userManager;
    @RequestMapping(value = "index", method= RequestMethod.GET)
    public String frontIndex() {
        System.out.println("intofront");
        return "frontsystem/index";
    }
    @RequestMapping(value = "main", method= RequestMethod.GET)
    public String frontMain() {
        System.out.println("into main");
        return "frontsystem/main";
    }
    @RequestMapping(value = "borrow", method= RequestMethod.GET)
    public String borrowForm(Model model) {
        System.out.println("into borrow form");
        model.addAttribute("processId","6783662909f248dc82c8411823821854");
        model.addAttribute("operator", ShiroUtils.getUsername());
        model.addAttribute("nowdate", DateUtils.getCurrentDay());
        return "frontsystem/flow_borrow";
    }
    @RequestMapping(value = "leave", method= RequestMethod.GET)
    public String leaveForm() {
        System.out.println("into leave form ");
        return "frontsystem/flow_leave";
    }
    @RequestMapping(value = "change", method= RequestMethod.GET)
    public String changeForm() {
        System.out.println("into change form");
        return "frontsystem/flow_change";
    }
    @RequestMapping(value = "my_apply", method= RequestMethod.GET)
    public String myApply(Model model) {
        System.out.println("into my apply");
        model.addAttribute("userId", ShiroUtils.getUsername());
        return "frontsystem/my_apply";
    }
    @RequestMapping(value = "my_message", method= RequestMethod.GET)
    public String myMessage(Model model){
        /**
         * 业务处理类处理数据展示
         */
        User user=userManager.findUserByName(ShiroUtils.getUsername());
        model.addAttribute("user", user);
        return "frontsystem/my_message";
    }
}
