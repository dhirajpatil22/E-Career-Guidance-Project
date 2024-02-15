package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class StudentJobRecord {
	private Student regno;
	private Integer studentRecordId;
	private PostedJob jobId;
	private boolean selected;
	private boolean shortlisted;
	private boolean recruited;
	
	public StudentJobRecord() {
		
	}

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE)
	public Integer getStudentRecordId() {
		return studentRecordId;
	}

	public void setStudentRecordId(Integer studentRecordId) {
		this.studentRecordId = studentRecordId;
	}
	 @JoinColumn(name="JobId")
	    @ManyToOne
	public PostedJob getJobId() {
		return jobId;
	}

	public void setJobId(PostedJob jobId) {
		this.jobId = jobId;
	}
	@Column(columnDefinition="boolean default false") 
	public boolean getSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	@Column(columnDefinition="boolean default false")
	public boolean getShortlisted() {
		return shortlisted;
	}

	public void setShortlisted(boolean shortlisted) {
		this.shortlisted = shortlisted;
	}
	@Column(columnDefinition="boolean default false")
	public boolean getRecruited() {
		return recruited;
	}

	public void setRecruited(boolean recruited) {
		this.recruited = recruited;
	}
	
	

}
