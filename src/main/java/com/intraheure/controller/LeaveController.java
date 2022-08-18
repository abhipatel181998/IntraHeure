package com.intraheure.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.DynamicSalaryInfoVo;
import com.intraheure.model.LeaveRequestVo;
import com.intraheure.model.LeaveTypeVo;
import com.intraheure.service.EmployeeService;
import com.intraheure.service.LeaveService;
import com.intraheure.service.SalaryService;

@Controller
public class LeaveController {
	@Autowired
	LeaveService leaveService;

	@Autowired
	EmployeeService employeeService;

	@Autowired
	SalaryService salaryService;

//------------------------------------------------------Admin Method---------------------------------------------------
	@RequestMapping(value = "admin/manageLeaveType", method = RequestMethod.GET)
	public ModelAndView loadLeaveTypePage_ADMIN() {
		List<?> leaveData = leaveService.viewLeave();
		return new ModelAndView("admin/leaveType").addObject("addLeaveType", new LeaveTypeVo()).addObject("leaveData",
				leaveData);
	}

	@RequestMapping(value = "admin/addLeaveType", method = RequestMethod.POST)
	public ModelAndView addLeaveType_ADMIN(@ModelAttribute LeaveTypeVo leaveVo) {
		leaveVo.setDeleteStatus("deactive");
		leaveService.addLeaveType(leaveVo);
		return new ModelAndView("redirect:/admin/manageLeaveType");
	}

	@RequestMapping(value = "admin/deleteLeaveType", method = RequestMethod.GET)
	public ModelAndView deleteLeaveType_ADMIN(@ModelAttribute LeaveTypeVo leaveVo) {
		leaveService.deleteLeaveType(leaveVo);
		return new ModelAndView("redirect:/admin/manageLeaveType");
	}

	@RequestMapping(value = "admin/viewLeaveRequest", method = RequestMethod.GET)
	public ModelAndView loadLeaveRequest_ADMIN() {
		List<?> leaveRequests = leaveService.viewLeaveRequest();
		List<?> employeeData = employeeService.viewEmployeeData();
		return new ModelAndView("admin/leaveRequest", "leaveRequestData", leaveRequests).addObject("employeeData",
				employeeData);

	}

//-------------------------------------------------------HR Methods--------------------------------------------------------
	@RequestMapping(value = "hr/viewLeaveType", method = RequestMethod.GET)
	public ModelAndView loadLeaveTypePage_HR() {
		List<?> leaveData = leaveService.viewLeave();
		return new ModelAndView("hr/leaveType").addObject("leaveData", leaveData);
	}

	@RequestMapping(value = "hr/manageLeaveRequest", method = RequestMethod.GET)
	public ModelAndView loadLeaveRequest_HR() {
		List<?> leaveRequests = leaveService.viewLeaveRequest();
		List<?> employeeData = employeeService.viewEmployeeData();
		return new ModelAndView("hr/leaveRequest", "leaveRequestData", leaveRequests)
				.addObject("employeeData", employeeData).addObject("leaveReq", new LeaveRequestVo());
	}

