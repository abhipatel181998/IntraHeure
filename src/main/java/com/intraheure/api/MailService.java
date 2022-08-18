package com.intraheure.api;

import java.net.URL;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;
import com.intraheure.service.LoginService;

@Service
public class MailService {

	URL resource = getClass().getResource("/");
	String path = resource.getPath();

	@Autowired
	public JavaMailSender javaMailSender;

	@Autowired
	LoginService loginService;

	public void sendSalarySlip(String fileName, RegistrationVo registrationVo, String month, int year)
			throws MessagingException {

		final String DEST = path.replace("/target/classes/", "") + "/src/main/resources/salarySlip/" + fileName;

		MimeMessage message = this.javaMailSender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		helper.setTo(registrationVo.getEmail());
		helper.setSubject("IntraHeure SalarySlip");
		helper.setFrom("Intra-Heure");
		helper.setText("Here is your salary slip for " + month + " " + year + ".");

		FileSystemResource resource = new FileSystemResource(DEST);
		helper.addAttachment("Salary Slip(" + month + " " + year + ").pdf", resource);

		javaMailSender.send(message);
		System.out.println("salary slip mailed");
	}

	public void sendApproveResignationMail(LoginVo loginVo2) throws MessagingException {
		MimeMessage message = this.javaMailSender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		helper.setTo(loginVo2.getUserName());
		helper.setSubject("IntraHeure - About Resignation Request");
		helper.setFrom("Intra-Heure");
		helper.setText("Your Resignation is accepted. you will be not able to login from now.");

		javaMailSender.send(message);
		System.out.println("resign approved mailed");
	}

	public void sendRejectResignationMail(LoginVo loginVo2, String reason) throws MessagingException {
		MimeMessage message = this.javaMailSender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		System.out.println(loginVo2.getUserName());
		helper.setTo(loginVo2.getUserName());
		helper.setSubject("IntraHeure - About Resignation Request");
		helper.setFrom("Intra-Heure");
		helper.setText("Your Resignation is rejected. Becasue reason: " + reason);

		javaMailSender.send(message);
		System.out.println("resign reject mailed");
	}

	public void sendPassword(LoginVo loginVo) throws MessagingException {
		List<?> loginData = loginService.searchLoginDataFromUserName(loginVo);
		LoginVo loginVo2 = (LoginVo) loginData.get(0);

		MimeMessage message = this.javaMailSender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		helper.setTo(loginVo2.getUserName());
		helper.setSubject("IntraHeure - Reset Password");
		helper.setFrom("Intra-Heure");
		helper.setText("Your Password is : " + loginVo2.getPassword());

		javaMailSender.send(message);
		System.out.println("reset password mailed");

	}

}
