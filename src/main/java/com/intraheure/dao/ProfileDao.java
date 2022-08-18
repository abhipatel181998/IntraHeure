package com.intraheure.dao;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

public interface ProfileDao {

	void updateProfile(RegistrationVo registrationVo, LoginVo loginVo);

}
