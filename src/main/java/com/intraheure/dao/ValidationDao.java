package com.intraheure.dao;

import com.intraheure.model.LoginVo;

public interface ValidationDao {
	boolean checkEmail(String email);

	boolean checkPassword(LoginVo loginVo);

}
