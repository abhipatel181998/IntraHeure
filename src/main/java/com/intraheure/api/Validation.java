package com.intraheure.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.intraheure.model.LoginVo;
import com.intraheure.service.ValidationService;

@RestController
@RequestMapping(value = "validate")
public class Validation {
	@Autowired
	ValidationService validationService;

	@GetMapping("/checkEmail")
	public boolean checkEmail(@RequestParam("email") String email) {
		boolean status = validationService.checkEmail(email);
		return status;
	}

	@RequestMapping("/checkPassword")
	public boolean checkPassword(@RequestParam("loginId") int loginId, @RequestParam("password") String password,
			LoginVo loginVo) {
		loginVo.setLoginId(loginId);
		loginVo.setPassword(password);

		boolean status = validationService.checkPassword(loginVo);
		return status;
	}

}
