package com.intraheure.controller;

import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.DynamicSalaryInfoVo;
import com.intraheure.model.SalaryVo;
import com.intraheure.service.DepartmentService;
import com.intraheure.service.EmployeeService;
import com.intraheure.service.SalaryService;

@Controller
public class SalaryController {
	@Autowired
	DepartmentService departmentService;

	@Autowired
	SalaryService salaryService;

	@Autowired
	EmployeeService employeeService;

//----------------------------------------------Admin Methods-----------------------------------------------
	@RequestMapping(value = "admin/manageSalary", method = RequestMethod.GET)
	public ModelAndView loadSalaryPage_ADMIN() {
		List<?> departmentData = departmentService.viewDepartment();
		List<?> salaryData = salaryService.viewSalary();
		List<?> employeeData = employeeService.viewEmployeeData();
		return new ModelAndView("admin/salary").addObject("addSalary", new SalaryVo())
				.addObject("departmentData", departmentData).addObject("salaryData", salaryData)
				.addObject("employeeData", employeeData);
	}

	@RequestMapping(value = "admin/addSalary", method = RequestMethod.POST)
	public ModelAndView addSalary_ADMIN(@ModelAttribute SalaryVo salaryVo, DynamicSalaryInfoVo dynamicSalaryInfoVo) {
		salaryVo.setDeletestatus("deactive");
		salaryVo.setFreeLeavePerYear(12);
		salaryService.addSalary(salaryVo);

		dynamicSalaryInfoVo.setFreeLeave(1);
		dynamicSalaryInfoVo.setLoginVo(salaryVo.getLoginVo());
		dynamicSalaryInfoVo.setPaidLeave(0);
		dynamicSalaryInfoVo.setSalaryVo(salaryVo);
		double salaryPerMonth = salaryVo.getNetSalary() / 12;
		dynamicSalaryInfoVo.setSalaryPerMonth(salaryPerMonth);
		dynamicSalaryInfoVo.setSalaryToGet(salaryPerMonth);
		dynamicSalaryInfoVo.setSalaryToGet(salaryPerMonth);
		salaryService.addDynamicSalary(dynamicSalaryInfoVo);

		return new ModelAndView("redirect:/admin/manageSalary");
	}

	@RequestMapping(value = "admin/deleteSalary")
	public ModelAndView deleteSalary_ADMIN(@ModelAttribute SalaryVo salaryVo) {
		salaryService.deleteSalary(salaryVo);
		return new ModelAndView("redirect:/admin/manageSalary");
	}

//------------------------------------------------------HR Methods-------------------------------------------------
	@RequestMapping(value = "hr/manageSalary", method = RequestMethod.GET)
	public ModelAndView loadSalaryPage_HR() {
		List<?> departmentData = departmentService.viewDepartment();
		List<?> salaryData = salaryService.viewSalary();
		List<?> employeeData = employeeService.viewEmployeeData();
		return new ModelAndView("hr/salary").addObject("addSalary", new SalaryVo())
				.addObject("departmentData", departmentData).addObject("salaryData", salaryData)
				.addObject("employeeData", employeeData);
	}

	@RequestMapping(value = "hr/addSalary", method = RequestMethod.POST)
	public ModelAndView addSalary_HR(@ModelAttribute SalaryVo salaryVo, DynamicSalaryInfoVo dynamicSalaryInfoVo) {
		salaryVo.setDeletestatus("deactive");
		salaryVo.setFreeLeavePerYear(12);
		salaryService.addSalary(salaryVo);

		dynamicSalaryInfoVo.setFreeLeave(0);
		dynamicSalaryInfoVo.setLoginVo(salaryVo.getLoginVo());
		dynamicSalaryInfoVo.setPaidLeave(0);
		dynamicSalaryInfoVo.setSalaryVo(salaryVo);
		double salaryPerMonth = salaryVo.getNetSalary() / 12;
		dynamicSalaryInfoVo.setSalaryPerMonth(salaryPerMonth);
		dynamicSalaryInfoVo.setSalaryToGet(salaryPerMonth);
		dynamicSalaryInfoVo.setSalaryToGet(salaryPerMonth);
		salaryService.addDynamicSalary(dynamicSalaryInfoVo);
		return new ModelAndView("redirect:/hr/manageSalary");
	}

	@RequestMapping(value = "hr/deleteSalary")
	public ModelAndView deleteSalary_HR(@ModelAttribute SalaryVo salaryVo) {
		salaryService.deleteSalary(salaryVo);
		return new ModelAndView("redirect:/hr/manageSalary");
	}

//------------------------------------------------------JSON Methods-----------------------------------------------
	@RequestMapping(value = "/searchSalary", method = RequestMethod.GET)
	public ModelAndView searchSalary(@ModelAttribute SalaryVo salaryVo, HttpSession session) {
		List<?> salaryData = salaryService.searchSalary(salaryVo);
		return new ModelAndView("searchSalary", "searchSalaryData", salaryData);
	}

	@RequestMapping(value = "/pdf", method = RequestMethod.GET)
	public void searchSalarypdf() throws FileNotFoundException {
		
	}
}
