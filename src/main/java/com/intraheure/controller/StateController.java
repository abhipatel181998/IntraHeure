package com.intraheure.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.StateVo;
import com.intraheure.service.StateService;

@Controller
public class StateController {
	@Autowired
	StateService stateService;

//---------------------------------------------Admin Methods----------------------------------------------------
	@RequestMapping(value = "admin/manageState", method = RequestMethod.GET)
	public ModelAndView loadStatePage_ADMIN() {
		List<?> viewStateData = stateService.viewState();
		return new ModelAndView("admin/state").addObject("addState", new StateVo()).addObject("viewStateData",
				viewStateData);
	}

	@RequestMapping(value = "admin/addState", method = RequestMethod.POST)
	public ModelAndView addState_ADMIN(@ModelAttribute StateVo stateVo) {
		stateVo.setDeleteStatus("deactive");

		stateService.addState(stateVo);

		return new ModelAndView("redirect:/admin/manageState");
	}

	@RequestMapping(value = "admin/deleteState", method = RequestMethod.GET)
	public ModelAndView deleteState_ADMIN(@ModelAttribute StateVo stateVo) {
		stateService.deleteState(stateVo);

		return new ModelAndView("redirect:/admin/manageState");
	}

//----------------------------------------------------HR Methods-------------------------------------------------------
	@RequestMapping(value = "hr/viewState", method = RequestMethod.GET)
	public ModelAndView loadStatePage_HR() {
		List<?> viewStateData = stateService.viewState();
		return new ModelAndView("hr/state").addObject("viewStateData", viewStateData);
	}

//-----------------------------------------------------JSON Methods-----------------------------------------------------	
	@RequestMapping(value = "searchState", method = RequestMethod.GET)
	public ModelAndView searchState(@ModelAttribute StateVo stateVo, HttpSession session) {
		List<?> searchStateData = stateService.searchState(stateVo);
		return new ModelAndView("searchState", "searchStateData", searchStateData);
	}
}
