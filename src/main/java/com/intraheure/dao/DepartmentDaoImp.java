package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.DepartmentVo;

@Repository
public class DepartmentDaoImp implements DepartmentDao {
	@Autowired
	SessionFactory sessionFactory;

	public List<?> viewDepartment() {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM DepartmentVo WHERE deleteStatus = 'deactive'");

		List<?> viewDepartmentData = query.list();

		session.close();
		return viewDepartmentData;
	}

	public void addDepartment(DepartmentVo departmentVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(departmentVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchDepartment(DepartmentVo departmentVo) {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM DepartmentVo WHERE departmentId = '" + departmentVo.getDepartmentId()
				+ "' AND deleteStatus = 'deactive'");

		List<?> viewDepartmentData = query.list();

		session.close();
		return viewDepartmentData;
	}

	public void deleteDepartment(DepartmentVo departmentVo) {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("UPDATE DepartmentVo SET deleteStatus='active' WHERE departmentId = '"
				+ departmentVo.getDepartmentId() + "'");
		query.executeUpdate();

		session.close();
	}

}
