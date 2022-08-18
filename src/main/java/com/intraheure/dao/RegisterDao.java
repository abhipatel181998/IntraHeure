package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

public interface RegisterDao {
	void addUser(RegistrationVo registerationVo);

	List<?> viewRegistrationData();

	List<?> searchRegistration(LoginVo loginVo);

	void approveRegRequest(RegistrationVo registrationVo);

	void rejectRegRequest(RegistrationVo registrationVo);
}
