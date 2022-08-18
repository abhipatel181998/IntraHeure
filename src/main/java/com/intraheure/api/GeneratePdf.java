package com.intraheure.api;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;

import org.apache.commons.math3.util.Precision;
import org.apache.commons.text.WordUtils;
import org.springframework.stereotype.Service;

import com.intraheure.model.RegistrationVo;
import com.intraheure.model.SalaryVo;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.Style;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;

@Service
public class GeneratePdf {

	URL resource = getClass().getResource("/");
	String path = resource.getPath();

	public final String LOGO = path.replace("target/classes", "")
			+ "/src/main/resources/static/adminResources/images/logo.png";

	public void makeSalarySlip(SalaryVo salaryVo, RegistrationVo registrationVo, String month, int year)
			throws IOException {
		final String DEST = path.replace("/target/classes/", "") + "/src/main/resources/salarySlip/EID"
				+ registrationVo.getUserId() + month + year + ".pdf";
		File file = new File(DEST);
		file.getParentFile().mkdir();
		new GeneratePdf().pdf(DEST, salaryVo, registrationVo, month, year);
	}

	public void pdf(String dest, SalaryVo salaryVo, RegistrationVo registrationVo, String month, int year)
			throws IOException {
		try {
			System.out.println("salary slip is generated.........................");
			
			String name = WordUtils.capitalizeFully(registrationVo.getFirstName() + " " + registrationVo.getLastName());
			String designation = WordUtils.capitalizeFully(registrationVo.getDesignationVo().getDesignationName());
			int employeeId = registrationVo.getUserId();
			String JoiningDate = registrationVo.getJoiningDate();

			double basic = Precision.round(salaryVo.getBasicSalary() / 12, 2);
			double hra = Precision.round(salaryVo.getHra() / 12, 2);
			double conveyance = Precision.round(salaryVo.getConveyance() / 12, 2);
			double medical = Precision.round(salaryVo.getMedical() / 12, 2);
			double totalEarnings = Precision.round(basic + hra + conveyance + medical, 2);

			double tds = Precision.round(salaryVo.getTds() / 12, 2);
			double esi = Precision.round(salaryVo.getEsi() / 12, 2);
			double pf = Precision.round(salaryVo.getPf() / 12, 2);
			double profTax = Precision.round(salaryVo.getProfTax() / 12, 2);
			double totalDeduction = Precision.round(tds + esi + pf + profTax, 2);

			double netSalary = Precision.round(salaryVo.getNetSalary() / 12, 2);

			PdfWriter pdfWriter = new PdfWriter(dest);

			PdfDocument pdf = new PdfDocument(pdfWriter);

			Document document = new Document(pdf, PageSize.A4);
			document.setMargins(30, 30, 30, 30);

			PdfFont font = PdfFontFactory.createFont(StandardFonts.COURIER);
			PdfFont bold = PdfFontFactory.createFont(StandardFonts.COURIER_BOLD);

			Style normal = new Style().setFont(font);
			Style title = new Style().setFont(bold);
			Style noBorder = new Style().setBorder(Border.NO_BORDER);
			Style centertitle = new Style().setFont(font).setFontSize(20).setTextAlignment(TextAlignment.CENTER)
					.setUnderline();
			Style noLeftBorder = new Style().setBorderLeft(Border.NO_BORDER);
			Style noRightBorder = new Style().setBorderRight(Border.NO_BORDER);
			Style alignRight = new Style().setTextAlignment(TextAlignment.RIGHT);

			document.add(new Paragraph("Payslip for the month of " + month + " " + year).addStyle(centertitle));

			Table table = new Table(2).useAllAvailableWidth();

			table.addCell(new Cell().add(new Image(ImageDataFactory.create(LOGO)).scaleToFit(100, 100))
					.add(new Paragraph(name).setPaddingTop(10)).addStyle(title)
					.add(new Paragraph(designation).addStyle(normal))
					.add(new Paragraph("Employee ID: " + employeeId).addStyle(normal))
					.add(new Paragraph("Joining Date: " + JoiningDate).addStyle(normal)).addStyle(noBorder))
					.setMarginTop(20);
			table.addCell(new Cell()
					.add(new Paragraph("Payslip #EID" + registrationVo.getUserId() + month + year).addStyle(title)
							.setFontSize(16))
					.add(new Paragraph("Salary Month: " + month + ", " + year).addStyle(normal))
					.setTextAlignment(TextAlignment.RIGHT).addStyle(noBorder).setFontSize(16));
			document.add(table);

			document.add(new Paragraph("Earnings").addStyle(title).setFontSize(18).setMarginTop(20));

			Table table1 = new Table(2).useAllAvailableWidth();

			table1.addCell(new Cell().add(new Paragraph("Basic Salary").addStyle(title)).addStyle(noRightBorder));
			table1.addCell(new Cell().add(new Paragraph("Rs. " + basic).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table1.addCell(new Cell().add(new Paragraph("House Rent Allowance (H.R.A.)").addStyle(title))
					.addStyle(noRightBorder));
			table1.addCell(new Cell().add(new Paragraph("Rs. " + hra).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table1.addCell(
					new Cell().add(new Paragraph("Conveyance Allowance").addStyle(title)).addStyle(noRightBorder));
			table1.addCell(new Cell().add(new Paragraph("Rs. " + conveyance).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table1.addCell(new Cell().add(new Paragraph("Medical Allowance").addStyle(title)).addStyle(noRightBorder));
			table1.addCell(new Cell().add(new Paragraph("Rs. " + medical).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table1.addCell(new Cell().add(new Paragraph("Total Earnings").addStyle(title)).addStyle(noRightBorder));
			table1.addCell(new Cell().add(new Paragraph("Rs. " + totalEarnings).addStyle(title).addStyle(alignRight))
					.addStyle(noLeftBorder));

			document.add(table1);

			document.add(new Paragraph("Deductions").addStyle(title).setFontSize(18).setMarginTop(20));

			Table table2 = new Table(2).useAllAvailableWidth();

			table2.addCell(new Cell().add(new Paragraph("Tax Deducted at Source (T.D.S.)").addStyle(title))
					.addStyle(noRightBorder));
			table2.addCell(new Cell().add(new Paragraph("Rs. " + tds).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table2.addCell(new Cell().add(new Paragraph("Employee's State Insurance").addStyle(title))
					.addStyle(noRightBorder));
			table2.addCell(new Cell().add(new Paragraph("Rs. " + esi).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table2.addCell(new Cell().add(new Paragraph("Provident fund").addStyle(title)).addStyle(noRightBorder));
			table2.addCell(new Cell().add(new Paragraph("Rs. " + pf).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table2.addCell(new Cell().add(new Paragraph("professional Tax").addStyle(title)).addStyle(noRightBorder));
			table2.addCell(new Cell().add(new Paragraph("Rs. " + profTax).addStyle(normal).addStyle(alignRight))
					.addStyle(noLeftBorder));
			table2.addCell(new Cell().add(new Paragraph("Total Deductions").addStyle(title)).addStyle(noRightBorder));
			table2.addCell(new Cell().add(new Paragraph("Rs. " + totalDeduction).addStyle(title).addStyle(alignRight))
					.addStyle(noLeftBorder));

			document.add(table2);

			document.add(new Paragraph("Net Salary: Rs. " + netSalary).addStyle(title).setMarginTop(20));

			document.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

}
