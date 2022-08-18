package com.intraheure.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;
import com.intraheure.service.DepartmentService;
import com.intraheure.service.DesignationService;
import com.intraheure.service.EmployeeService;
import com.intraheure.service.RegistrationService;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@Autowired
	DepartmentService departmentService;

	@Autowired
	DesignationService designationService;

	@Autowired
	RegistrationService registrationService;

//-----------------------------------Methods for Admin--------------------------------------------------
	@RequestMapping(value = "admin/manageEmployee", method = RequestMethod.GET)
	public ModelAndView loadManageEmployeePage_ADMIN() {
		List<?> employeeData = employeeService.viewEmployeeData();
		return new ModelAndView("admin/employees").addObject("employeeData", employeeData);

	}

	@RequestMapping(value = "admin/deleteEmployee", method = RequestMethod.GET)
	public ModelAndView deleteEmployee_ADMIN(@ModelAttribute RegistrationVo employeeRegisterVo) {
		employeeService.deleteEmployee(employeeRegisterVo);
		return new ModelAndView("redirect:/admin/manageEmployee");
	}

	@RequestMapping(value = "admin/employeeRegRequest", method = RequestMethod.GET)
	public ModelAndView loadEmployeeRequestPage_ADMIN() {
		List<?> employeeData = employeeService.getEmployeeRegRequests();
		return new ModelAndView("admin/employeeRequest").addObject("employeeData", employeeData);
	}

//-----------------------------------Methods for HR--------------------------------------------------
	@RequestMapping(value = "hr/manageEmployee", method = RequestMethod.GET)
	public ModelAndView loadEmployeePage_HR(HttpSession session) {
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId((Integer) session.getAttribute("loginId"));
		List<?> registrationData = registrationService.searchRegistration(loginVo);
		RegistrationVo registrationVo = (RegistrationVo) registrationData.get(0);

		List<?> employeeData = employeeService.viewEmployeeData();
		List<?> departmentData = departmentService.viewDepartment();
		List<?> designationData = designationService.viewDesignation();
		return new ModelAndView("hr/employees").addObject("employeeData", employeeData)
				.addObject("editDesignation", new RegistrationVo()).addObject("departmentData", departmentData)
				.addObject("designationData", designationData)
				.addObject("departmentId", registrationVo.getDepartmentVo().getDepartmentId());
	}

	@RequestMapping(value = "hr/deleteEmployee", method = RequestMethod.GET)
	public ModelAndView deleteEmployee_HR(@ModelAttribute RegistrationVo employeeRegisterVo) {
		employeeService.deleteEmployee(employeeRegisterVo);
		return new ModelAndView("redirect:/hr/manageEmployee");
	}
	
	@RequestMapping(value = "hr/employeeRegRequest", method = RequestMethod.GET)
	public ModelAndView loadEmployeeRequestPage_HR() {
		List<?> employeeData = employeeService.getEmployeeRegRequests();
		return new ModelAndView("hr/employeeRequest").addObject("employeeData", employeeData);
	}

//---------------------------------------------JSON----------------------------------------------------
	@RequestMapping(value = "searchEmployeeByDesignation", method = RequestMethod.GET)
	public ModelAndView searchEmployeeByDesignation(@ModelAttribute RegistrationVo employeeRegisterVo) {
		List<?> employeeData = employeeService.employeeByDesigntion(employeeRegisterVo);
		return new ModelAndView("searchEmployeeByDesignation", "employeeByDesignation", employeeData);
	}

	@RequestMapping(value = "searchEmployee", method = RequestMethod.GET)
	public ModelAndView searchEmployee(@ModelAttribute RegistrationVo employeeRegisterVo) {
		List<?> employeeData = employeeService.searchEmployee(employeeRegisterVo);
		return new ModelAndView("searchEmployee", "searchEmployeeData", employeeData);
	}
}
