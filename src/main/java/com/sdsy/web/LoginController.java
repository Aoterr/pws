package com.sdsy.web;

import com.sdsy.entity.User;
import com.sdsy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "login")
public class LoginController {

	@Autowired
	UserService userService;

	@RequestMapping(method=	 RequestMethod.POST)
	public String login(User user){
		User thisUser = userService.validate(user);
		System.out.println(thisUser.toString());
		if(thisUser!=null)
			return "index";
		return "login";
	}




}
