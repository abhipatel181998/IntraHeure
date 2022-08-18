package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.LeaveRequestVo;
import com.intraheure.model.LeaveTypeVo;
import com.intraheure.model.LoginVo;

public interface LeaveDao {

	List<?> viewLeave();

	void addLeaveType(LeaveTypeVo leaveVo);

	void deleteLeaveType(LeaveTypeVo leaveVo);

	List<?> searchLeaveType(LeaveTypeVo leaveVo);

	List<?> viewLeaveRequest();

	List<?> searchLeaveTypeId(LeaveTypeVo leaveTypeVo);

	void addLeaveRequest(LeaveRequestVo leaveRequestVo);

	void approveLeaveStatus(LeaveRequestVo leaveRequestVo);

	void rejectLeaveSatatus(LeaveRequestVo leaveRequestVo);

	List<?> searchLeaveRequest(LoginVo loginVo);

	List<?> viewLeaveRequestData();

	List<?> searchLeaveRequest(LeaveRequestVo leaveRequestVo);

}
