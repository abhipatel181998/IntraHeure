package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.SalaryDao;
import com.intraheure.model.DynamicSalaryInfoVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.SalaryVo;

@Service
public class SalaryService {
	@Autowired
	SalaryDao salaryDao;

	@Transactional
	public void addSalary(SalaryVo salaryVo) {
		salaryDao.addSalary(salaryVo);

	}

	public List<?> viewSalary() {
		List<?> salaryData = salaryDao.viewSalary();
		return salaryData;
	}

	public List<?> searchSalary(SalaryVo salaryVo) {
		List<?> salaryData = salaryDao.searchSalary(salaryVo);
		return salaryData;

	}

	@Transactional
	public void deleteSalary(SalaryVo salaryVo) {
		salaryDao.deleteSalar(salaryVo);
	}

	public List<?> searchUserSalary(LoginVo loginVo) {
		List<?> salaryData = salaryDao.searchUserSalary(loginVo);
		return salaryData;

	}

	public void addDynamicSalary(DynamicSalaryInfoVo dynamicSalaryInfoVo) {
		salaryDao.addDynamicSalary(dynamicSalaryInfoVo);
		
	}

	public List<?> searchDynamicSalaryEmp(LoginVo loginVo) {
		List<?> searchDynamicSalaryData = salaryDao.searchDynamicSalaryEmp(loginVo); 
		return searchDynamicSalaryData;
	}

}
