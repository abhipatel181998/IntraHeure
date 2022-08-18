package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.ComplainDao;
import com.intraheure.model.ComplainVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

@Service
public class ComplainService {
	@Autowired
	ComplainDao complaindao;

	@Transactional
	public void sendComplain(ComplainVo complainVo) {
		this.complaindao.sendComplain(complainVo);
	}

	public List<?> viewComplainData() {
		List<?> complainData = complaindao.viewComplainData();
		return complainData;
	}

	public List<?> searchComplain(ComplainVo complainVo) {
		List<?> searchData = complaindao.searchComplain(complainVo);
		return searchData;
	}

	public List<?> viewPendingComplain() {
		List<?> complainData = complaindao.viewPendingComplain();
		return complainData;
	}

	@Transactional
	public void deleteComplain(ComplainVo complainVo) {
		complaindao.deleteComplain(complainVo);
	}

	public List<?> getAdminId() {
		List<?> adminId = complaindao.getAdminId();
		return adminId;
	}

	@Transactional
	public void replyComplain(ComplainVo complainVo) {
		complaindao.replyComplain(complainVo);

	}

	public List<?> viewComplainHistory(ComplainVo complainVo) {
		List<?> complainHistoryData = complaindao.viewComplainHistory(complainVo);
		return complainHistoryData;
	}

	@Transactional
	public List<?> getDepartmentId(LoginVo from_loginVo) {
		System.out.println("ser"+from_loginVo.getLoginId());
		List<?> departmentId = complaindao.getDepartmentId(from_loginVo);
		return departmentId;
	}

	public List<?> getToId(RegistrationVo departmentVo) {
		List<?> getToId = complaindao.getToId(departmentVo);
		return getToId;
	}

	public List<?> searchComplain(LoginVo loginVo) {
		List<?> searchData = complaindao.searchComplain(loginVo);
		return searchData;
	}

}
