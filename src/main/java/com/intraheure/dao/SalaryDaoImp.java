package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.DynamicSalaryInfoVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.SalaryVo;

@Repository
public class SalaryDaoImp implements SalaryDao {
	@Autowired
	SessionFactory sessionFactory;

	public List<?> viewSalary() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM SalaryVo WHERE deleteStatus='deactive'");

		List<?> salaryData = query.list();

		session.close();
		return salaryData;
	}

	public void addSalary(SalaryVo salaryVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(salaryVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchSalary(SalaryVo salaryVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"FROM SalaryVo WHERE salaryId = '" + salaryVo.getSalaryId() + "' AND deleteStatus = 'deactive'");

		List<?> salaryData = query.list();

		session.close();
		return salaryData;
	}

	@Override
	public void deleteSalar(SalaryVo salaryVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"UPDATE SalaryVo SET deleteStatus = 'active' WHERE  salaryId = '" + salaryVo.getSalaryId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	@Override
	public List<?> searchUserSalary(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(
				"FROM SalaryVo WHERE deleteStatus = 'deactive' AND loginVo.loginId = '" + loginVo.getLoginId() + "'");
		List<?> salaryData = query.list();
		
		session.close();
		return salaryData;
	}

	@Override
	public void addDynamicSalary(DynamicSalaryInfoVo dynamicSalaryInfoVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(dynamicSalaryInfoVo);
		
		Transaction transaction = session.beginTransaction();
		transaction.commit();
		
		session.close();
	}

	@Override
	public List<?> searchDynamicSalaryEmp(LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM DynamicSalaryInfoVo WHERE loginVo.loginId = '"+loginVo.getLoginId()+"'");
		List<?> data = query.list();
		
		session.close();
		return data;
	}
}
