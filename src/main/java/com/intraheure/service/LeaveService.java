package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.LeaveDao;
import com.intraheure.model.LeaveRequestVo;
import com.intraheure.model.LeaveTypeVo;
import com.intraheure.model.LoginVo;

@Service
public class LeaveService {
	@Autowired
	LeaveDao leaveDao;

	public List<?> viewLeave() {
		List<?> leaveData = leaveDao.viewLeave();
		return leaveData;
	}

	@Transactional
	public void addLeaveType(LeaveTypeVo leaveVo) {
		leaveDao.addLeaveType(leaveVo);
	}

	@Transactional
	public void deleteLeaveType(LeaveTypeVo leaveVo) {
		leaveDao.deleteLeaveType(leaveVo);
	}

	public List<?> searchLeaveType(LeaveTypeVo leaveVo) {
		List<?> searchLeaveData = leaveDao.searchLeaveType(leaveVo);
		return searchLeaveData;
	}
	
	public List<?> viewLeaveRequestData() {
		List<?> leaveRequests = leaveDao.viewLeaveRequestData();
		return leaveRequests;
	}

	public List<?> viewLeaveRequest() {
		List<?> leaveRequests = leaveDao.viewLeaveRequest();
		return leaveRequests;
	}

	public List<?> searchLeaveTypeId(LeaveTypeVo leaveTypeVo) {
		List<?> searchLeaveData = leaveDao.searchLeaveTypeId(leaveTypeVo);
		return searchLeaveData;
	}

	@Transactional
	public void addLeaveRequest(LeaveRequestVo leaveRequestVo) {
		leaveDao.addLeaveRequest(leaveRequestVo);

	}

	@Transactional
	public void approveLeaveStatus(LeaveRequestVo leaveRequestVo) {
		leaveDao.approveLeaveStatus(leaveRequestVo);

	}

	public void rejectLeaveStatus(LeaveRequestVo leaveRequestVo) {
		leaveDao.rejectLeaveSatatus(leaveRequestVo);
		
	}

	public List<?> searchLeaveRequest(LoginVo loginVo) {
		List<?> leaveRequestData = leaveDao.searchLeaveRequest(loginVo);
		return leaveRequestData;
	}

	public List<?> searchLeaveRequest(LeaveRequestVo leaveRequestVo) {
		List<?> leaveRequestData = leaveDao.searchLeaveRequest(leaveRequestVo);
		return leaveRequestData;
	}

}
