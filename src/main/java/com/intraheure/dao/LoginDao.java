package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.LoginVo;

public interface LoginDao {

	void addUser(LoginVo hrLoginVo);

	List<?> searchLoginId(String userName);

	List<?> searchLoginData(LoginVo loginVo);

	List<?> searchEmployee();

	List<?> searchHr();

	List<?> departmentLogin();

	List<?> leaverequestLogin();

	List<?> resignrequestLogin();

	List<?> complainLogin();

	List<?> feedbacklogin();

	List<?> employeelogin();

	List<?> departmentHrLogin();

	List<?> leaverequestHrLogin();

	List<?> resignrequestHrLogin();

	List<?> complainHrLogin();

	List<?> totalrequestlogin();

	List<?> searchLoginDataFromUserName(LoginVo loginVo);

}
