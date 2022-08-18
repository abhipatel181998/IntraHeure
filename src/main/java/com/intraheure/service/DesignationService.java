package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.DesignationDao;
import com.intraheure.model.DesignationVo;

@Service
public class DesignationService {
	@Autowired
	DesignationDao designationDao;

	@SuppressWarnings("rawtypes")
	public List viewDesignation() {
		List viewDesignationData = designationDao.viewDesignation();
		return viewDesignationData;
	}

	@Transactional
	public void addDesignation(DesignationVo designationVo) {
		designationDao.addDesignation(designationVo);
	}

	public List<?> searchDesignation(DesignationVo designationVo) {
		List<?> searchDesignationData = designationDao.searchDesignation(designationVo);
		return searchDesignationData;
	}

	@Transactional
	public void deleteDesignation(DesignationVo designationVo) {
		designationDao.deleteDesignation(designationVo);
	}

	public List<?> searchDesignationByDepartment(DesignationVo designationVo) {
		List<?> designationByDepartment = designationDao.searchDesignationByDepartment(designationVo);
		return designationByDepartment;
	}

}
