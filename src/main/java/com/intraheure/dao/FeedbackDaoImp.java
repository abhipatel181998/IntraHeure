package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.FeedbackVo;

@Repository
public class FeedbackDaoImp implements FeedbackDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<?> viewFeedback() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM FeedbackVo WHERE deleteStatus = 'deactive'");
		List<?> feedbacks = query.list();

		session.close();
		return feedbacks;
	}

	@Override
	public void deleteFeedback(FeedbackVo feedbackVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"UPDATE FeedbackVo SET deleteStatus='active' WHERE feedbackId='" + feedbackVo.getFeedbackId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public void addFeedback(FeedbackVo feedbackVo) {
		System.out.println(feedbackVo.getDeleteStatus());
		System.out.println(feedbackVo.getFeedbackDate());
		System.out.println(feedbackVo.getFeedbackDesc());
		System.out.println(feedbackVo.getRatings());
		System.out.println(feedbackVo.getFeedbackFrom());
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(feedbackVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

}
