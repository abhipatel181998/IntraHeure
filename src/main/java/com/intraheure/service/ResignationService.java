package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.ResignationDao;
import com.intraheure.model.ResignationVo;

@Service
public class ResignationService {
	@Autowired
	ResignationDao resignationDao;

	@Transactional
	public void addResignationRequest(ResignationVo resignationVo) {
		resignationDao.addResignationRequest(resignationVo);
		
	}

	public List<?> viewResignationRequests() {
		List<?> resignationRequests = resignationDao.viewResignationRequests();
		return resignationRequests;
	}

	public List<?> searchResignRequest(ResignationVo resignationVo) {
		List<?> resignationData = resignationDao.searchResignRequest(resignationVo);
		return resignationData;
	}

	@Transactional
	public void approveResignRequest(ResignationVo resignationVo2) {
		resignationDao.approveResignRequest(resignationVo2);
		
	}

	public void rejectResignRequest(ResignationVo resignationVo) {
		resignationDao.rejectResignRequest(resignationVo);
		
	}

}
