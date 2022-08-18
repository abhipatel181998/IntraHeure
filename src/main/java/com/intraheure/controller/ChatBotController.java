package com.intraheure.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.api.GeneratePdf;
import com.intraheure.api.MailService;
import com.intraheure.model.ComplainVo;
import com.intraheure.model.DynamicSalaryInfoVo;
import com.intraheure.model.FeedbackVo;
import com.intraheure.model.LeaveRequestVo;
import com.intraheure.model.LeaveTypeVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;
import com.intraheure.model.ResignationVo;
import com.intraheure.model.SalaryVo;
import com.intraheure.service.ComplainService;
import com.intraheure.service.FeedbackService;
import com.intraheure.service.LeaveService;
import com.intraheure.service.LoginService;
import com.intraheure.service.RegistrationService;
import com.intraheure.service.ResignationService;
import com.intraheure.service.SalaryService;

@Controller
public class ChatBotController {
	@Autowired
	SalaryService salaryService;

	@Autowired
	LeaveService leaveService;

	@Autowired
	LoginService loginService;

	@Autowired
	FeedbackService feedbackService;

	@Autowired
	ComplainService complainService;

	@Autowired
	RegistrationService registrationService;

	@Autowired
	ResignationService resignationService;

	@Autowired
	GeneratePdf generatePdf;

