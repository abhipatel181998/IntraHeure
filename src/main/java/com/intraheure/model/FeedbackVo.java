package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "feedback")
public class FeedbackVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int feedbackId;

	@Column
	private String feedbackDesc;

	@Column
	private String feedbackDate;

	@Column
	private int ratings;

	@Column
	private String deleteStatus;

	@ManyToOne
	private LoginVo feedbackFrom;

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getFeedbackDesc() {
		return feedbackDesc;
	}

	public void setFeedbackDesc(String feedbackDesc) {
		this.feedbackDesc = feedbackDesc;
	}

	public String getFeedbackDate() {
		return feedbackDate;
	}

	public void setFeedbackDate(String feedbackDate) {
		this.feedbackDate = feedbackDate;
	}

	public int getRatings() {
		return ratings;
	}

	public void setRatings(int ratings) {
		this.ratings = ratings;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public LoginVo getFeedbackFrom() {
		return feedbackFrom;
	}

	public void setFeedbackFrom(LoginVo feedbackFrom) {
		this.feedbackFrom = feedbackFrom;
	}
}