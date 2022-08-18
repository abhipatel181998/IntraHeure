package com.intraheure.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.DesignationVo;
import com.intraheure.service.DepartmentService;
import com.intraheure.service.DesignationService;

@Controller
public class DesignationController {
	@Autowired
	DesignationService designationService;

	@Autowired
	DepartmentService departmentService;

//--------------------------------------------------Admin Methods---------------------------------------------
	@RequestMapping(value = "admin/manageDesignation", method = RequestMethod.GET)
	public ModelAndView loadDesignationPage_ADMIN() {
		List<?> designationData = designationService.viewDesignation();
		List<?> departmentData = departmentService.viewDepartment();

		return new ModelAndView("admin/designation").addObject("addDesignation", new DesignationVo())
				.addObject("designationData", designationData).addObject("departmentData", departmentData);
	}

	@RequestMapping(value = "admin/addDesignation", method = RequestMethod.POST)
	public ModelAndView addDesignation_ADMIN(@ModelAttribute DesignationVo designationVo) {
		designationVo.setDeleteStatus("deactive");
		designationService.addDesignation(designationVo);

		return new ModelAndView("redirect:/admin/manageDesignation");

	}

	@RequestMapping(value = "admin/deleteDesignation", method = RequestMethod.GET)
	public ModelAndView deleteDesignation_ADMIN(@ModelAttribute DesignationVo designationVo) {
		designationService.deleteDesignation(designationVo);

		return new ModelAndView("redirect:/admin/manageDesignation");
	}

//-------------------------------------------------HR Methods--------------------------------------------------------
	@RequestMapping(value = "hr/viewDesignation", method = RequestMethod.GET)
	public ModelAndView loadDesignationPage_HR() {
		List<?> designationData = designationService.viewDesignation();
		List<?> departmentData = departmentService.viewDepartment();

		return new ModelAndView("hr/designation").addObject("designationData", designationData)
				.addObject("departmentData", departmentData);
	}

//--------------------------------------------------JSON-------------------------------------------------------------
	@RequestMapping(value = "/searchDesignation", method = RequestMethod.GET)
	public ModelAndView searchDesignation(@ModelAttribute DesignationVo designationVo, HttpSession session) {
		List<?> searchDesignationData = designationService.searchDesignation(designationVo);
		return new ModelAndView("searchDesignation", "searchDesignationData", searchDesignationData);
	}

	@RequestMapping(value = "/searchDesignationByDepartment", method = RequestMethod.GET)
	public ModelAndView searchDesignationByDepartment(@ModelAttribute DesignationVo designationVo,
			HttpSession session) {
		List<?> designationByDepartment = designationService.searchDesignationByDepartment(designationVo);
		return new ModelAndView("searchDesignationByDepartment", "designationByDepartment", designationByDepartment);
	}
}
