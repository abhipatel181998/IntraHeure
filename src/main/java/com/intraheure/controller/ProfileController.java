package com.intraheure.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;
import com.intraheure.service.EmployeeService;
import com.intraheure.service.HrService;
import com.intraheure.service.LoginService;
import com.intraheure.service.ProfileService;
import com.intraheure.service.RegistrationService;
import com.intraheure.service.StateService;

@Controller
public class ProfileController {
	@Autowired
	EmployeeService employeeService;

	@Autowired
	HrService hrService;

	@Autowired
	StateService stateService;

	@Autowired
	ProfileService profileService;

	@Autowired
	RegistrationService registrationService;

	@Autowired
	LoginService loginService;

//----------------------------------------------------Admin Methods---------------------------------------------------	
	@RequestMapping(value = "admin/viewHrProfile")
	public ModelAndView searchProfileHrPage_ADMIN(@ModelAttribute RegistrationVo registerationVo) {
		List<?> hrData = hrService.searchHr(registerationVo);
		return new ModelAndView("admin/hrProfile", "hrData", hrData);
	}

	@RequestMapping(value = "admin/viewEmployeeProfile")
	public ModelAndView searchProfileEmployeePage_ADMIN(@ModelAttribute RegistrationVo employeeRegisterVo) {
		List<?> employeeData = employeeService.searchEmployee(employeeRegisterVo);
		return new ModelAndView("admin/employeeProfile", "employeeData", employeeData);
	}

//-----------------------------------------------------HR Methods------------------------------------------------------
	@RequestMapping(value = "hr/profile")
	public String loadViewProfilePage_HR() {
		registrationService.setSessionRegistrationVo();
		return "hr/profile";
	}

	@RequestMapping(value = "hr/editProfile")
	public ModelAndView loadEditProfilePage_HR() {
		List<?> stateData = stateService.viewState();
		registrationService.setSessionRegistrationVo();
		return new ModelAndView("hr/editProfile", "editProfile", new RegistrationVo()).addObject("stateData",
				stateData);
	}

	@RequestMapping(value = "hr/updateProfile")
	public ModelAndView updateProfile_HR(@ModelAttribute RegistrationVo registrationVo, HttpSession session,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId((Integer) session.getAttribute("loginId"));

		// upload profile picture
		String path = request.getSession().getServletContext().getRealPath("/");
		String filePath = path.replace("\\webapp\\", "") + "\\resources\\static\\profilePics";

		String profilePic = "UserId" + registrationVo.getUserId() + ".jpg";
		System.out.println(file.getOriginalFilename());

		try {
			byte barr[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + profilePic));

			bout.write(barr);
			bout.flush();
			bout.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		registrationVo.setProfilePic(profilePic);

		profileService.updateProfile(registrationVo, loginVo);
		return new ModelAndView("redirect:/hr/editProfile");
	}

	@RequestMapping(value = "hr/viewEmployeeProfile")
	public ModelAndView searchProfileEmployeePage_HR(@ModelAttribute RegistrationVo employeeRegisterVo) {
		List<?> employeeData = employeeService.searchEmployee(employeeRegisterVo);
		return new ModelAndView("hr/employeeProfile", "employeeData", employeeData);
	}

//---------------------------------------------------Employee Methods-------------------------------------------------------
	@RequestMapping(value = "employee/profile")
	public String loadProfilePage_EMPLOYEE() {
		registrationService.setSessionRegistrationVo();
		return "employee/profile";
	}

	@RequestMapping(value = "employee/editProfile")
	public ModelAndView loadEditProfilePage_Employee() {
		List<?> stateData = stateService.viewState();
		registrationService.setSessionRegistrationVo();
		return new ModelAndView("employee/editProfile", "editProfile", new RegistrationVo()).addObject("stateData",
				stateData);
	}

	@RequestMapping(value = "employee/updateProfile")
	public ModelAndView updateProfile_Employee(@ModelAttribute RegistrationVo registrationVo, HttpSession session,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId((Integer) session.getAttribute("loginId"));

		// upload profile picture
		String path = request.getSession().getServletContext().getRealPath("/");
		String filePath = path.replace("\\webapp\\", "") + "\\resources\\static\\profilePics";

		String profilePic = "UserId" + registrationVo.getUserId() + ".jpg";
		System.out.println(file.getOriginalFilename());

		try {
			byte barr[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + profilePic));

			bout.write(barr);
			bout.flush();
			bout.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		registrationVo.setProfilePic(profilePic);

		profileService.updateProfile(registrationVo, loginVo);
		return new ModelAndView("redirect:/employee/editProfile");
	}
}
