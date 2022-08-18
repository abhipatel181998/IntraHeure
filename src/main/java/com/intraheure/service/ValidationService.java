package com.intraheure.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.ValidationDao;
import com.intraheure.model.LoginVo;

@Service
public class ValidationService {
	@Autowired
	ValidationDao validationDao;
	public boolean checkEmail(String email) {
		boolean status = validationDao.checkEmail(email);
		return status;
	}
	public boolean checkPassword(LoginVo loginVo) {
		boolean status = validationDao.checkPassword(loginVo);
		return status;
	}

}
