package com.sdsy.service;

import com.sdsy.entity.User;

import com.sdsy.service.base.BaseService;
import org.springframework.stereotype.Service;

/**
 * Created by YMSX30004 on 2016/12/14.
 */
@Service
public class UserService  extends BaseService<User> {

	public User validate(User user) {

			return this.queryOne(user);
	}
}
