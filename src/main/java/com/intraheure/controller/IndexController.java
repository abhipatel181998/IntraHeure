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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.ComplainVo;
import com.intraheure.model.DynamicSalaryInfoVo;
import com.intraheure.model.FileVO;
import com.intraheure.model.LeaveRequestVo;
import com.intraheure.model.LoginVo;
import com.intraheure.service.ComplainService;
import com.intraheure.service.FileService;
import com.intraheure.service.LeaveService;
import com.intraheure.service.LoginService;
import com.intraheure.service.RegistrationService;
import com.intraheure.service.SalaryService;

@Controller
public class IndexController {
	@Autowired
	FileService fileService;

	@Autowired
	SalaryService salaryService;

	@Autowired
	LeaveService leaveService;

	@Autowired
	ComplainService complainService;

	@Autowired
	LoginService loginservice;

	@Autowired
	RegistrationService registrationService;

	@RequestMapping(value = "/")
	public String loadLoginPag() {
		return "login";
	}

//--------------------------------------Admin Methods------------------------------
	@RequestMapping(value = "admin/dashboard", method = RequestMethod.GET)
	public String loadIndexPage_ADMIN(HttpSession session) {
		List<?> els = loginservice.searchEmployee();
		session.setAttribute("employeeList", els.size());

		List<?> hls = loginservice.searchHr();
		session.setAttribute("hrlist", hls.size());

		List<?> dls = loginservice.DepartmentLogin();
		session.setAttribute("departmentlist", dls.size());

		List<?> leavels = loginservice.LeaveRequestLogin();
		session.setAttribute("leaverequestlist", leavels.size());

		List<?> rls = loginservice.ResignRequestLogin();
		session.setAttribute("resignrequestlist", rls.size());

		List<?> cls = loginservice.ComplainLogin();
		session.setAttribute("complainlist", cls.size());

		List<?> fls = loginservice.FeedbackLogin();
		session.setAttribute("feedbacklist", fls.size());

		List<?> trls = loginservice.TotalRequestLogin();
		session.setAttribute("totalrequestlist", trls.size());

		return "admin/index";
	}

	@RequestMapping(value = "admin/file", method = RequestMethod.GET)
	public ModelAndView loadfile() {
		return new ModelAndView("admin/file", "file", new FileVO());
	}

	@RequestMapping(value = "admin/fileup", method = RequestMethod.POST)
	public ModelAndView loadfileup(HttpServletRequest request, @RequestParam("file") MultipartFile file,
			@ModelAttribute FileVO itemVO1) {
		String path = request.getSession().getServletContext().getRealPath("/");
		String filePath = path + "documents\\file\\";
		String fileName = file.getOriginalFilename();

		try {
			byte barr[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));

			bout.write(barr);
			bout.flush();
			bout.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		itemVO1.setFileName(fileName);
		itemVO1.setFilePath(filePath);

		this.fileService.itemInsert(itemVO1);
		return new ModelAndView("redirect:/loadaddItem");
	}

//---------------------------------------HR Methods----------------------------------
	@RequestMapping(value = "hr/dashboard", method = RequestMethod.GET)
	public String loadIndexPage_HR(HttpSession session) {
		registrationService.setSessionRegistrationVo();

		List<?> hls = loginservice.searchHr();
		session.setAttribute("hrlist", hls.size());

		List<?> els = loginservice.searchEmployee();
		session.setAttribute("employeeList", els.size());

		List<?> dls = loginservice.DepartmentLogin();
		session.setAttribute("departmentlist", dls.size());

		List<?> leavels = loginservice.LeaveRequestLogin();
		session.setAttribute("leaverequestlist", leavels.size());

		List<?> rls = loginservice.ResignRequestLogin();
		session.setAttribute("resignrequestlist", rls.size());

		List<?> cls = loginservice.ComplainLogin();
		session.setAttribute("complainlist", cls.size());

		return "hr/index";
	}

//-----------------------------------------Employee Methods----------------------------
	@RequestMapping(value = "employee/dashboard", method = RequestMethod.GET)
	public ModelAndView loadIndexPage_Employee(HttpSession session) {
		registrationService.setSessionRegistrationVo();
		
		int loginId = Integer.parseInt(session.getAttribute("loginId").toString());
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginId(loginId);

		List<?> dynamicSalaryData = salaryService.searchDynamicSalaryEmp(loginVo);
		if (dynamicSalaryData.size() > 0) {
			DynamicSalaryInfoVo dynamicSalaryVo = (DynamicSalaryInfoVo) dynamicSalaryData.get(0);
			session.setAttribute("salaryToGet", dynamicSalaryVo.getSalaryToGet());
			session.setAttribute("leaveAllowedThisMonth", dynamicSalaryVo.getFreeLeave());
		}else {
			session.setAttribute("salaryToGet", "Your Salary will be displayed soon");
			session.setAttribute("leaveAllowedThisMonth", 0);
		}
		

		List<?> leaveReaquestData = leaveService.searchLeaveRequest(loginVo);
		int pendingLeaveRequest = 0;
		for (int i = 0; i < leaveReaquestData.size(); i++) {
			LeaveRequestVo leaveRequestVo = (LeaveRequestVo) leaveReaquestData.get(i);
			if (leaveRequestVo.getRequestStatus() == 2) {
				pendingLeaveRequest++;
			}
		}
		session.setAttribute("pendingLeaveRequest", pendingLeaveRequest);

		List<?> complainData = complainService.searchComplain(loginVo);
		int pendingComplainRequest = 0;
		for (int i = 0; i < complainData.size(); i++) {
			ComplainVo complainVo = (ComplainVo) complainData.get(i);
			if (complainVo.getComplainStatus() == 1) {
				pendingComplainRequest++;
			}
		}
		session.setAttribute("pendingComplainRequest", pendingComplainRequest);

		return new ModelAndView("employee/index");
	}

//--------------------------------temp------------------------------------------------------
	@RequestMapping(value = "employee/postcomplain", method = RequestMethod.GET)
	public ModelAndView loadtest() {
		return new ModelAndView("employee/postcomplain", "addComplain", new ComplainVo());
	}
}