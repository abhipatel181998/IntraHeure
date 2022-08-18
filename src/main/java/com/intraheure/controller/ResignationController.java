package com.intraheure.controller;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.api.MailService;
import com.intraheure.model.LoginVo;
import com.intraheure.model.ResignationVo;
import com.intraheure.service.EmployeeService;
import com.intraheure.service.LoginService;
import com.intraheure.service.ResignationService;

@Controller
public class ResignationController {
	@Autowired
	ResignationService resignationService;

	@Autowired
	EmployeeService employeeService;

	@Autowired
	LoginService loginService;

	@Autowired
	MailService mailService;

//-----------------------------------------------------HR Methods-----------------------------------
	@RequestMapping(value = "hr/manageResignRequest", method = RequestMethod.GET)
	public ModelAndView loadResignRequestPage_HR() {
		List<?> employeeData = employeeService.viewEmployeeData();
		List<?> resignData = resignationService.viewResignationRequests();
		return new ModelAndView("hr/resignRequest").addObject("employeeData", employeeData).addObject("resignationData",
				resignData);
	}

	@RequestMapping(value = "hr/approveResignRequest", method = RequestMethod.GET)
	public ModelAndView approveResignRequest(@RequestParam("resignationId") int resignationId,
			ResignationVo resignationVo, LoginVo loginVo) throws MessagingException {
		resignationVo.setResignationId(resignationId);
		List<?> resignationData = resignationService.searchResignRequest(resignationVo);
		ResignationVo resignationVo2 = (ResignationVo) resignationData.get(0);

		loginVo.setLoginId(resignationVo2.getRequestFrom().getLoginId());
		List<?> employeeData = loginService.searchLoginData(loginVo);
		LoginVo loginVo2 = (LoginVo) employeeData.get(0);

		mailService.sendApproveResignationMail(loginVo2);

		resignationService.approveResignRequest(resignationVo2);
		return new ModelAndView("redirect:/hr/manageResignRequest");
	}

	@RequestMapping(value = "hr/rejectResignRequest", method = RequestMethod.POST)
	public ModelAndView rejectResignRequest(@RequestParam("resignationId") int resignationId,
			@RequestParam("reason") String reason, ResignationVo resignationVo, LoginVo loginVo)
			throws MessagingException {
		resignationVo.setResignationId(resignationId);
		List<?> resignationData = resignationService.searchResignRequest(resignationVo);
		ResignationVo resignationVo2 = (ResignationVo) resignationData.get(0);

		loginVo.setLoginId(resignationVo2.getRequestFrom().getLoginId());
		List<?> employeeData = loginService.searchLoginData(loginVo);
		LoginVo loginVo2 = (LoginVo) employeeData.get(0);
		
		mailService.sendRejectResignationMail(loginVo2,reason);

		resignationService.rejectResignRequest(resignationVo);
		return new ModelAndView("redirect:/hr/manageResignRequest");
	}

//----------------------------------------------------JSON Methods-----------------------------------
	@RequestMapping(value = "searchResignRequest", method = RequestMethod.GET)
	public ModelAndView searchResignRequest(ResignationVo resignationVo,
			@RequestParam("resignationId") int resignationId) {
		resignationVo.setResignationId(resignationId);
		List<?> resignationData = resignationService.searchResignRequest(resignationVo);
		return new ModelAndView("searchResignRequest", "resignationData", resignationData);
	}
}
