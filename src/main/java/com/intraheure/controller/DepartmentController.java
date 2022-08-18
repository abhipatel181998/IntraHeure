package com.intraheure.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.DepartmentVo;
import com.intraheure.model.DesignationVo;
import com.intraheure.service.DepartmentService;
import com.intraheure.service.DesignationService;

@Controller
public class DepartmentController {
	@Autowired
	DepartmentService departmentService;

	@Autowired
	DesignationService designationService;
//-------------------------------------------------------Admin Methods-------------------------------------------------

	@RequestMapping(value = "admin/manageDepartment", method = RequestMethod.GET)
	public ModelAndView loadDepartmentPage_ADMIN() {
		List<?> viewDepartmentData = departmentService.viewDepartment();

		return new ModelAndView("admin/department").addObject("viewDepartmentData", viewDepartmentData)
				.addObject("addDepartment", new DepartmentVo());
	}

	@RequestMapping(value = "admin/addDepartment", method = RequestMethod.POST)
	public ModelAndView addDepartment_ADMIN(@ModelAttribute DepartmentVo departmentVo, DesignationVo designationVo) {
		departmentVo.setDeleteStatus("deactive");
		departmentService.addDepartment(departmentVo);

		designationVo.setDesignationName("Human Resources(HR)");
		designationVo.setDeleteStatus("deactive");
		designationVo.setDepartmentVo(departmentVo);
		designationService.addDesignation(designationVo);

		return new ModelAndView("redirect:/admin/manageDepartment");
	}

	@RequestMapping(value = "admin/editDepartment", method = RequestMethod.POST)
	public ModelAndView editDepartment_ADMIN(@ModelAttribute DepartmentVo departmentVo) {
		departmentVo.setDeleteStatus("deactive");
		departmentService.addDepartment(departmentVo);

		return new ModelAndView("redirect:/admin/manageDepartment");
	}

	@RequestMapping(value = "admin/deleteDepartment", method = RequestMethod.GET)
	public ModelAndView deleteDepartment_ADMIN(@ModelAttribute DepartmentVo departmentVo) {
		departmentService.deleteDepartment(departmentVo);

		return new ModelAndView("redirect:/admin/manageDepartment");
	}

//----------------------------------------------------HR Methods------------------------------------------------
	@RequestMapping(value = "hr/viewDepartment", method = RequestMethod.GET)
	public ModelAndView loadDepartmentPage_HR() {
		List<?> viewDepartmentData = departmentService.viewDepartment();

		return new ModelAndView("hr/department").addObject("viewDepartmentData", viewDepartmentData);
	}

//----------------------------------------------------JSON-------------------------------------------------------
	@RequestMapping(value = "/searchDepartment", method = RequestMethod.GET)
	public ModelAndView searchDepartment(@ModelAttribute DepartmentVo departmentVo, HttpSession session) {
		List<?> searchDepartmentData = departmentService.searchDepartment(departmentVo);
		return new ModelAndView("searchDepartment", "searchDepartmentData", searchDepartmentData);
	}
}
