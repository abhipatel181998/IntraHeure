package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.StateVo;

public interface StateDao {

	void addState(StateVo stateVo);

	List<?> viewState();

	List<?> searchSate(StateVo stateVo);

	void deleteState(StateVo stateVo);

}
