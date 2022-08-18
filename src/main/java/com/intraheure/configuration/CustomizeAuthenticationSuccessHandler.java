package com.intraheure.configuration;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;
import com.intraheure.service.LoginService;
import com.intraheure.service.RegistrationService;

@Component
public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	LoginService loginService;

	@Autowired
	RegistrationService registrationService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();

		// set our response to OK status
		response.setStatus(HttpServletResponse.SC_OK);

		boolean admin = false;
		boolean hr = false;
		boolean employee = false;

		System.out.println("AT onAuthenticationSuccess(...) function!");

		for (GrantedAuthority auth : authentication.getAuthorities()) {
			if ("ROLE_ADMIN".equals(auth.getAuthority())) {
				admin = true;
			} else if ("ROLE_HR".equals(auth.getAuthority())) {
				hr = true;
			} else if ("ROLE_EMPLOYEE".equals(auth.getAuthority())) {
				employee = true;
			} else {

			}
		}

		if (admin) {
			System.out.println("user is admin");
			session.setAttribute("loginId", loginId());
			response.sendRedirect("/admin/dashboard");
		} else if (hr) {
			System.out.println("user is hr");
			session.setAttribute("loginId", loginId());
			registrationService.setSessionRegistrationVo();
			session.setAttribute("departmentId", getDepartmentId(loginId()));
			response.sendRedirect("/hr/dashboard");
		} else if (employee) {
			System.out.println("user is employee");
			session.setAttribute("loginId", loginId());
			registrationService.setSessionRegistrationVo();
			response.sendRedirect("/employee/dashboard");
		} else {
			System.out.println("user is anonymous");
			response.sendRedirect("/403");
		}
	}

	public int loginId() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = user.getUsername();
		List<?> loginIdList = loginService.searchLoginId(userName);
		Integer loginId = (Integer) loginIdList.get(0);
		return loginId;
	}

	public int getDepartmentId(int loginId) {
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId(loginId);
		List<?> data = registrationService.searchRegistration(loginVo);
		RegistrationVo registrationVo = (RegistrationVo) data.get(0);

		return registrationVo.getDepartmentVo().getDepartmentId();
	}
}
