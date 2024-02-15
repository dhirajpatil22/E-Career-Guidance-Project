package com.app.pojos;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class EndModuleResponse {
	private EndModuleResponseId responseid;
	private String studentresponse;
	private boolean isrightanswer;
	
	public EndModuleResponse() {
		// TODO Auto-generated constructor stub
	}

	@EmbeddedId
	public EndModuleResponseId getResponseid() {
		return responseid;
	}

	public void setResponseid(EndModuleResponseId responseid) {
		this.responseid = responseid;
	}

	public String getStudentresponse() {
		return studentresponse;
	}

	public void setStudentresponse(String studentresponse) {
		this.studentresponse = studentresponse;
	}

	public boolean isIsrightanswer() {
		return isrightanswer;
	}

	public void setIsrightanswer(boolean isrightanswer) {
		this.isrightanswer = isrightanswer;
	}
	
	
}
