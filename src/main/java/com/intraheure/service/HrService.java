package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.HrDao;
import com.intraheure.model.RegistrationVo;

@Service
public class HrService {
	@Autowired
	HrDao hrDao;

	public List<?> viewHr() {
		List<?> hrData = hrDao.viewHr();
		return hrData;
	}

	@Transactional
	public void deleteHr(RegistrationVo registerationVo) {
		hrDao.deleteHr(registerationVo);
	}

	public List<?> searchHr(RegistrationVo registerationVo) {
		List<?> hrData = hrDao.searchHr(registerationVo);
		return hrData;
	}

	public List<?> getHrRegRequests() {
		List<?> regRequests = hrDao.getHrRegRequests();
		return regRequests;
	}
}
