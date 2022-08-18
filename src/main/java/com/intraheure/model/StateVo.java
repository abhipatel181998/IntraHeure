package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Table(name="state")
public class StateVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="stateId")
	private int stateId;
	
	@Column(name="stateName")
	private String stateName;
	
	@Column(name="stateDesc")
	private String stateDesc;
	
	@Column(name="deleteStatus")
	private String deleteStatus;

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public int getstateId() {
		return stateId;
	}

	public void setstateId(int stateId) {
		this.stateId = stateId;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getStateDesc() {
		return stateDesc;
	}

	public void setStateDesc(String stateDesc) {
		this.stateDesc = stateDesc;
	}
	
	
}
