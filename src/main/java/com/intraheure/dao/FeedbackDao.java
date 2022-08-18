package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.FeedbackVo;

public interface FeedbackDao {

	public List<?> viewFeedback();

	public void deleteFeedback(FeedbackVo feedbackVo);

	public void addFeedback(FeedbackVo feedbackVo);

}
