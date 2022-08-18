package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "city")
public class CityVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cityId")
	private int cityId;

	@Column(name = "cityName")
	private String cityName;

	@Column(name = "cityDesc")
	private String cityDesc;

	@Column(name = "deleteStatus")
	private String deleteStatus;

	@ManyToOne
	private StateVo stateVo;

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityDesc() {
		return cityDesc;
	}

	public void setCityDesc(String cityDesc) {
		this.cityDesc = cityDesc;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public StateVo getStateVo() {
		return stateVo;
	}

	public void setStateVo(StateVo stateVo) {
		this.stateVo = stateVo;
	}

}