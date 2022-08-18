package com.intraheure.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.dao.AttendanceDao;
import com.intraheure.model.AttendanceFileVo;

@Service
public class AttendanceService {
	@Autowired
	AttendanceDao attendanceDao;

	@Transactional
	public void itemFile(AttendanceFileVo attendanceFileVo) {
		attendanceDao.itemFile(attendanceFileVo);
	}

	public List<?> getFilePath(AttendanceFileVo attendanceFileVo) {
		List<?> filePath = attendanceDao.getFilePath(attendanceFileVo);
		return filePath;
	}

}
