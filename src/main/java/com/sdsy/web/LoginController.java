package com.sdsy.web;

import com.sdsy.entity.User;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "login")
public class LoginController {

	@RequestMapping(value = "login")
	public ResponseEntity login(User user){
		System.out.println(user.toString());

			return ResponseEntity.ok(null);
	}

}
