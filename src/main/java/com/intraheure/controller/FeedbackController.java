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

import com.intraheure.model.FeedbackVo;
import com.intraheure.model.LoginVo;
import com.intraheure.service.FeedbackService;
import com.intraheure.service.RegistrationService;

@Controller
public class FeedbackController {
	@Autowired
	FeedbackService feedbackService;

	@Autowired
	RegistrationService registrationService;

//-----------------------------------------------Admin Methods--------------------------------------
	@RequestMapping(value = "admin/viewFeedback", method = RequestMethod.GET)
	public ModelAndView viewFeedback_ADMIN() {
		List<?> feedbacks = feedbackService.viewFeedback();
		List<?> registrationData = registrationService.viewRegistrationData();
		return new ModelAndView("admin/feedback").addObject("feedbackData", feedbacks).addObject("registrationData",
				registrationData);
	}

	@RequestMapping(value = "admin/deleteFeedback", method = RequestMethod.GET)
	public ModelAndView deleteFeedback_ADMIN(@ModelAttribute FeedbackVo feedbackVo) {
		feedbackService.deleteFeedback(feedbackVo);
		return new ModelAndView("redirect:/admin/viewFeedback");

	}

//--------------------------------------------------HR MMethods---------------------------------------
	@RequestMapping(value = "hr/feedback", method = RequestMethod.GET)
	public ModelAndView loadFeedbackPage_HR() {
		return new ModelAndView("hr/feedback", "addFeedback", new FeedbackVo());
	}

	@RequestMapping(value = "hr/postFeedback", method = RequestMethod.POST)
	public ModelAndView postFeedback_HR(@ModelAttribute FeedbackVo feedbackVo, HttpSession session) {
		int from_loginId = (Integer) session.getAttribute("loginId");
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId(from_loginId);
		feedbackVo.setFeedbackFrom(loginVo);
		feedbackVo.setDeleteStatus("deactive");

		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");

		String currentDateTime = localDateTime.format(formatter);
		feedbackVo.setFeedbackDate(currentDateTime);

		feedbackService.addFeedback(feedbackVo);
		return new ModelAndView("redirect:/hr/feedback");
	}

//--------------------------------------------------Employee Methods----------------------------------
	@RequestMapping(value = "employee/feedback", method = RequestMethod.GET)
	public ModelAndView loadFeedbackPage_EMPLOYEE() {
		return new ModelAndView("employee/feedback", "addFeedback", new FeedbackVo());
	}

	@RequestMapping(value = "employee/postFeedback", method = RequestMethod.POST)
	public ModelAndView postFeedback_EMPLOYEE(@ModelAttribute FeedbackVo feedbackVo, HttpSession session) {
		int from_loginId = (Integer) session.getAttribute("loginId");
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId(from_loginId);
		feedbackVo.setFeedbackFrom(loginVo);
		feedbackVo.setDeleteStatus("deactive");

		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");

		String currentDateTime = localDateTime.format(formatter);
		feedbackVo.setFeedbackDate(currentDateTime);

		feedbackService.addFeedback(feedbackVo);
		return new ModelAndView("redirect:/employee/feedback");
	}
}
