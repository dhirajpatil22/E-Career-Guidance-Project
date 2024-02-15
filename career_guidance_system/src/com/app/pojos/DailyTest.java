package com.app.pojos;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DailyTest {
	
	private DailyTestId dailytestid;
	private int totalmarks;
	private int marksobtained;
	private boolean ispass;
	
	public DailyTest() {
		// TODO Auto-generated constructor stub
	}
	
	@EmbeddedId
	public DailyTestId getDailytestid() {
		return dailytestid;
	}
	public void setDailytestid(DailyTestId dailytestid) {
		this.dailytestid = dailytestid;
	}
	public int getTotalmarks() {
		return totalmarks;
	}
	public void setTotalmarks(int totalmarks) {
		this.totalmarks = totalmarks;
	}
	public int getMarksobtained() {
		return marksobtained;
	}
	public void setMarksobtained(int marksobtained) {
		this.marksobtained = marksobtained;
	}
	public boolean isIspass() {
		return ispass;
	}
	public void setIspass(boolean ispass) {
		this.ispass = ispass;
	}
}
