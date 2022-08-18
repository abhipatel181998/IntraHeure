package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.ComplainVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

@Repository
public class ComplainDaoImp implements ComplainDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<?> viewComplainData() {
		Session session = sessionFactory.openSession();

		Query query = session
				.createQuery("FROM ComplainVo WHERE deleteStatus = 'deactive' ORDER BY complainStatus DESC");
		List<?> complainData = query.list();

		return complainData;
	}

	@Override
	public List<?> viewPendingComplain() {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM ComplainVo WHERE deleteStatus = 'deactive' AND complainStatus = '1'");
		List<?> complainData = query.list();

		return complainData;
	}

	@Override
	public void sendComplain(ComplainVo complainVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(complainVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> searchComplain(ComplainVo complainVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM ComplainVo where deleteStatus = 'deactive' AND complainId = '"
				+ complainVo.getComplainId() + "'");

		List<?> searchData = query.list();
		return searchData;
	}

	@Override
	public void deleteComplain(ComplainVo complainVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("UPDATE ComplainVo SET deleteStatus = 'active' WHERE complainId = '"
				+ complainVo.getComplainId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> getAdminId() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LoginVo WHERE role = 'ROLE_ADMIN'");
		List<?> adminId = query.list();
		return adminId;
	}

	@Override
	public void replyComplain(ComplainVo complainVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("UPDATE ComplainVo SET replyDesc = '" + complainVo.getReplyDesc()
				+ "', replyDate = '" + complainVo.getReplyDate() + "', complainStatus = '"
				+ complainVo.getComplainStatus() + "' WHERE complainId = '" + complainVo.getComplainId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> viewComplainHistory(ComplainVo complainVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM ComplainVo WHERE deleteStatus = 'deactive' AND complainFrom_loginId = '"
				+ complainVo.getComplainFrom().getLoginId() + "' ORDER BY complainStatus DESC");
		List<?> complainHistoryData = query.list();

		return complainHistoryData;
	}

	@Override
	public List<?> getDepartmentId(LoginVo from_loginVo) {
		System.out.println("log: " + from_loginVo.getLoginId());
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM RegistrationVo WHERE deleteStatus = 'deactive' AND loginVo.loginId = '"
				+ from_loginVo.getLoginId() + "'");
		List<?> departmentId = query.list();
		return departmentId;
	}

	@Override
	public List<?> getToId(RegistrationVo departmentVo) {
		System.out.println(departmentVo.getDepartmentVo().getDepartmentId());
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("FROM RegistrationVo WHERE deleteStatus = 'deactive' AND departmentVo.departmentId = '"
						+ departmentVo.getDepartmentVo().getDepartmentId() + "' AND loginVo.role = 'ROLE_HR'");
		List<?> toId = query.list();
		return toId;
	}

	@Override
	public List<?> searchComplain(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM ComplainVo where deleteStatus = 'deactive' AND complainFrom.loginId = '"
				+ loginVo.getLoginId() + "'");

		List<?> searchData = query.list();
		return searchData;
	}

}
