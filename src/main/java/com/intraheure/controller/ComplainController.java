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

import com.intraheure.model.ComplainVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;
import com.intraheure.service.ComplainService;
import com.intraheure.service.EmployeeService;
import com.intraheure.service.HrService;
import com.intraheure.service.RegistrationService;

@Controller
public class ComplainController {
	@Autowired
	ComplainService complainservice;

	@Autowired
	HrService hrService;

	@Autowired
	EmployeeService employeeService;

	@Autowired
	RegistrationService registrationService;

//-----------------------------------------Methods for Admin---------------------------------------------------------------------	

	@RequestMapping(value = "admin/manageHrComplain", method = RequestMethod.GET)
	public ModelAndView loadHrComplainPage_ADMIN() {
		List<?> complainData = complainservice.viewPendingComplain();
		List<?> hrData = hrService.viewHr();
		return new ModelAndView("admin/complain").addObject("replyComplain", new ComplainVo())
				.addObject("complainData", complainData).addObject("hrData", hrData);
	}

	@RequestMapping(value = "admin/viewAllComplain", method = RequestMethod.GET)
	public ModelAndView viewAllComplains_ADMIN() {
		List<?> complainData = complainservice.viewComplainData();
		List<?> registrationData = registrationService.viewRegistrationData();
		List<?> adminData = complainservice.getAdminId();
		return new ModelAndView("admin/allComplain").addObject("complainData", complainData)
				.addObject("registrationData", registrationData).addObject("adminData", adminData);
	}

	@RequestMapping(value = "admin/replyComplain", method = RequestMethod.POST)
	public ModelAndView replyComplain_ADMIN(@ModelAttribute ComplainVo complainVo, HttpSession session,
			LoginVo loginVo) {
		int loginId = (Integer) session.getAttribute("loginId");
		loginVo.setLoginId(loginId);
		complainVo.setComplainFrom(loginVo);

		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");

		String currentDateTime = localDateTime.format(formatter);
		complainVo.setReplyDate(currentDateTime);

		complainVo.setComplainStatus(0);
		complainVo.setDeleteStatus("deactive");

		complainservice.replyComplain(complainVo);

		return new ModelAndView("redirect:/admin/manageHrComplain");
	}

	@RequestMapping(value = "admin/deleteComplain", method = RequestMethod.GET)
	public ModelAndView deleteComplain_ADMIN(@ModelAttribute ComplainVo complainVo) {
		complainservice.deleteComplain(complainVo);
		return new ModelAndView("redirect:/admin/manageHrComplain");
	}

//-----------------------------------------Methods for HR---------------------------------------------------------------------	

	@RequestMapping(value = "hr/manageComplain", method = RequestMethod.GET)
	public ModelAndView manageEmployeeComplain_HR() {
		List<?> complainData = complainservice.viewPendingComplain();
		List<?> employeeData = employeeService.viewEmployeeData();
		return new ModelAndView("hr/complain").addObject("complainData", complainData).addObject("employeeData",
				employeeData);
	}

	@RequestMapping(value = "hr/postComplain", method = RequestMethod.GET)
	public ModelAndView loadPostComplainPage_HR(HttpSession session, ComplainVo complainVo) {

		int from_loginId = (Integer) session.getAttribute("loginId");
		LoginVo from_loginVo = new LoginVo();
		from_loginVo.setLoginId(from_loginId);
		complainVo.setComplainFrom(from_loginVo);

		List<?> complainData = complainservice.viewComplainHistory(complainVo);
		return new ModelAndView("hr/postComplain").addObject("addComplain", new ComplainVo()).addObject("complainData",
				complainData);
	}

