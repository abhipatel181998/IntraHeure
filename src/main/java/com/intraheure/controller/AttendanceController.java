package com.intraheure.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.intraheure.model.AttendanceFileVo;
import com.intraheure.service.AttendanceService;

@Controller
public class AttendanceController {
	@Autowired
	AttendanceService attendanceService;

//---------------------------------------Method for Admin--------------------------------------------
	@RequestMapping(value = "admin/attendance", method = RequestMethod.GET)
	public ModelAndView loadAttendancePage_ADMIN() {
		return new ModelAndView("admin/attendance", "uploadFile", new AttendanceFileVo()).addObject("attendanceData",
				null);
	}

	@RequestMapping(value = "admin/uploadAttendance", method = RequestMethod.POST)
	public ModelAndView loadfileup(HttpServletRequest request, @RequestParam("file") MultipartFile file,
			@ModelAttribute AttendanceFileVo attendanceFileVo) {
		String path = request.getSession().getServletContext().getRealPath("/");
		String filePath = path + "documents/file/attendance/";
		String fileName = file.getOriginalFilename();

		try {
			byte barr[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));

			bout.write(barr);
			bout.flush();
			bout.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		attendanceFileVo.setFileName(fileName);
		attendanceFileVo.setFilePath(filePath);

		this.attendanceService.itemFile(attendanceFileVo);
		return new ModelAndView("redirect:/admin/attendance");
	}

	@RequestMapping(value = "admin/viewAttendance", method = RequestMethod.POST)
	public ModelAndView viewAttendance_ADMIN(@ModelAttribute AttendanceFileVo attendanceFileVo) {
		List<?> fileData = attendanceService.getFilePath(attendanceFileVo);
		AttendanceFileVo fileVo = (AttendanceFileVo) fileData.get(0);
		final String FILE_NAME = fileVo.getFilePath() + fileVo.getFileName();
		ArrayList<Object> attendanceData = new ArrayList<Object>();
		try {
			FileInputStream excelFile = new FileInputStream(new File(FILE_NAME));
			Workbook workbook = new XSSFWorkbook(excelFile);
			Sheet datatypeSheet = workbook.getSheetAt(0);
			Iterator<Row> iterator = datatypeSheet.iterator();

			while (iterator.hasNext()) {
				List<String> list = new ArrayList<String>();
				Row currentRow = iterator.next();
				Iterator<Cell> cellIterator = currentRow.iterator();

				while (cellIterator.hasNext()) {
					Cell currentCell = cellIterator.next();
					if (currentCell.getCellType() == CellType.STRING) {
						// System.out.print(currentCell.getStringCellValue() + "--");
						list.add(String.valueOf(currentCell.getStringCellValue()));
					} else if (currentCell.getCellType() == CellType.NUMERIC) {
						// System.out.print(currentCell.getNumericCellValue() + "--");
						Double number = currentCell.getNumericCellValue();
						list.add(String.valueOf(number.intValue()));
					}
				}

				// System.out.println();
				attendanceData.add(list);
				workbook.close();
				excelFile.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ModelAndView("admin/attendance", "attendanceData", attendanceData);

	}

//------------------------------------------------HR Methods-------------------------------------------------
	@RequestMapping(value = "hr/attendance", method = RequestMethod.GET)
	public ModelAndView loadAttendancePage_HR() {
		return new ModelAndView("hr/attendance", "uploadFile", new AttendanceFileVo()).addObject("attendanceData",
				null);
	}

	@RequestMapping(value = "hr/uploadAttendance", method = RequestMethod.POST)
	public ModelAndView loadfileupl(HttpServletRequest request, @RequestParam("file") MultipartFile file,
			@ModelAttribute AttendanceFileVo attendanceFileVo) {
		String path = request.getSession().getServletContext().getRealPath("/");
		String filePath = path + "documents/file/attendance/";
		String fileName = file.getOriginalFilename();

		try {
			byte barr[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));

			bout.write(barr);
			bout.flush();
			bout.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		attendanceFileVo.setFileName(fileName);
		attendanceFileVo.setFilePath(filePath);

		this.attendanceService.itemFile(attendanceFileVo);
		return new ModelAndView("redirect:/hr/attendance");
	}

	@RequestMapping(value = "hr/viewAttendance", method = RequestMethod.POST)
	public ModelAndView viewAttendance_HR(@ModelAttribute AttendanceFileVo attendanceFileVo) {
		List<?> fileData = attendanceService.getFilePath(attendanceFileVo);
		AttendanceFileVo fileVo = (AttendanceFileVo) fileData.get(0);
		final String FILE_NAME = fileVo.getFilePath() + fileVo.getFileName();
		ArrayList<Object> attendanceData = new ArrayList<Object>();
		try {
			FileInputStream excelFile = new FileInputStream(new File(FILE_NAME));
			Workbook workbook = new XSSFWorkbook(excelFile);
			Sheet datatypeSheet = workbook.getSheetAt(0);
			Iterator<Row> iterator = datatypeSheet.iterator();

			while (iterator.hasNext()) {
				List<String> list = new ArrayList<String>();
				Row currentRow = iterator.next();
				Iterator<Cell> cellIterator = currentRow.iterator();

				while (cellIterator.hasNext()) {
					Cell currentCell = cellIterator.next();
					if (currentCell.getCellType() == CellType.STRING) {
						// System.out.print(currentCell.getStringCellValue() + "--");
						list.add(String.valueOf(currentCell.getStringCellValue()));
					} else if (currentCell.getCellType() == CellType.NUMERIC) {
						// System.out.print(currentCell.getNumericCellValue() + "--");
						Double number = currentCell.getNumericCellValue();
						list.add(String.valueOf(number.intValue()));
					}
				}

				// System.out.println();
				attendanceData.add(list);
				workbook.close();
				excelFile.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ModelAndView("hr/attendance", "attendanceData", attendanceData);

	}
}
