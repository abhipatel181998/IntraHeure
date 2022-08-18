package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "salary")
public class SalaryVo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private int salaryId;

	@Column
	private double netSalary;
	
	@Column
	private double basicSalary;
	
	@Column
	private double hra;
	
	@Column
	private double conveyance;
	
	@Column
	private double medical;
	
	@Column
	private double tds;
	
	@Column
	private double esi;
	
	@Column
	private double pf;
	
	@Column
	private double profTax;
	
	@Column
	private String deletestatus;
	
	@Column
	private int freeLeavePerYear;
	
	@ManyToOne
	private LoginVo loginVo;

	public int getSalaryId() {
		return salaryId;
	}

	public void setSalaryId(int salaryId) {
		this.salaryId = salaryId;
	}

	public double getNetSalary() {
		return netSalary;
	}

	public void setNetSalary(double netSalary) {
		this.netSalary = netSalary;
	}

	public double getBasicSalary() {
		return basicSalary;
	}

	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}

	public double getHra() {
		return hra;
	}

	public void setHra(double hra) {
		this.hra = hra;
	}

	public double getConveyance() {
		return conveyance;
	}

	public void setConveyance(double conveyance) {
		this.conveyance = conveyance;
	}

	public double getMedical() {
		return medical;
	}

	public void setMedical(double medical) {
		this.medical = medical;
	}

	public double getTds() {
		return tds;
	}

	public void setTds(double tds) {
		this.tds = tds;
	}

	public double getEsi() {
		return esi;
	}

	public void setEsi(double esi) {
		this.esi = esi;
	}

	public double getPf() {
		return pf;
	}

	public void setPf(double pf) {
		this.pf = pf;
	}

	public double getProfTax() {
		return profTax;
	}

	public void setProfTax(double profTax) {
		this.profTax = profTax;
	}
	
	public String getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(String deletestatus) {
		this.deletestatus = deletestatus;
	}
	
	public int getFreeLeavePerYear() {
		return freeLeavePerYear;
	}

	public void setFreeLeavePerYear(int freeLeavePerYear) {
		this.freeLeavePerYear = freeLeavePerYear;
	}

	public LoginVo getLoginVo() {
		return loginVo;
	}

	public void setLoginVo(LoginVo loginVo) {
		this.loginVo = loginVo;
	}
	
}
