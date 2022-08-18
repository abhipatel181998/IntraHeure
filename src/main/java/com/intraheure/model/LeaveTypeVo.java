package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "leaveType")
public class LeaveTypeVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int leaveId;

	@Column
	private String leaveName;

	@Column
	private String leaveDesc;

	@Column
	private String deleteStatus;

	public int getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}

	public String getLeaveName() {
		return leaveName;
	}

	public void setLeaveName(String leaveName) {
		this.leaveName = leaveName;
	}

	public String getLeaveDesc() {
		return leaveDesc;
	}

	public void setLeaveDesc(String leaveDesc) {
		this.leaveDesc = leaveDesc;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

}
