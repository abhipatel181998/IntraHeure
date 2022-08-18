package com.intraheure.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.ChangePasswordDao;
import com.intraheure.model.LoginVo;

@Service
public class ChangePasswordService {
	@Autowired
	ChangePasswordDao changePasswordDao;

	@Transactional
	public void updatePassword(LoginVo loginVo) {
		changePasswordDao.updatePassword(loginVo);

	}

}
