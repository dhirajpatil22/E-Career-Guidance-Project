package com.app.pojos;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Company {

	private Long companyId;
	private String companyName;
	private String address;
	private String pincode;
	private String city;
	private String state;
	private String country;
	private String recruiterType;  //radio button (company/consultancy)
	private String description;
	private Date regDate;
	private String companyRegistrationNumber;
	private boolean activeStatus;
	private boolean verificationStatus;
	private Date lastLogin;
	private String telephoneNo;
	private String mobNo;
	private String contactPersonName;
	private String contactPersonDesignation;
	private String email;
	private String alternateEmail;
	private String faxNo;
	private String password;
	private String website;
	private boolean gstStatus;
	private Date CompanyEstablishmentDate;
	private String imgPath;
	
	
	public Company()
	{
		
	}
	
	public Company(String companyName, String address, String pincode, String city, String state,
			String country, String recruiterType, String description,
			 String telephoneNo, String mobNo, String contactPersonName,
			String contactPersonDesignation, String email, String alternateEmail, String faxNo, String password,
			String website, boolean gstStatus, Date companyEstablishmentDate) throws ParseException {
		
		this.companyName = companyName;
		this.address = address;
		this.pincode = pincode;
		this.city = city;
		this.state = state;
		this.country = country;
		this.recruiterType = recruiterType;
		this.description = description;
		this.regDate = new Date();
		this.activeStatus =false;
		this.lastLogin = new Date();
		this.telephoneNo = telephoneNo;
		this.mobNo = mobNo;
		this.contactPersonName = contactPersonName;
		this.contactPersonDesignation = contactPersonDesignation;
		this.email = email;
		this.alternateEmail = alternateEmail;
		this.faxNo = faxNo;
		this.password = password;
		this.website = website;
		this.gstStatus = gstStatus;
		CompanyEstablishmentDate = companyEstablishmentDate;
	}

	public Company(int cId) {
		this.companyId = (long) cId;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	
    @Column(length=256)
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
    @Column(length=512)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
    @Column(length=6,nullable=true)
	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	
	@Column(length=64)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	@Column(name="states",length=64)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	@Column(length=64)
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	@Column(length=16)
	public String getRecruiterType() {
		return recruiterType;
	}

	public void setRecruiterType(String recruiterType) {
		this.recruiterType = recruiterType;
	}

	@Column(length=512)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	@Temporal(TemporalType.DATE)
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Column(columnDefinition="boolean default false")
	public boolean getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(boolean activeStatus) {
		this.activeStatus = activeStatus;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	@Column(length=14)
	public String getTelephoneNo() {
		return telephoneNo;
	}

	public void setTelephoneNo(String telephoneNo) {
		this.telephoneNo = telephoneNo;
	}
	@Column(length=14)
	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	@Column(length=64)
	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}
	@Column(length=64)
	public String getContactPersonDesignation() {
		return contactPersonDesignation;
	}

	public void setContactPersonDesignation(String contactPersonDesignation) {
		this.contactPersonDesignation = contactPersonDesignation;
	}
	@Column(length=32,unique=true)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	@Column(length=32)
	public String getAlternateEmail() {
		return alternateEmail;
	}

	public void setAlternateEmail(String alternateEmail) {
		this.alternateEmail = alternateEmail;
	}
	@Column(length=14)
	public String getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}
	@Column(length=32)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	@Column(length=64)
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
	@Column(columnDefinition="boolean default false")
	public boolean getGstStatus() {
		return gstStatus;
	}

	public void setGstStatus(boolean gstStatus) {
		this.gstStatus = gstStatus;
	}
	@Temporal(TemporalType.DATE)
	public Date getCompanyEstablishmentDate() {
		return CompanyEstablishmentDate;
	}

	public void setCompanyEstablishmentDate(Date companyEstablishmentDate) {
		CompanyEstablishmentDate = companyEstablishmentDate;
	}
	@Column(length=40)
	public String getImgPath() {
		return imgPath;
	}


	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}


	public String getCompanyRegistrationNumber() {
		return companyRegistrationNumber;
	}


	public void setCompanyRegistrationNumber(String companyRegistrationNumber) {
		this.companyRegistrationNumber = companyRegistrationNumber;
	}

	@Column(columnDefinition="boolean default false")
	public boolean getVerificationStatus() {
		return verificationStatus;
	}

	public void setVerificationStatus(boolean verificationStatus) {
		this.verificationStatus = verificationStatus;
	}

	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", companyName=" + companyName + ", address=" + address
				+ ", pincode=" + pincode + ", city=" + city + ", state=" + state + ", country=" + country
				+ ", recruiterType=" + recruiterType + ", description=" + description + ", regDate=" + regDate
				+ ", companyRegistrationNumber=" + companyRegistrationNumber + ", activeStatus=" + activeStatus
				+ ", verificationStatus=" + verificationStatus + ", lastLogin=" + lastLogin + ", telephoneNo="
				+ telephoneNo + ", mobNo=" + mobNo + ", contactPersonName=" + contactPersonName
				+ ", contactPersonDesignation=" + contactPersonDesignation + ", email=" + email + ", alternateEmail="
				+ alternateEmail + ", faxNo=" + faxNo + ", password=" + password + ", website=" + website
				+ ", gstStatus=" + gstStatus + ", CompanyEstablishmentDate=" + CompanyEstablishmentDate + ", imgPath="
				+ imgPath + "]";
	}


	
	
		
	
}
