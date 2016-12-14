package com.sdsy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("page")
public class PageController {
	
	@RequestMapping(value="{pageName}")
	public String page(@PathVariable("pageName") String pageName){
		return pageName;
	}
	@RequestMapping(value="user/{pageName}")
	public String pageItem(@PathVariable("pageName") String pageName){

		return "user/"+pageName;
	}
}
