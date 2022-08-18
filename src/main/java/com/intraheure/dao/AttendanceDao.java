package com.intraheure.dao;

import java.util.List;

import com.intraheure.model.AttendanceFileVo;

public interface AttendanceDao {

	void itemFile(AttendanceFileVo attendanceFileVo);

	List<?> getFilePath(AttendanceFileVo attendanceFileVo);

}
