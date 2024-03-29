package com.snakerflow.framework.security.web;

import javax.servlet.http.HttpServletRequest;

import com.snakerflow.framework.security.entity.Role;
import com.snakerflow.framework.security.service.UserManager;
import com.snakerflow.framework.security.shiro.ShiroUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import com.snakerflow.framework.security.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 系统登录Controller
 * @author yuqs
 * @since 0.1
 */
@Controller
public class LoginController {
	private static Log log = LogFactory.getLog(LoginController.class);
	private static UserManager userManager=new UserManager();
	@RequestMapping(value = "/login" ,method = RequestMethod.POST)
	public String login(User user, Model model, HttpServletRequest request) {
		log.info("Login user=====" + user);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
		String remember = WebUtils.getCleanParam(request, "remember");
		log.info("remember=" + remember);
		try {
		    	if(remember != null && remember.equalsIgnoreCase("on")) {
		    	    token.setRememberMe(true);
		    	}
		    	String type=request.getParameter("login_choice");
				subject.login(token);
				User temp=ShiroUtils.getUser();
				if (type.equals("admin")){
					if (temp.belongAdmin()) {
						return "redirect:/index";
					}else{
						token.clear();
						model.addAttribute("error", "登录失败，您的账号权限不足！");
						return "security/login";
					}
				}else{
					return "redirect:/front/index";
				}
		} catch(UnknownAccountException ue) {
			token.clear();
			model.addAttribute("error", "登录失败，您输入的账号不存在");
			return "security/login";
		} catch(IncorrectCredentialsException ie) {
			token.clear();
			model.addAttribute("username", user.getUsername());
			model.addAttribute("error", "登录失败，密码不匹配");
			return "security/login";
		} catch(RuntimeException re) {
			token.clear();
			model.addAttribute("username", user.getUsername());
			model.addAttribute("error", "登录失败");
			return "security/login";
		}
	}
	
	@RequestMapping(value = "/login" ,method = RequestMethod.GET)
	public String loginForm() {
		return "security/login";
	}
}
