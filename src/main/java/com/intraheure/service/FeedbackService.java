package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.FeedbackDao;
import com.intraheure.model.FeedbackVo;

@Service
public class FeedbackService {
	@Autowired
	FeedbackDao feedbackDao;

	public List<?> viewFeedback() {
		List<?> feedbacks = feedbackDao.viewFeedback();
		return feedbacks;
	}

	@Transactional
	public void deleteFeedback(FeedbackVo feedbackVo) {
		feedbackDao.deleteFeedback(feedbackVo);
	}

	@Transactional
	public void addFeedback(FeedbackVo feedbackVo) {
		feedbackDao.addFeedback(feedbackVo);
		
	}

}
