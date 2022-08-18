package com.intraheure;

import com.intraheure.service.LoginService;
import com.intraheure.service.RegistrationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class, HibernateJpaAutoConfiguration.class })
public class SpringBootIntraHeureApplication extends SpringBootServletInitializer implements CommandLineRunner {
	@Autowired
	RegistrationService registrationService;
	
	@Autowired
	LoginService loginService;
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SpringBootIntraHeureApplication.class);
	}

	@Override
	public void run(String ...args) {
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootIntraHeureApplication.class, args);
	}
}
