package com.intraheure.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.LoginVo;

@Repository
public class ChangePasswordDaoImp implements ChangePasswordDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void updatePassword(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("UPDATE LoginVo SET password = '" + loginVo.getPassword()
				+ "' WHERE loginId = '" + loginVo.getLoginId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();

	}

}
