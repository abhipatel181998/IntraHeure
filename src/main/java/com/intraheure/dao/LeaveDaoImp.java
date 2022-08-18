package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.LeaveRequestVo;
import com.intraheure.model.LeaveTypeVo;
import com.intraheure.model.LoginVo;

@Repository
public class LeaveDaoImp implements LeaveDao {
	@Autowired
	SessionFactory sessionFactory;

	public List<?> viewLeave() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LeaveTypeVo WHERE deleteStatus = 'deactive'");

		List<?> leaveData = query.list();

		session.close();
		return leaveData;
	}

	public void addLeaveType(LeaveTypeVo LeaveTypeVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(LeaveTypeVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchLeaveType(LeaveTypeVo LeaveTypeVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"FROM LeaveTypeVo WHERE leaveId = '" + LeaveTypeVo.getLeaveId() + "' AND deleteStatus = 'deactive'");

		List<?> searchLeaveData = query.list();

		session.close();
		return searchLeaveData;
	}

	public void deleteLeaveType(LeaveTypeVo LeaveTypeVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("UPDATE FROM LeaveTypeVo SET deleteStatus = 'active' WHERE leaveId = '"
				+ LeaveTypeVo.getLeaveId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> viewLeaveRequestData() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LeaveRequestVo");

		List<?> leaveRequestData = query.list();

		session.close();
		return leaveRequestData;
	}

	@Override
	public List<?> viewLeaveRequest() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LeaveRequestVo WHERE requestStatus = 2");

		List<?> leaveRequestData = query.list();

		session.close();
		return leaveRequestData;
	}

	@Override
	public List<?> searchLeaveTypeId(LeaveTypeVo leaveTypeVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("From LeaveTypeVo Where leaveName = '" + leaveTypeVo.getLeaveName()
				+ "' AND deleteStatus = 'deactive'");
		List<?> leaveType = query.list();
		return leaveType;
	}

	@Override
	public void addLeaveRequest(LeaveRequestVo leaveRequestVo) {
		Session session = sessionFactory.openSession();
		session.save(leaveRequestVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public void approveLeaveStatus(LeaveRequestVo leaveRequestVo) {
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("UPDATE LeaveRequestVo SET requestStatus = '" + leaveRequestVo.getRequestStatus()
						+ "' WHERE leaveRequestId = '" + leaveRequestVo.getLeaveRequestId() + "'");

		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public void rejectLeaveSatatus(LeaveRequestVo leaveRequestVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("UPDATE LeaveRequestVo SET requestStatus = '"
				+ leaveRequestVo.getRequestStatus() + "', rejectReason = '" + leaveRequestVo.getRejectReason()
				+ "' WHERE leaveRequestId = '" + leaveRequestVo.getLeaveRequestId() + "'");

		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> searchLeaveRequest(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM LeaveRequestVo WHERE loginVo.loginId = '" + loginVo.getLoginId() + "'");
		List<?> data = query.list();

		session.close();
		return data;
	}

	@Override
	public List<?> searchLeaveRequest(LeaveRequestVo leaveRequestVo) {
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("FROM LeaveRequestVo WHERE leaveRequestId = '" + leaveRequestVo.getLeaveRequestId() + "'");
		List<?> data = query.list();

		session.close();
		return data;
	}
}
