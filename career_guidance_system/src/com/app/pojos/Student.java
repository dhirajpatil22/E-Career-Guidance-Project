package com.app.pojos;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Student {
	@Override
	public String toString() {
		return "Student [regno=" + regno + ", course=" + course + ", regdate=" + regdate + ", dob=" + dob + ", fname="
				+ fname + ", lname=" + lname + ", email=" + email + ", password=" + password + ", gender=" + gender
				+ ", imgpath=" + imgpath + ", country=" + country + ", state=" + state + ", district=" + district
				+ ", city=" + city + ", address=" + address + ", contact=" + contact + ", accstatus=" + accstatus
				+ ", placed=" + placed + ", lastlogin=" + lastlogin + ", pgcourse=" + pgcourse + ", pgstream="
				+ pgstream + ", pgyear=" + pgyear + ", pgpercent=" + pgpercent + ", gradcourse=" + gradcourse
				+ ", gradstream=" + gradstream + ", gradyear=" + gradyear + ", gradpercent=" + gradpercent + ", hsc="
				+ hsc + ", hscyear=" + hscyear + ", hscpercent=" + hscpercent + ", diplomastream=" + diplomastream
				+ ", diplomayear=" + diplomayear + ", diplomapercent=" + diplomapercent + ", sscyear=" + sscyear
				+ ", sscpercent=" + sscpercent + ", profilecompleted=" + profilecompleted + "]";
	}

	private Integer regno;
	private Courses course;
	private Date regdate;
	private Date dob;
	private String fname;
	private String lname;
	private String email;
	private String password;
	private String gender;
	private String imgpath;
	private String country;
	private String state;
	private String district;
	private String city;
	private String address;
	private String contact;
	private boolean accstatus;
	private boolean placed;
	private Date lastlogin;
	private String pgcourse;
	private String pgstream;
	private String pgyear;
	private String pgpercent;
	private String gradcourse;
	private String gradstream;
	private String gradyear;
	private String gradpercent;
	private boolean hsc;
	private String hscyear;
	private String hscpercent;
	private String diplomastream;
	private String diplomayear;
	private String diplomapercent;
	private String sscyear;
	private String sscpercent;
	private boolean profilecompleted;
	
	@Column(nullable=true,columnDefinition="boolean default false")
	public boolean isProfilecompleted() {
		return profilecompleted;
	}

	public void setProfilecompleted(boolean profilecompleted) {
		this.profilecompleted = profilecompleted;
	}

	@Column(nullable=true)
	public String getSscyear() {
		return sscyear;
	}

	public void setSscyear(String sscyear) {
		this.sscyear = sscyear;
	}
	
	@Column(nullable=true)
	public String getSscpercent() {
		return sscpercent;
	}

	public void setSscpercent(String sscpercent) {
		this.sscpercent = sscpercent;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@JoinColumn(name="courseid")
	@ManyToOne
	public Courses getCourse() {
		return course;
	}

	public void setCourse(Courses course) {
		this.course = course;
	}

	public Student(String fname, String lname, String email, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
	}

	public Student()
	{
		System.out.println("In def Cons Student");	
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getRegno() {
		return regno;
	}

	public void setRegno(Integer regno) {
		this.regno = regno;
	}

	@Temporal(TemporalType.DATE)
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-mm-dd")
	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	@Column(length=50,nullable=false)
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	
	@Column(length=50,nullable=false)
	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Column(length=75,unique=true,nullable=false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(length=250,nullable=false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(length=20)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	@Column(length=70)
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(length=70)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(length=70)
	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	@Column(length=70)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(length=100)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(columnDefinition="boolean default false",nullable=true)
	public boolean isAccstatus() {
		return accstatus;
	}

	public void setAccstatus(boolean accstatus) {
		this.accstatus = accstatus;
	}

	@Column(columnDefinition="boolean default false",nullable=true)
	public boolean isPlaced() {
		return placed;
	}

	public void setPlaced(boolean placed) {
		this.placed = placed;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(Date lastlogin) {
		this.lastlogin = lastlogin;
	}

	@Column(length=70)
	public String getPgcourse() {
		return pgcourse;
	}

	public void setPgcourse(String pgcourse) {
		this.pgcourse = pgcourse;
	}

	@Column(length=70)
	public String getPgstream() {
		return pgstream;
	}

	public void setPgstream(String pgstream) {
		this.pgstream = pgstream;
	}
	@Column(nullable=true)
	public String getPgyear() {
		return pgyear;
	}

	public void setPgyear(String pgyear) {
		this.pgyear = pgyear;
	}

	@Column(nullable=true)
	public String getPgpercent() {
		return pgpercent;
	}

	public void setPgpercent(String pgpercent) {
		this.pgpercent = pgpercent;
	}

	@Column(length=70)
	public String getGradcourse() {
		return gradcourse;
	}

	public void setGradcourse(String gradcourse) {
		this.gradcourse = gradcourse;
	}

	@Column(length=70)
	public String getGradstream() {
		return gradstream;
	}

	public void setGradstream(String gradstream) {
		this.gradstream = gradstream;
	}

	@Column(nullable=true)
	public String getGradyear() {
		return gradyear;
	}

	public void setGradyear(String gradyear) {
		this.gradyear = gradyear;
	}

	@Column(nullable=true)
	public String getGradpercent() {
		return gradpercent;
	}

	public void setGradpercent(String gradpercent) {
		this.gradpercent = gradpercent;
	}

	@Column(nullable=true)
	public boolean isHsc() {
		return hsc;
	}

	public void setHsc(boolean hsc) {
		this.hsc = hsc;
	}

	@Column(nullable=true)
	public String getHscyear() {
		return hscyear;
	}

	public void setHscyear(String hscyear) {
		this.hscyear = hscyear;
	}

	@Column(nullable=true)
	public String getHscpercent() {
		return hscpercent;
	}

	public void setHscpercent(String hscpercent) {
		this.hscpercent = hscpercent;
	}

	@Column(length=70)
	public String getDiplomastream() {
		return diplomastream;
	}

	public void setDiplomastream(String diplomastream) {
		this.diplomastream = diplomastream;
	}

	@Column(nullable=true)
	public String getDiplomayear() {
		return diplomayear;
	}

	public void setDiplomayear(String diplomayear) {
		this.diplomayear = diplomayear;
	}

	@Column(nullable=true)
	public String getDiplomapercent() {
		return diplomapercent;
	}

	public void setDiplomapercent(String diplomapercent) {
		this.diplomapercent = diplomapercent;
	}

	@Column(nullable=true)
	public String getContact() {
		return contact;
	}
	
	}
