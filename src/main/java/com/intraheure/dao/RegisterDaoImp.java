package com.intraheure.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

@Repository
public class RegisterDaoImp implements RegisterDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addUser(RegistrationVo registerationVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(registerationVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> viewRegistrationData() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM RegistrationVo WHERE deleteStatus = 'deactive'");
		List<?> data = query.list();

		session.close();
		return data;
	}

	@Override
	public List<?> searchRegistration(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM RegistrationVo WHERE deleteStatus = 'deactive' AND loginVo.loginId = '"
				+ loginVo.getLoginId() + "'");
		List<?> data = query.list();

		session.close();
		return data;
	}

	@Override
	public void approveRegRequest(RegistrationVo registrationVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"UPDATE LoginVo SET enabled = 1 WHERE loginId = '" + registrationVo.getLoginVo().getLoginId() + "'");
		Transaction transaction = session.beginTransaction();
		query.executeUpdate();

		transaction.commit();

		session.close();
	}

	@Override
	public void rejectRegRequest(RegistrationVo registrationVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("DELETE FROM RegistrationVo WHERE loginVo.loginId = '"
				+ registrationVo.getLoginVo().getLoginId() + "'");
		query.executeUpdate();
		Query query1 = session
				.createQuery("DELETE FROM LoginVo WHERE loginId = '" + registrationVo.getLoginVo().getLoginId() + "'");
		query1.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

}
