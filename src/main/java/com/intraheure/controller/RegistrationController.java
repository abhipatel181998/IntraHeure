package com.intraheure.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import com.intraheure.service.LoginService;
import com.intraheure.service.RegistrationService;
import com.intraheure.service.StateService;

@Controller
public class RegistrationController {
	@Autowired
	RegistrationService registrationService;

	@Autowired
	DepartmentService departmentService;

	@Autowired
	StateService stateService;

	@Autowired
	LoginService loginService;

//-------------------------------------------------Admin Methods------------------------------------------------------
	@RequestMapping(value = "admin/approveRegRequest", method = RequestMethod.GET)
	public ModelAndView approveRegRequest_ADMIN(@ModelAttribute RegistrationVo registrationVo) {
		registrationService.approveRegRequest(registrationVo);
		return new ModelAndView("redirect:/admin/hrRegRequest");
	}

	@RequestMapping(value = "admin/rejectRegRequest", method = RequestMethod.GET)
	public ModelAndView rejectRegRequest_ADMIN(@ModelAttribute RegistrationVo registrationVo) {
		registrationService.rejectRegRequest(registrationVo);
		return new ModelAndView("redirect:/admin/hrRegRequest");
	}

//---------------------------------------Hr Methods--------------------------------------------------------------
	@RequestMapping(value = "registerHr", method = RequestMethod.GET)
	public ModelAndView loadRegistrationPage_HR() {
		List<?> stateData = stateService.viewState();
		List<?> departmentData = departmentService.viewDepartment();

		return new ModelAndView("registerHr").addObject("hrRegister", new RegistrationVo())
				.addObject("stateData", stateData).addObject("departmentData", departmentData);
	}

	@RequestMapping(value = "hrRegister", method = RequestMethod.POST)
	public ModelAndView register_HR(@ModelAttribute RegistrationVo registerationVo, LoginVo loginVo,
			HttpSession session) {
		loginVo.setUserName(registerationVo.getLoginVo().getUserName());
		loginVo.setPassword(registerationVo.getLoginVo().getPassword());
		loginVo.setEnabled(0);
		loginVo.setRole("ROLE_HR");

		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
		String currentDateTime = localDateTime.format(formatter);
		registerationVo.setJoiningDate(currentDateTime);
		registerationVo.setEmail(registerationVo.getLoginVo().getUserName());
		registerationVo.setLoginVo(loginVo);
		registerationVo.setDeleteStatus("deactive");

		loginService.addUser(loginVo);

		registrationService.addUser(registerationVo);

		session.setAttribute("message",
				"You have Registered successfully. Once your application is approved you will be notified by email.");
		return new ModelAndView("redirect:/login");
	}

	@RequestMapping(value = "hr/approveRegRequest", method = RequestMethod.GET)
	public ModelAndView approveRegRequest_HR(@ModelAttribute RegistrationVo registrationVo) {
		registrationService.approveRegRequest(registrationVo);
		return new ModelAndView("redirect:/hr/employeeRegRequest");
	}

	@RequestMapping(value = "hr/rejectRegRequest", method = RequestMethod.GET)
	public ModelAndView rejectRegRequest_HR(@ModelAttribute RegistrationVo registrationVo) {
		registrationService.rejectRegRequest(registrationVo);
		return new ModelAndView("redirect:/hr/employeeRegRequest");
	}

//----------------------------------------------------Employee Methods--------------------------------------------
	@RequestMapping(value = "registerEmployee", method = RequestMethod.GET)
	public ModelAndView loadRegisterationPage_EMPLOYEE() {
		List<?> departmentData = departmentService.viewDepartment();
		List<?> stateData = stateService.viewState();

		return new ModelAndView("registerEmployee").addObject("addEmployee", new RegistrationVo())
				.addObject("departmentData", departmentData).addObject("stateData", stateData);
	}

	@RequestMapping(value = "employeeRegister", method = RequestMethod.POST)
	public ModelAndView register_EMPLOYEE(@ModelAttribute RegistrationVo registerationVo, LoginVo loginVo,
			HttpSession session) {
		loginVo.setUserName(registerationVo.getLoginVo().getUserName());
		loginVo.setPassword(registerationVo.getLoginVo().getPassword());
		loginVo.setRole("ROLE_EMPLOYEE");
		loginVo.setEnabled(0);

		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
		String currentDateTime = localDateTime.format(formatter);
		registerationVo.setJoiningDate(currentDateTime);
		registerationVo.setEmail(registerationVo.getLoginVo().getUserName());
		registerationVo.setLoginVo(loginVo);
		registerationVo.setDeleteStatus("deactive");

		loginService.addUser(loginVo);

		registrationService.addUser(registerationVo);

		session.setAttribute("message",
				"You have Registered successfully. Once your application is approved you will be notified by email.");
		return new ModelAndView("login");
	}
}
