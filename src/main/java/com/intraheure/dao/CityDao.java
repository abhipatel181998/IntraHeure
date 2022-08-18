package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.CityVo;

public interface CityDao {

	List<?> viewCity();

	void addCity(CityVo cityVo);

	void deleteCity(CityVo cityVo);

	List<?> searchCity(CityVo cityVo);

	List<?> searchCityByState(CityVo cityVo);

}
