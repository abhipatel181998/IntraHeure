package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.RegistrationVo;

public interface HrDao {

	List<?> viewHr();

	void deleteHr(RegistrationVo registerationVo);

	List<?> searchHr(RegistrationVo registerationVo);

	List<?> getHrRegRequests();

}
