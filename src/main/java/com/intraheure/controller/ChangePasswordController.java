package com.intraheure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.LoginVo;
import com.intraheure.service.ChangePasswordService;

@Controller
public class ChangePasswordController {
	@Autowired
	ChangePasswordService changePasswordService;

//---------------------------------------------------HR Methos----------------------------------------
	@RequestMapping(value = "hr/changePassword", method = RequestMethod.GET)
	public ModelAndView loadChangePasswordPage_HR() {
		return new ModelAndView("hr/changePassword", "loginVo", new LoginVo());
	}

	@RequestMapping(value = "hr/updatePassword", method = RequestMethod.POST)
	public ModelAndView updatePassword_HR(@ModelAttribute LoginVo loginVo, HttpSession session) {
		changePasswordService.updatePassword(loginVo);
		session.setAttribute("message", "Password Changed Successfully.");
		return new ModelAndView("redirect:/hr/changePassword");
	}

//---------------------------------------------Employee Methods----------------------------------------
	@RequestMapping(value = "employee/changePassword", method = RequestMethod.GET)
	public ModelAndView loadChangePasswordPage_EMPLOYEE() {
		return new ModelAndView("employee/changePassword", "loginVo", new LoginVo());
	}

	@RequestMapping(value = "employee/updatePassword", method = RequestMethod.POST)
	public ModelAndView updatePassword_EMPLOYEE(@ModelAttribute LoginVo loginVo, HttpSession session) {
		changePasswordService.updatePassword(loginVo);
		session.setAttribute("message", "Password Changed Successfully.");
		return new ModelAndView("redirect:/employee/changePassword");
	}

}
