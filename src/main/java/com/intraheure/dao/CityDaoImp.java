package com.intraheure.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.CityVo;

@Repository
public class CityDaoImp implements CityDao {
	@Autowired
	SessionFactory sessionFactory;

	public List<?> viewCity() {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM CityVo WHERE deleteStatus = 'deactive'");

		List<?> viewCityData = query.list();

		session.close();

		return viewCityData;

	}

	public void addCity(CityVo cityVo) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(cityVo);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchCity(CityVo cityVo) {
		Session session = sessionFactory.openSession();

		Query query = session
				.createQuery("FROM CityVo WHERE cityId = '" + cityVo.getCityId() + "' AND deleteStatus = 'deactive'");

		List<?> viewCityData = query.list();

		session.close();
		return viewCityData;
	}

	public void deleteCity(CityVo cityVo) {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery(
				"UPDATE FROM CityVo SET deleteStatus = 'active' WHERE cityId = '" + cityVo.getCityId() + "'");
		query.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

	public List<?> searchCityByState(CityVo cityVo) {
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM CityVo WHERE stateVo_StateId = '" + cityVo.getStateVo().getstateId()
				+ "' AND deleteStatus = 'deactive'");

		List<?> cityDataByState = query.list();

		session.close();
		return cityDataByState;
	}

}
