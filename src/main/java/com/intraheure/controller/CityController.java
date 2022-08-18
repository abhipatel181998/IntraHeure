package com.intraheure.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.CityVo;
import com.intraheure.service.CityService;
import com.intraheure.service.StateService;

@Controller
public class CityController {
	@Autowired
	StateService stateService;

	@Autowired
	CityService cityService;

//---------------------------------------------------Admin Methods-----------------------------------------------------
	@RequestMapping(value = "admin/manageCity", method = RequestMethod.GET)
	public ModelAndView loadCityPage_ADMIN() {
		List<?> cityData = cityService.viewCity();
		List<?> stateData = stateService.viewState();

		return new ModelAndView("admin/city").addObject("addCity", new CityVo()).addObject("cityData", cityData)
				.addObject("stateData", stateData);
	}

	@RequestMapping(value = "admin/addCity", method = RequestMethod.POST)
	public ModelAndView addCity(@ModelAttribute CityVo cityVo) {
		cityVo.setDeleteStatus("deactive");
		cityService.addCity(cityVo);

		return new ModelAndView("redirect:/admin/manageCity");

	}

	@RequestMapping(value = "admin/deleteCity", method = RequestMethod.GET)
	public ModelAndView deleteCity(@ModelAttribute CityVo cityVo) {
		cityService.deleteCity(cityVo);

		return new ModelAndView("redirect:/admin/manageCity");

	}

//--------------------------------------------------Hr Methods---------------------------------------------------
	@RequestMapping(value = "hr/viewCity", method = RequestMethod.GET)
	public ModelAndView loadCityPage_HR() {
		List<?> cityData = cityService.viewCity();
		List<?> stateData = stateService.viewState();

		return new ModelAndView("hr/city").addObject("cityData", cityData).addObject("stateData", stateData);
	}

//---------------------------------------------------JSON--------------------------------------------------------
	@RequestMapping(value = "searchCity", method = RequestMethod.GET)
	public ModelAndView searchCity(@ModelAttribute CityVo cityVo, HttpSession session) {
		List<?> searchCityData = cityService.searchCity(cityVo);
		return new ModelAndView("searchCity", "searchCityData", searchCityData);
	}

	@RequestMapping(value = "searchCityByState", method = RequestMethod.GET)
	public ModelAndView searchCityByState(@ModelAttribute CityVo cityVo, HttpSession session) {
		List<?> cityDataByState = cityService.searchCityByState(cityVo);
		return new ModelAndView("searchCityByState", "cityByState", cityDataByState);
	}
}
