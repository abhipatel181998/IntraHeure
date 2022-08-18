package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "designation")
public class DesignationVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int designationId;

	@Column
	private String designationName;

	@Column
	private String designationDesc;

	@Column
	private String deleteStatus;

	@ManyToOne
	private DepartmentVo departmentVo;

	public int getDesignationId() {
		return designationId;
	}

	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}

	public String getDesignationName() {
		return designationName;
	}

	public void setDesignationName(String designationName) {
		this.designationName = designationName;
	}

	public String getDesignationDesc() {
		return designationDesc;
	}

	public void setDesignationDesc(String designationDesc) {
		this.designationDesc = designationDesc;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public DepartmentVo getDepartmentVo() {
		return departmentVo;
	}

	public void setDepartmentVo(DepartmentVo departmentVo) {
		this.departmentVo = departmentVo;
	}
	
	
}