	@Autowired
	MailService mailService;

	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)

	@RequestMapping(value = "chatbot", method = RequestMethod.POST)
	public ModelAndView chat(@RequestBody String str, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/*
		 * System.out.println("********************************");
		 * System.out.println(str);
		 */

		String actionname = null;
		String loginId = null;

		JSONObject returnJson = null;

		JSONObject jsonData = new JSONObject(str);

		JSONObject result = (JSONObject) jsonData.get("result");
		loginId = (String) jsonData.get("sessionId");

		Object action = result.get("action");

		actionname = action.toString();

		if (actionname.equals("getSalary")) {
			Object parameters = result.get("parameters");
			String parameter_type = ((JSONObject) parameters).get("salary").toString();

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			List<?> salaryData = salaryService.searchUserSalary(loginVo);
			SalaryVo salaryVo = (SalaryVo) salaryData.get(0);

			String replyText = "Your annual " + parameter_type + " is RS. " + salaryVo.getNetSalary();
			returnJson = new JSONObject();

			returnJson.put("speech", replyText);
		}

		if (actionname.equals("requestForLeave")) {
			Object parameters = result.get("parameters");
			String leave_type = ((JSONObject) parameters).get("leave_type").toString();
			String fromDate = ((JSONObject) parameters).get("from_date").toString();
			String toDate = ((JSONObject) parameters).get("to_date").toString();
			String reason = ((JSONObject) parameters).get("reason").toString();

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			LeaveRequestVo leaveRequestVo = new LeaveRequestVo();
			leaveRequestVo.setFromDate(fromDate);
			leaveRequestVo.setToDate(toDate);
			leaveRequestVo.setRequestStatus(2);
			leaveRequestVo.setLeaveReason(reason);
			leaveRequestVo.setLoginVo(loginVo);
			LeaveTypeVo leaveTypeVo = new LeaveTypeVo();

			if (leave_type.startsWith("sick")) {
				leaveTypeVo.setLeaveName("Medical Leave");
				List<?> leaveTypeData = leaveService.searchLeaveTypeId(leaveTypeVo);
				LeaveTypeVo leaveTypeId = (LeaveTypeVo) leaveTypeData.get(0);
				leaveRequestVo.setLeaveTypeVo(leaveTypeId);
			}
			if (leave_type.startsWith("personal")) {
				leaveTypeVo.setLeaveName("Casual Leave");
				List<?> leaveTypeData = leaveService.searchLeaveTypeId(leaveTypeVo);
				LeaveTypeVo leaveTypeId = (LeaveTypeVo) leaveTypeData.get(0);
				leaveRequestVo.setLeaveTypeVo(leaveTypeId);
			}
			if (leave_type.startsWith("half")) {
				leaveTypeVo.setLeaveName("Half Leave");
				List<?> leaveTypeData = leaveService.searchLeaveTypeId(leaveTypeVo);
				LeaveTypeVo leaveTypeId = (LeaveTypeVo) leaveTypeData.get(0);
				leaveRequestVo.setLeaveTypeVo(leaveTypeId);
			}

			leaveService.addLeaveRequest(leaveRequestVo);
		}

		if (actionname.endsWith("getPFInfo")) {
			Object parameters = result.get("parameters");
			String parameter_type = ((JSONObject) parameters).get("pf").toString();

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			List<?> salaryData = salaryService.searchUserSalary(loginVo);
			SalaryVo salaryVo = (SalaryVo) salaryData.get(0);

			String replyText = "Your annual " + parameter_type + " is rs. " + salaryVo.getPf();
			returnJson = new JSONObject();

			returnJson.put("speech", replyText);
		}

		if (actionname.equals("getMonthlySalaryInfo")) {
			Object parameters = result.get("parameters");
			String parameter_type = ((JSONObject) parameters).get("salary").toString();

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			List<?> salaryData = salaryService.searchDynamicSalaryEmp(loginVo);
			DynamicSalaryInfoVo dynamicSalaryInfoVo = (DynamicSalaryInfoVo) salaryData.get(0);

			String replyText = "Your monthly " + parameter_type + " is rs." + dynamicSalaryInfoVo.getSalaryPerMonth()
					+ " and you will get RS." + dynamicSalaryInfoVo.getSalaryToGet() + " this month.";
			returnJson = new JSONObject();

			returnJson.put("speech", replyText);
		}

		if (actionname.equals("leaveInquiry")) {

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			List<?> salaryData = salaryService.searchDynamicSalaryEmp(loginVo);
			DynamicSalaryInfoVo dynamicSalaryInfoVo = (DynamicSalaryInfoVo) salaryData.get(0);

			int totalLeave;
			if (dynamicSalaryInfoVo.getFreeLeave() == 0) {
				totalLeave = dynamicSalaryInfoVo.getPaidLeave() + 1;
			} else {
				totalLeave = dynamicSalaryInfoVo.getPaidLeave();
			}
			String replyText = "You have " + dynamicSalaryInfoVo.getFreeLeave() + " free leave left and you took "
					+ totalLeave + " leaves this month.";
			returnJson = new JSONObject();

			returnJson.put("speech", replyText);
		}

		if (actionname.equals("salaryDeductionInfo")) {
			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			List<?> salaryData = salaryService.searchDynamicSalaryEmp(loginVo);
			DynamicSalaryInfoVo dynamicSalaryInfoVo = (DynamicSalaryInfoVo) salaryData.get(0);

			int totalLeave;
			if (dynamicSalaryInfoVo.getFreeLeave() == 0) {
				totalLeave = dynamicSalaryInfoVo.getPaidLeave() + 1;
			} else {
				totalLeave = dynamicSalaryInfoVo.getPaidLeave();
			}
			Double deductionAmount = dynamicSalaryInfoVo.getSalaryPerMonth() - dynamicSalaryInfoVo.getSalaryToGet();
			String replyText = null;
			if (dynamicSalaryInfoVo.getPaidLeave() == 0) {
				replyText = "You have not taken any leave until now for this month so your deduction amount is rs."
						+ deductionAmount + " for this month.";
			}
			if (dynamicSalaryInfoVo.getPaidLeave() != 0) {
				replyText = "You took " + totalLeave + "leaves this month so rs." + deductionAmount
						+ " is deducted from your monthly salary.";
			}
			returnJson = new JSONObject();

			returnJson.put("speech", replyText);
		}

		if (actionname.equals("getFeedback")) {
			Object parameters = result.get("parameters");
			String feedbackDesc = ((JSONObject) parameters).get("feedbackDesc").toString();
			int ratting = Integer.parseInt(((JSONObject) parameters).get("ratting").toString());

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			LocalDateTime localDateTime = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");

			String currentDateTime = localDateTime.format(formatter);

			FeedbackVo feedbackVo = new FeedbackVo();

			feedbackVo.setDeleteStatus("deactive");
			feedbackVo.setFeedbackFrom(loginVo);
			feedbackVo.setFeedbackDesc(feedbackDesc);
			feedbackVo.setRatings(ratting);
			feedbackVo.setFeedbackDate(currentDateTime);

			feedbackService.addFeedback(feedbackVo);
		}

		if (action.equals("complainRequest")) {
			LoginVo from_loginVo = new LoginVo();
			ComplainVo complainVo = new ComplainVo();

			Object parameters = result.get("parameters");
			String subject = ((JSONObject) parameters).get("subject").toString();
			String description = ((JSONObject) parameters).get("description").toString();

			int from_loginId = Integer.parseInt(loginId);
			from_loginVo.setLoginId(from_loginId);

			List<?> getDepartmentId = complainService.getDepartmentId(from_loginVo);
			RegistrationVo departmentId = (RegistrationVo) getDepartmentId.get(0);
			complainVo.setComplainSub(subject);
			complainVo.setComplainDesc(description);
			complainVo.setComplainFrom(from_loginVo);

			List<?> getToId = complainService.getToId(departmentId);
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

			complainService.sendComplain(complainVo);
		}

		if (action.equals("requestSalarySlip")) {
			Object parameters = result.get("parameters");

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			String[] dates = ((JSONObject) parameters).get("month").toString().split("/");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = format.parse(dates[0]);
			SimpleDateFormat getmonth = new SimpleDateFormat("MMMM");
			String month = getmonth.format(startDate);
			int year = Calendar.getInstance().get(Calendar.YEAR);

			List<?> salaryData = salaryService.searchUserSalary(loginVo);
			SalaryVo salaryVo = (SalaryVo) salaryData.get(0);

			List<?> userData = registrationService.searchRegistration(loginVo);
			RegistrationVo registrationVo = (RegistrationVo) userData.get(0);

			generatePdf.makeSalarySlip(salaryVo, registrationVo, month, year);

			String replyText = "Your salary slip for " + month + " " + year
					+ " is sended to your registered email address.";
			returnJson = new JSONObject();
			returnJson.put("speech", replyText);

			String fileName = "EID" + registrationVo.getUserId() + month + year + ".pdf";
			mailService.sendSalarySlip(fileName, registrationVo, month, year);

		}

		if (action.equals("requestForResign-yes")) {
			JSONArray contexts = (JSONArray) result.get("contexts");
			JSONObject json = (JSONObject) contexts.get(0);
			Object parameters = json.get("parameters");
			String reason = ((JSONObject) parameters).get("reason").toString();

			LoginVo loginVo = new LoginVo();
			loginVo.setLoginId(Integer.parseInt(loginId));

			LocalDateTime localDateTime = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm:ss a");
			String requestDate = localDateTime.format(formatter);

			ResignationVo resignationVo = new ResignationVo();
			resignationVo.setRequestFrom(loginVo);
			resignationVo.setReason(reason);
			resignationVo.setRequestDate(requestDate);

			resignationService.addResignationRequest(resignationVo);

		}

		return new ModelAndView("employee/chatJson", "json", returnJson);
	}
}