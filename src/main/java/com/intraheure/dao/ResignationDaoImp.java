package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.ResignationVo;

@Repository
public class ResignationDaoImp implements ResignationDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addResignationRequest(ResignationVo resignationVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(resignationVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();

	}

	@Override
	public List<?> viewResignationRequests() {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("From ResignationVo");
		List<?> data = query.list();

		session.close();
		return data;
	}

	@Override
	public List<?> searchResignRequest(ResignationVo resignationVo) {
		Session session = sessionFactory.openSession();

		Query query = session
				.createQuery("From ResignationVo WHERE resignationId='" + resignationVo.getResignationId() + "'");
		List<?> data = query.list();

		session.close();
		return data;
	}

	@Override
	public void approveResignRequest(ResignationVo resignationVo2) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("DELETE FROM RegistrationVo WHERE loginVo.loginId = '"
				+ resignationVo2.getRequestFrom().getLoginId() + "'");
		query.executeUpdate();
		Query query1 = session.createQuery("DELETE FROM ComplainVo WHERE complainFrom.loginId = '"
				+ resignationVo2.getRequestFrom().getLoginId() + "'");
		query1.executeUpdate();
		Query query2 = session.createQuery("DELETE FROM DynamicSalaryInfoVo WHERE loginVo.loginId = '"
				+ resignationVo2.getRequestFrom().getLoginId() + "'");
		query2.executeUpdate();
		Query query3 = session.createQuery("DELETE FROM FeedbackVo WHERE feedbackFrom.loginId = '"
				+ resignationVo2.getRequestFrom().getLoginId() + "'");
		query3.executeUpdate();
		Query query4 = session.createQuery("DELETE FROM RegistrationVo WHERE loginVo.loginId = '"
				+ resignationVo2.getRequestFrom().getLoginId() + "'");
		query4.executeUpdate();
		Query query5 = session.createQuery("DELETE FROM LeaveRequestVo WHERE loginVo.loginId = '"
				+ resignationVo2.getRequestFrom().getLoginId() + "'");
		query5.executeUpdate();
		Query query6 = session.createQuery(
				"DELETE FROM SalaryVo WHERE loginVo.loginId = '" + resignationVo2.getRequestFrom().getLoginId() + "'");
		query6.executeUpdate();
		Query query7 = session.createQuery("DELETE FROM ResignationVo WHERE requestFrom.loginId = '"
				+ resignationVo2.getRequestFrom().getLoginId() + "'");
		query7.executeUpdate();
		Query query8 = session.createQuery(
				"DELETE FROM LoginVo WHERE loginId = '" + resignationVo2.getRequestFrom().getLoginId() + "'");
		query8.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();

	}

	@Override
	public void rejectResignRequest(ResignationVo resignationVo) {
		Session session = sessionFactory.openSession();
		Query query7 = session.createQuery("DELETE FROM ResignationVo WHERE resignationId = '"
				+ resignationVo.getResignationId() + "'");
		query7.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

}
