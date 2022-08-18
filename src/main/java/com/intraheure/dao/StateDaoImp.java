package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.StateVo;

@Repository
public class StateDaoImp implements StateDao {
	@Autowired
	private SessionFactory sessionFactory;

	public List<?> viewState() {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM StateVo WHERE deleteStatus = 'deactive'");
		List<?> viewStateData = query.list();

		session.close();
		return viewStateData;
	}

	public void addState(StateVo stateVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(stateVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchSate(StateVo stateVo) {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery(
				"FROM StateVo WHERE stateId = '" + stateVo.getstateId() + "' AND deleteStatus = 'deactive'");
		List<?> viewStateData = query.list();

		session.close();
		return viewStateData;
	}

	public void deleteState(StateVo stateVo) {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery(
				"UPDATE StateVo SET deleteStatus='active' WHERE stateId = '" + stateVo.getstateId() + "'");
		query.executeUpdate();

		session.close();
	}

}
