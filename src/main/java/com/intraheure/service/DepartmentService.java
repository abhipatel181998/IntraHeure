package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.DepartmentDao;
import com.intraheure.model.DepartmentVo;

@Service
public class DepartmentService {
	@Autowired
	DepartmentDao departmentDao;

	public List<?> viewDepartment() {
		List<?> viewDepartmentData = departmentDao.viewDepartment();
		return viewDepartmentData;
	}

	@Transactional
	public void addDepartment(DepartmentVo departmentVo) {
		departmentDao.addDepartment(departmentVo);
	}

	public List<?> searchDepartment(DepartmentVo departmentVo) {
		List<?> searchDepartmentData = departmentDao.searchDepartment(departmentVo);
		return searchDepartmentData;
	}

	@Transactional
	public void deleteDepartment(DepartmentVo departmentVo) {
		departmentDao.deleteDepartment(departmentVo);

	}

}
