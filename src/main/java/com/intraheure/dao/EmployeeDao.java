package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.RegistrationVo;

public interface EmployeeDao {
	
	List<?> viewEmployeeData();

	void deleteEmployee(RegistrationVo employeeRegisterVo);

	List<?> searchEmployee(RegistrationVo employeeRegisterVo);
	
	List<?> employeeByDesigntion(RegistrationVo employeeRegisterVo);

	List<?> getEmployeeRegRequests();


}