	@RequestMapping(value = "hr/leaveApprove", method = RequestMethod.POST)
	public ModelAndView approveLeave(@ModelAttribute LeaveRequestVo leaveRequestVo) throws Exception {

		int sundays = 0, leaveDays = 0, monthMaxDays = 0;
		Double salaryToGet = 0.0;

		List<?> dynamicSalaryData = salaryService.searchDynamicSalaryEmp(leaveRequestVo.getLoginVo());
		DynamicSalaryInfoVo dynamicSalaryInfoVo = (DynamicSalaryInfoVo) dynamicSalaryData.get(0);

		List<?> leaveRequestData = leaveService.searchLeaveRequest(leaveRequestVo.getLoginVo());
		LeaveRequestVo leaveRequestVo2 = (LeaveRequestVo) leaveRequestData.get(0);

		SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
		String toDate = leaveRequestVo2.getToDate();
		String fromDate = leaveRequestVo2.getFromDate();

		Date date_toDate = myFormat.parse(toDate);
		Date date_fromDate = myFormat.parse(fromDate);	
		long diff = date_fromDate.getTime() - date_toDate.getTime();
		leaveDays = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

		Calendar c1 = Calendar.getInstance();
		c1.setTime(date_toDate);

		Calendar c2 = Calendar.getInstance();
		c2.setTime(date_fromDate);

		while (!c1.after(c2)) {

			if (c1.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
				sundays++;
			}

			c1.add(Calendar.DATE, 1);
		}
		monthMaxDays = c1.getActualMaximum(Calendar.DAY_OF_MONTH);

		Double salaryPerDay = dynamicSalaryInfoVo.getSalaryPerMonth() / monthMaxDays;

		if (dynamicSalaryInfoVo.getFreeLeave() == 1) {
			dynamicSalaryInfoVo.setFreeLeave(0);
			dynamicSalaryInfoVo.setPaidLeave(dynamicSalaryInfoVo.getPaidLeave() + leaveDays - sundays - 1);

			Double salaryToCut = (salaryPerDay) * (leaveDays - sundays + 1);
			salaryToGet = dynamicSalaryInfoVo.getSalaryToGet() - salaryToCut;

			dynamicSalaryInfoVo.setSalaryToGet(salaryToGet);

		} else {
			dynamicSalaryInfoVo.setPaidLeave(dynamicSalaryInfoVo.getPaidLeave() + leaveDays - sundays);
			Double salaryToCut = (salaryPerDay) * (leaveDays - sundays);
			salaryToGet = dynamicSalaryInfoVo.getSalaryToGet() - salaryToCut;

			dynamicSalaryInfoVo.setSalaryToGet(salaryToGet);
		}
		salaryService.addDynamicSalary(dynamicSalaryInfoVo);

		leaveRequestVo.setRequestStatus(0);
		leaveService.approveLeaveStatus(leaveRequestVo);

		return new ModelAndView("redirect:/hr/manageLeaveRequest");
	}

	@RequestMapping(value = "hr/leaveReject", method = RequestMethod.POST)
	public ModelAndView rejectLeave(@ModelAttribute LeaveRequestVo leaveRequestVo) {
		leaveRequestVo.setRequestStatus(1);
		leaveService.rejectLeaveStatus(leaveRequestVo);
		return new ModelAndView("redirect:/hr/manageLeaveRequest");
	}

//--------------------------------------------------------Employee Methods-------------------------------------------------
	@RequestMapping(value = "employee/viewLeave", method = RequestMethod.GET)
	public ModelAndView loadViewLeaveRequestPage() {
		List<?> leaveRequestData = leaveService.viewLeaveRequestData();
		return new ModelAndView("employee/leave", "leaveRequestData", leaveRequestData);
	}

//--------------------------------------------------------JSON-------------------------------------------------------------
	@RequestMapping(value = "searchLeaveType", method = RequestMethod.GET)
	public ModelAndView searchLeaveType(@ModelAttribute LeaveTypeVo leaveVo, HttpSession session) {
		List<?> searchLeaveData = leaveService.searchLeaveType(leaveVo);
		return new ModelAndView("searchLeaveType", "searchLeaveData", searchLeaveData);
	}

	@RequestMapping(value = "searchLeaveRequest", method = RequestMethod.GET)
	public ModelAndView searchLeaveRequest(@ModelAttribute LeaveRequestVo leaveRequestVo) {
		List<?> searchLeaveRequestData = leaveService.viewLeaveRequest();
		return new ModelAndView("searchLeaveRequest", "searchLeaveRequestData", searchLeaveRequestData);
	}

	@RequestMapping(value = "searchLeaveRequestEmp", method = RequestMethod.GET)
	public ModelAndView searchLeaveRequestEmp(@ModelAttribute LeaveRequestVo leaveRequestVo) {
		List<?> searchLeaveRequestEmp = leaveService.searchLeaveRequest(leaveRequestVo);
		return new ModelAndView("searchLeaveRequest", "searchLeaveRequestData", searchLeaveRequestEmp);
	}
}
