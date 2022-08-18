package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "complain")
public class ComplainVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int complainId;

	@Column
	private String complainDate;

	@Column
	private String replyDate;

	@Column
	private String complainSub;

	@Column
	private String complainDesc;

	@Column
	private String replyDesc;

	@Column
	private int complainStatus;

	@ManyToOne
	private LoginVo complainFrom;

	@ManyToOne
	private LoginVo complainTo;

	@Column
	private String deleteStatus;

	public int getComplainId() {
		return complainId;
	}

	public void setComplainId(int complainId) {
		this.complainId = complainId;
	}

	public String getComplainDate() {
		return complainDate;
	}

	public void setComplainDate(String complainDate) {
		this.complainDate = complainDate;
	}

	public String getComplainSub() {
		return complainSub;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public void setComplainSub(String complainSub) {
		this.complainSub = complainSub;
	}

	public String getComplainDesc() {
		return complainDesc;
	}

	public void setComplainDesc(String complainDesc) {
		this.complainDesc = complainDesc;
	}

	public String getReplyDesc() {
		return replyDesc;
	}

	public void setReplyDesc(String replyDesc) {
		this.replyDesc = replyDesc;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public int getComplainStatus() {
		return complainStatus;
	}

	public void setComplainStatus(int complainStatus) {
		this.complainStatus = complainStatus;
	}

	public LoginVo getComplainFrom() {
		return complainFrom;
	}

	public void setComplainFrom(LoginVo complainFrom) {
		this.complainFrom = complainFrom;
	}

	public LoginVo getComplainTo() {
		return complainTo;
	}

	public void setComplainTo(LoginVo complainTo) {
		this.complainTo = complainTo;
	}

}
