package com.app.pojos;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class EndModuleResult {
	private EndModuleResultId resultid;
	private int totalmarks;
	private int marksobtained;
	
	public EndModuleResult() {
		// TODO Auto-generated constructor stub
	}
	
	@EmbeddedId
	public EndModuleResultId getResultid() {
		return resultid;
	}
	public void setResultid(EndModuleResultId resultid) {
		this.resultid = resultid;
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
	

}
