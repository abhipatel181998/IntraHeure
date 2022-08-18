package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.DepartmentVo;

public interface DepartmentDao {

	void addDepartment(DepartmentVo departmentVo);

	List<?> viewDepartment();

	List<?> searchDepartment(DepartmentVo departmentVo);

	void deleteDepartment(DepartmentVo departmentVo);

}
