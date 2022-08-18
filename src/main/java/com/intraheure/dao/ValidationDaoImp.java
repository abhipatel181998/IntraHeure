package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.LoginVo;

@Repository
public class ValidationDaoImp implements ValidationDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean checkEmail(String email) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LoginVo WHERE userName = '" + email + "'");
		List<?> list = query.list();
		boolean status;
		if (list.size() == 0) {
			status = false;
		} else {
			status = true;
		}
		return status;
	}

	@Override
	public boolean checkPassword(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LoginVo WHERE loginId = '" + loginVo.getLoginId() + "'");
		List<?> list = query.list();
		LoginVo loginVo2 = (LoginVo) list.get(0);

		boolean status;
		if (loginVo2.getPassword().equals(loginVo.getPassword())) {
			status = true;
		} else {
			status = false;
		}
		return status;
	}

}
