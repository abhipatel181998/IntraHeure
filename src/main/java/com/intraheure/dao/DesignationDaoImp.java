package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.DesignationVo;

@Repository
public class DesignationDaoImp implements DesignationDao {
	@Autowired
	SessionFactory sessionFactory;

	public List<?> viewDesignation() {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM DesignationVo WHERE deleteStatus = 'deactive'");

		List<?> viewDesignationData = query.list();

		session.close();
		return viewDesignationData;
	}

	public void addDesignation(DesignationVo designationVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(designationVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchDesignation(DesignationVo designationVo) {
		Session session = sessionFactory.openSession();

		Query query = session
				.createQuery("from DesignationVo where designationId = '" + designationVo.getDesignationId() + "'");

		List<?> viewDesignationData = query.list();

		session.close();
		return viewDesignationData;
	}

	public void deleteDesignation(DesignationVo designationVo) {
		Session session = sessionFactory.openSession();

		Query query = session
				.createQuery("UPDATE FROM DesignationVo SET deleteStatus = 'active' WHERE designationId = '"
						+ designationVo.getDesignationId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchDesignationByDepartment(DesignationVo designationVo) {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM DesignationVo WHERE departmentVo_departmentId = '"
				+ designationVo.getDepartmentVo().getDepartmentId() + "' AND deleteStatus = 'deactive'");

		List<?> viewDesignationData = query.list();

		session.close();
		return viewDesignationData;
	}

}
