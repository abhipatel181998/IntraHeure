package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.LoginDao;
import com.intraheure.model.LoginVo;

@Service
public class LoginService {
	@Autowired
	LoginDao loginDao;

	@Transactional
	public void addUser(LoginVo loginVo) {
		loginDao.addUser(loginVo);
	}

	public List<?> searchLoginId(String userName) {
		List<?> loginId = loginDao.searchLoginId(userName);
		return loginId;
	}

	public List<?> searchLoginData(LoginVo loginVo) {
		List<?> searchLoginData = loginDao.searchLoginData(loginVo);
		return searchLoginData;
	}

	@Transactional
	public List<?> searchEmployee() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.searchEmployee();
		return ls;
	}

	@Transactional
	public List<?> searchHr() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.searchHr();
		return ls;
	}

	@Transactional
	public List<?> DepartmentLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.departmentLogin();
		return ls;
	}

	@Transactional
	public List<?> LeaveRequestLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.leaverequestLogin();
		return ls;
	}

	@Transactional
	public List<?> ResignRequestLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.resignrequestLogin();
		return ls;
	}

	@Transactional
	public List<?> ComplainLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.complainLogin();
		return ls;
	}

	@Transactional
	public List<?> FeedbackLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.feedbacklogin();
		return ls;
	}

	@Transactional
	public List<?> EmployeeLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.employeelogin();
		return ls;
	}

	@Transactional
	public List<?> ResignRequestHrLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.resignrequestLogin();
		return ls;
	}

	@Transactional
	public List<?> ComplainHrLogin() {
		// TODO Auto-generated method stub

		List<?> ls = loginDao.complainLogin();
		return ls;
	}

	public List<?> TotalRequestLogin() {

		List<?> ls = loginDao.totalrequestlogin();
		return ls;
	}

	public List<?> searchLoginDataFromUserName(LoginVo loginVo) {
		List<?> searchLoginData = loginDao.searchLoginDataFromUserName(loginVo);
		return searchLoginData;
	}

}