	@RequestMapping(value = "hr/sendComplain", method = RequestMethod.POST)
	public ModelAndView sendComplain_HR(@ModelAttribute ComplainVo complainVo, HttpSession session) {
		int from_loginId = (Integer) session.getAttribute("loginId");
		LoginVo from_loginVo = new LoginVo();
		from_loginVo.setLoginId(from_loginId);
		complainVo.setComplainFrom(from_loginVo);

		List<?> data = complainservice.getAdminId();

		LoginVo loginVo1 = (LoginVo) data.get(0);
		int to_loginId = loginVo1.getLoginId();
		LoginVo to_loginVo = new LoginVo();
		to_loginVo.setLoginId(to_loginId);
		complainVo.setComplainTo(to_loginVo);

		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");

		String currentDateTime = localDateTime.format(formatter);
		complainVo.setComplainDate(currentDateTime);

		complainVo.setComplainStatus(1);
		complainVo.setDeleteStatus("deactive");

		complainservice.sendComplain(complainVo);

		return new ModelAndView("redirect:/hr/postComplain");
	}

	@RequestMapping(value = "hr/replyComplain", method = RequestMethod.POST)
	public ModelAndView replyComplain_HR(@ModelAttribute ComplainVo complainVo) {
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");

		String currentDateTime = localDateTime.format(formatter);
		complainVo.setReplyDate(currentDateTime);

		complainVo.setComplainStatus(0);
		complainVo.setDeleteStatus("deactive");

		complainservice.replyComplain(complainVo);

		return new ModelAndView("redirect:/hr/manageComplain");
	}

	@RequestMapping(value = "hr/deleteComplain", method = RequestMethod.GET)
	public ModelAndView deleteComplain_HR(@ModelAttribute ComplainVo complainVo) {
		complainservice.deleteComplain(complainVo);
		return new ModelAndView("redirect:/hr/manageComplain");
	}

//----------------------------------------------Employee Methods--------------------------------------
	@RequestMapping(value = "employee/complainHistory", method = RequestMethod.GET)
	public ModelAndView loadViewComplainPage_EMPLOYEE() {
		List<?> compalinData = complainservice.viewComplainData();
		return new ModelAndView("employee/complain").addObject("compalinData", compalinData);
	}

	@RequestMapping(value = "employee/sendComplain", method = RequestMethod.POST)
	public ModelAndView sendComplain_Employee(@ModelAttribute ComplainVo complainVo, HttpSession session) {
		int from_loginId = (Integer) session.getAttribute("loginId");
		LoginVo from_loginVo = new LoginVo();
		from_loginVo.setLoginId(from_loginId);
		complainVo.setComplainFrom(from_loginVo);

		List<?> getDepartmentId = complainservice.getDepartmentId(from_loginVo);
		RegistrationVo departmentVo = (RegistrationVo) getDepartmentId.get(0);

		List<?> getToId = complainservice.getToId(departmentVo);
		RegistrationVo registrationVo2 = (RegistrationVo) getToId.get(0);
		int to_loginId = registrationVo2.getLoginVo().getLoginId();
		LoginVo to_loginVo = new LoginVo();
		to_loginVo.setLoginId(to_loginId);
		complainVo.setComplainTo(to_loginVo);

		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");

		String currentDateTime = localDateTime.format(formatter);
		complainVo.setComplainDate(currentDateTime);

		complainVo.setComplainStatus(1);
		complainVo.setDeleteStatus("deactive");

		complainservice.sendComplain(complainVo);

		return new ModelAndView("redirect:/employee/test");
	}

	@RequestMapping(value = "employee/deleteComplain", method = RequestMethod.GET)
	public ModelAndView deleteComplain_EMPLOYEE(@ModelAttribute ComplainVo complainVo) {
		complainservice.deleteComplain(complainVo);
		return new ModelAndView("redirect:/employee/complainHistory");
	}

//----------------------------------------------JSON--------------------------------------------------
	@RequestMapping(value = "/searchComplain", method = RequestMethod.GET)
	public ModelAndView searchComplain(@ModelAttribute ComplainVo complainVo, HttpSession session) {
		List<?> searchData = complainservice.searchComplain(complainVo);
		return new ModelAndView("searchComplain", "searchComplainData", searchData);
	}
}
