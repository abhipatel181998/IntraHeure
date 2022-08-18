package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.AttendanceFileVo;

@Repository
public class AttendanceDaoImp implements AttendanceDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void itemFile(AttendanceFileVo attendanceFileVo) {
		Session session = sessionFactory.openSession();
		session.save(attendanceFileVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> getFilePath(AttendanceFileVo attendanceFileVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM AttendanceFileVo WHERE month = '" + attendanceFileVo.getMonth()
				+ "' AND year = '" + attendanceFileVo.getYear() + "'");
		List<?> fileData = query.list();
		return fileData;
	}

}
