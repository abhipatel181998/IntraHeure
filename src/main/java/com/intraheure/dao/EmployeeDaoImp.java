package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.RegistrationVo;

@Repository
public class EmployeeDaoImp implements EmployeeDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<?> employeeByDesigntion(RegistrationVo RegistrationVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM RegistrationVo WHERE designationVo_designationId = '"
				+ RegistrationVo.getDesignationVo().getDesignationId() + "' AND deleteStatus = 'deactive'");

		List<?> employeeData = query.list();

		session.close();
		return employeeData;
	}

	@Override
	public List<?> viewEmployeeData() {
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("FROM RegistrationVo WHERE deleteStatus = 'deactive' AND loginVo.role = 'ROLE_EMPLOYEE'");

		List<?> employeeData = query.list();

		session.close();
		return employeeData;
	}

	@Override
	public void deleteEmployee(RegistrationVo RegistrationVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"UPDATE RegistrationVo SET deleteStatus = 'active' WHERE userId='" + RegistrationVo.getUserId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> searchEmployee(RegistrationVo RegistrationVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM RegistrationVo WHERE deleteStatus = 'deactive' AND userId = '"
				+ RegistrationVo.getUserId() + "'");

		List<?> employeeData = query.list();

		session.close();
		return employeeData;
	}

	@Override
	public List<?> getEmployeeRegRequests() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"FROM RegistrationVo WHERE deleteStatus = 'deactive' AND loginVo.role = 'ROLE_EMPLOYEE' AND loginVo.enabled = 0");

		List<?> employeeData = query.list();

		session.close();
		return employeeData;
	}
}
