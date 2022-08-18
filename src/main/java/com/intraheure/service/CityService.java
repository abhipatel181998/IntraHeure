package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.CityDao;
import com.intraheure.model.CityVo;

@Service
public class CityService {
	@Autowired
	CityDao cityDao;

	@SuppressWarnings("rawtypes")
	public List viewCity() {
		List viewCityData = cityDao.viewCity();
		return viewCityData;
	}
	
	@Transactional
	public void addCity(CityVo cityVo) {
		cityDao.addCity(cityVo);
	}
	
	@Transactional
	public void deleteCity(CityVo cityVo) {
		cityDao.deleteCity(cityVo);
	}

	public List<?> searchCity(CityVo cityVo) {
		List<?> searchCityData = cityDao.searchCity(cityVo);
		return searchCityData;
	}

	public List<?> searchCityByState(CityVo cityVo) {
		List<?> cityDataByState = cityDao.searchCityByState(cityVo);
		return cityDataByState;
	}
	
	
}
