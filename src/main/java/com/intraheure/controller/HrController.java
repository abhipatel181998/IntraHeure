package com.intraheure.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.RegistrationVo;
import com.intraheure.service.HrService;

@Controller
public class HrController {
	@Autowired
	HrService hrService;

	

//-----------------------------------Methods for Admin--------------------------------------------------
	@RequestMapping(value = "admin/manageHr", method = RequestMethod.GET)
	public ModelAndView loadManageHrPage_ADMIN() {
		List<?> hrData = hrService.viewHr();
		return new ModelAndView("admin/hr").addObject("hrData", hrData);
	}

	@RequestMapping(value = "admin/deleteHr", method = RequestMethod.GET)
	public ModelAndView deleteHr_ADMIN(@ModelAttribute RegistrationVo registerationVo) {
		hrService.deleteHr(registerationVo);
		return new ModelAndView("redirect:/admin/manageHr");
	}

	@RequestMapping(value = "admin/hrRegRequest", method = RequestMethod.GET)
	public ModelAndView loadHrRequestPage_ADMIN() {
		List<?> hrData = hrService.getHrRegRequests();
		return new ModelAndView("admin/hrRequest").addObject("hrData", hrData);
	}

}
