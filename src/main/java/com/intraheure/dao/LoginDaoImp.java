package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.LoginVo;

@Repository
public class LoginDaoImp implements LoginDao {
	@Autowired
	SessionFactory sessionFactory;

	public void addUser(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		session.save(loginVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> searchLoginId(String userName) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("SELECT loginId FROM LoginVo WHERE username = '" + userName + "'");
		List<?> loginId = query.list();

		session.close();
		return loginId;
	}

	@Override
	public List<?> searchLoginData(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LoginVo WHERE loginId = '" + loginVo.getLoginId() + "'");
		List<?> loginVoData = query.list();

		session.close();
		return loginVoData;
	}

	@Override
	public List<?> searchEmployee() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LoginVo WHERE role = 'ROLE_EMPLOYEE'");
		List<?> loginId = query.list();
		return loginId;
	}

	@Override
	public List<?> searchHr() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LoginVo WHERE role = 'ROLE_HR'");
		List<?> loginId = query.list();
		return loginId;

	}

	@Override
	public List<?> departmentLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM DepartmentVo");
		List<?> loginId = query.list();
		return loginId;

	}

	@Override
	public List<?> leaverequestLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LeaveRequestVo");
		List<?> loginId = query.list();
		return loginId;

	}

	@Override
	public List<?> resignrequestLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM ComplainVo");
		List<?> loginId = query.list();
		return loginId;
	}

	@Override
	public List<?> complainLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM ComplainVo");
		List<?> loginId = query.list();
		return loginId;

	}

	@Override
	public List<?> feedbacklogin() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM FeedbackVo");
		List<?> loginId = query.list();
		return loginId;
	}

	@Override
	public List<?> employeelogin() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LoginVo WHERE role = 'ROLE_EMPLOYEE'");
		List<?> loginId = query.list();
		return loginId;
	}

	@Override
	public List<?> departmentHrLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM DepartmentVo");
		List<?> loginId = query.list();
		return loginId;

	}

	@Override
	public List<?> leaverequestHrLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LeaveRequestVo");
		List<?> loginId = query.list();
		return loginId;

	}

	@Override
	public List<?> resignrequestHrLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM ComplainVo");
		List<?> loginId = query.list();
		return loginId;
	}

	@Override
	public List<?> complainHrLogin() {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM ComplainVo");
		List<?> loginId = query.list();
		return loginId;

	}

	@Override
	public List<?> totalrequestlogin() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM FeedbackVo");
		List<?> loginId = query.list();
		return loginId;
	}

	@Override
	public List<?> searchLoginDataFromUserName(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("FROM LoginVo WHERE username = '" + loginVo.getUserName() + "'");
		List<?> loginData = query.list();

		session.close();
		return loginData;
	}

}
