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
public class HrDaoImp implements HrDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<?> viewHr() {
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("FROM RegistrationVo WHERE deleteStatus = 'deactive' AND loginVo.role = 'ROLE_HR'");

		List<?> hrData = query.list();

		session.close();
		return hrData;
	}

	@Override
	public void deleteHr(RegistrationVo registerationVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"UPDATE RegistrationVo SET deleteStatus = 'active' WHERE userId='" + registerationVo.getUserId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> searchHr(RegistrationVo registrationVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"FROM RegistrationVo WHERE userId='" + registrationVo.getUserId() + "' AND deleteStatus='deactive'");
		List<?> hrData = query.list();

		session.close();
		return hrData;
	}

	@Override
	public List<?> getHrRegRequests() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"FROM RegistrationVo WHERE deleteStatus = 'deactive' AND loginVo.role = 'ROLE_HR' AND loginVo.enabled = 0");

		List<?> hrRegRequests = query.list();
		session.close();
		return hrRegRequests;
	}
}
