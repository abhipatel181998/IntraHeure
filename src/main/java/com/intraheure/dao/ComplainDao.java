package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.ComplainVo;
import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

public interface ComplainDao {

	void sendComplain(ComplainVo complainVo);

	List<?> viewComplainData();

	List<?> searchComplain(ComplainVo complainVo);

	List<?> viewPendingComplain();

	void deleteComplain(ComplainVo complainVo);

	List<?> getAdminId();

	void replyComplain(ComplainVo complainVo);

	List<?> viewComplainHistory(ComplainVo complainVo);

	List<?> getDepartmentId(LoginVo from_loginVo);

	List<?> getToId(RegistrationVo departmentVo);

	List<?> searchComplain(LoginVo loginVo);

}
