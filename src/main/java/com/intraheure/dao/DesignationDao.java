package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.DesignationVo;

public interface DesignationDao {

	List<?> viewDesignation();

	void addDesignation(DesignationVo designationVo);

	List<?> searchDesignation(DesignationVo designationVo);

	void deleteDesignation(DesignationVo designationVo);

	List<?> searchDesignationByDepartment(DesignationVo designationVo);

}
