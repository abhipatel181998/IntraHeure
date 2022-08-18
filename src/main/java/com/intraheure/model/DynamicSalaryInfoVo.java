package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="DynamicSalaryInfo")
public class DynamicSalaryInfoVo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private  int id;
	
	@OneToOne
	private SalaryVo salaryVo;
	
	@ManyToOne
	private LoginVo loginVo;
	
	@Column
	private double salaryPerMonth;
	
	@Column
	private double salaryToGet;
	
	@Column
	private int freeLeave;
	
	@Column
	private int paidLeave;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SalaryVo getSalaryVo() {
		return salaryVo;
	}

	public void setSalaryVo(SalaryVo salaryVo) {
		this.salaryVo = salaryVo;
	}

	public LoginVo getLoginVo() {
		return loginVo;
	}

	public void setLoginVo(LoginVo loginVo) {
		this.loginVo = loginVo;
	}

	public double getSalaryPerMonth() {
		return salaryPerMonth;
	}

	public void setSalaryPerMonth(double salaryPerMonth) {
		this.salaryPerMonth = salaryPerMonth;
	}

	public double getSalaryToGet() {
		return salaryToGet;
	}

	public void setSalaryToGet(double salaryToGet) {
		this.salaryToGet = salaryToGet;
	}

	public int getFreeLeave() {
		return freeLeave;
	}

	public void setFreeLeave(int freeLeave) {
		this.freeLeave = freeLeave;
	}

	public int getPaidLeave() {
		return paidLeave;
	}

	public void setPaidLeave(int paidLeave) {
		this.paidLeave = paidLeave;
	}
	
}
