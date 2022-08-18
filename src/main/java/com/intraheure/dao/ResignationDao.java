package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.ResignationVo;

public interface ResignationDao {

	void addResignationRequest(ResignationVo resignationVo);

	List<?> viewResignationRequests();

	List<?> searchResignRequest(ResignationVo resignationVo);

	void approveResignRequest(ResignationVo resignationVo2);

	void rejectResignRequest(ResignationVo resignationVo);

}
