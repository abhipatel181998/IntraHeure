package com.intraheure.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intraheure.api.MailService;
import com.intraheure.model.LoginVo;

@Controller
public class ForgetPasswordController {
	@Autowired
	MailService mailService;

	@RequestMapping(value = "forgetPassword")
	public String loadForgetPasswordPage() {
		return "forgetPassword";
	}

	@RequestMapping(value = "resetPassword")
	public String resetPassword(@RequestParam("username") String user, LoginVo loginVo) throws MessagingException {
		loginVo.setUserName(user);
		mailService.sendPassword(loginVo);
		return "login";
	}
}
