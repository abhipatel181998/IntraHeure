package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "registeration")
public class RegistrationVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int userId;

	@Column
	private String firstName;

	@Column
	private String lastName;

	@Column
	private String gender;

	@Column
	private String email;

	@Column
	private String mobileNumber;

	@ManyToOne
	private DepartmentVo departmentVo;

	@ManyToOne
	private DesignationVo designationVo;

	@Column
	private String residentialAddress;

	@ManyToOne
	private StateVo stateVo;

	@ManyToOne
	private CityVo cityVo;

	@Column
	private String pincode;

	@Column
	private String deleteStatus;

	@ManyToOne
	private LoginVo loginVo;

	@Column
	private String joiningDate;

	@Column
	private String birthDate;

	@Column
	private String profilePic;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public DepartmentVo getDepartmentVo() {
		return departmentVo;
	}

	public void setDepartmentVo(DepartmentVo departmentVo) {
		this.departmentVo = departmentVo;
	}

	public DesignationVo getDesignationVo() {
		return designationVo;
	}

	public void setDesignationVo(DesignationVo designationVo) {
		this.designationVo = designationVo;
	}

	public String getResidentialAddress() {
		return residentialAddress;
	}

	public void setResidentialAddress(String residentialAddress) {
		this.residentialAddress = residentialAddress;
	}

	public StateVo getStateVo() {
		return stateVo;
	}

	public void setStateVo(StateVo stateVo) {
		this.stateVo = stateVo;
	}

	public CityVo getCityVo() {
		return cityVo;
	}

	public void setCityVo(CityVo cityVo) {
		this.cityVo = cityVo;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public LoginVo getLoginVo() {
		return loginVo;
	}

	public void setLoginVo(LoginVo loginVo) {
		this.loginVo = loginVo;
	}

	public String getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

}
