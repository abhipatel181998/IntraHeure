package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "leaveRequest")
public class LeaveRequestVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int leaveRequestId;

	@ManyToOne
	private LeaveTypeVo leaveTypeVo;

	@Column
	private String leaveReason;

	@Column
	private String fromDate;

	@Column
	private String toDate;

	@Column
	private int requestStatus;
	
	@Column
	private String rejectReason;
	
	@ManyToOne
	private LoginVo loginVo;

	public int getLeaveRequestId() {
		return leaveRequestId;
	}

	public void setLeaveRequestId(int leaveRequestId) {
		this.leaveRequestId = leaveRequestId;
	}

	public LeaveTypeVo getLeaveTypeVo() {
		return leaveTypeVo;
	}

	public void setLeaveTypeVo(LeaveTypeVo leaveTypeVo) {
		this.leaveTypeVo = leaveTypeVo;
	}

	public int getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(int requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public LoginVo getLoginVo() {
		return loginVo;
	}

	public void setLoginVo(LoginVo loginVo) {
		this.loginVo = loginVo;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	
}
