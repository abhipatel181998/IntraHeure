package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "resignation")
public class ResignationVo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int resignationId;

	@ManyToOne
	private LoginVo requestFrom;

	@Column
	private String requestDate;

	@Column
	private String reason;

	public int getResignationId() {
		return resignationId;
	}

	public void setResignationId(int resignationId) {
		this.resignationId = resignationId;
	}

	public LoginVo getRequestFrom() {
		return requestFrom;
	}

	public void setRequestFrom(LoginVo requestFrom) {
		this.requestFrom = requestFrom;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
