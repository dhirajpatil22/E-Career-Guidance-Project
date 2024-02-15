package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TestId {
	private Integer testid;
	private String testname;
	
	public TestId() {
	
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getTestid() {
		return testid;
	}
	@Override
	public String toString() {
		return "TestId [testid=" + testid + ", testname=" + testname + "]";
	}

	public void setTestid(Integer testid) {
		this.testid = testid;
	}
	
	@Column(length=100)
	public String getTestname() {
		return testname;
	}
	public void setTestname(String testname) {
		this.testname = testname;
	}
}
