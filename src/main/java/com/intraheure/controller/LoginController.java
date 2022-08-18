package com.intraheure.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intraheure.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/login")
	public String loadLoginPag() {
		return "login";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			System.out.println("logged out");
			new SecurityContextLogoutHandler().logout(request, response, authentication);
			request.getSession().invalidate();
			request.getSession().setAttribute("tempStatus", "success");
			request.getSession().setAttribute("statusText", "Logout Successfully!");
		}
		return "login";
	}
}
