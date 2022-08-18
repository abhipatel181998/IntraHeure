package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.DynamicSalaryInfoVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.SalaryVo;

public interface SalaryDao {
	
	void addSalary(SalaryVo salaryVo);

	List<?> viewSalary();

	List<?> searchSalary(SalaryVo salaryVo);

	void deleteSalar(SalaryVo salaryVo);

	List<?> searchUserSalary(LoginVo loginVo);

	void addDynamicSalary(DynamicSalaryInfoVo dynamicSalaryInfoVo);

	List<?> searchDynamicSalaryEmp(LoginVo loginVo);
	
}
