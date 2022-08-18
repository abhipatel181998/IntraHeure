package com.intraheure.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.ProfileDao;
import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

@Service
public class ProfileService {
	@Autowired
	ProfileDao profileDao;

	public void updateProfile(RegistrationVo registrationVo, LoginVo loginVo) {
		profileDao.updateProfile(registrationVo, loginVo);
	}

}
