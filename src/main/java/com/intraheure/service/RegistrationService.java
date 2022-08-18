package com.intraheure.service;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.RegisterDao;
import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

@Service
public class RegistrationService {
	@Autowired
	HttpSession session;

	@Autowired
	RegisterDao registerDao;

	@Transactional
	public void addUser(RegistrationVo registerationVo) {
		registerDao.addUser(registerationVo);
	}

	public List<?> viewRegistrationData() {
		List<?> registrationData = registerDao.viewRegistrationData();
		return registrationData;
	}

	public void setSessionRegistrationVo() {
		Integer loginId = (Integer) (session.getAttribute("loginId"));
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId(loginId);
		List<?> registrationData = registerDao.searchRegistration(loginVo);
		RegistrationVo registrationVo = (RegistrationVo) registrationData.get(0);
		session.setAttribute("registrationVo", registrationVo);
	}

	public List<?> searchRegistration(LoginVo loginVo) {
		List<?> registrationData = registerDao.searchRegistration(loginVo);
		return registrationData;
	}

	@Transactional
	public void approveRegRequest(RegistrationVo registrationVo) {
		registerDao.approveRegRequest(registrationVo);
	}

	@Transactional
	public void rejectRegRequest(RegistrationVo registrationVo) {
		registerDao.rejectRegRequest(registrationVo);
	}
}
