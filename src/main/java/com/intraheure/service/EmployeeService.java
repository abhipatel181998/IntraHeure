package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.EmployeeDao;
import com.intraheure.model.RegistrationVo;

@Service
public class EmployeeService {
	@Autowired
	EmployeeDao employeeDao;

	public List<?> viewEmployeeData() {
		List<?> employeeData = employeeDao.viewEmployeeData();
		return employeeData;
	}

	@Transactional
	public void deleteEmployee(RegistrationVo registrationVo) {
		employeeDao.deleteEmployee(registrationVo);
	}

	public List<?> searchEmployee(RegistrationVo registrationVo) {
		List<?> employeeData = employeeDao.searchEmployee(registrationVo);
		return employeeData;
	}

	public List<?> employeeByDesigntion(RegistrationVo registrationVo) {
		List<?> employeeData = employeeDao.employeeByDesigntion(registrationVo);
		return employeeData;

	}

	public List<?> getEmployeeRegRequests() {
		List<?> employeeData = employeeDao.getEmployeeRegRequests();
		return employeeData;
	}

}
