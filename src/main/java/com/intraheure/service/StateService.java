package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.StateDao;
import com.intraheure.model.StateVo;

@Service
public class StateService {
	@Autowired
	StateDao stateDao;

	public List<?> viewState() {
		List<?> viewStateData = stateDao.viewState();
		return viewStateData;
	}

	public List<?> searchState(StateVo stateVo) {
		List<?> searchStateData = stateDao.searchSate(stateVo);
		return searchStateData;
	}

	@Transactional
	public void addState(StateVo stateVo) {
		stateDao.addState(stateVo);
	}

	@Transactional
	public void deleteState(StateVo stateVo) {
		stateDao.deleteState(stateVo);
	}

}
