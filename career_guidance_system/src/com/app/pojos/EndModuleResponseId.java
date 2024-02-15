package com.app.pojos;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class EndModuleResponseId implements Serializable {
	private Student student;
	private EndModuleTest questionid;
	
	public EndModuleResponseId() {
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((questionid == null) ? 0 : questionid.hashCode());
		result = prime * result + ((student == null) ? 0 : student.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EndModuleResponseId other = (EndModuleResponseId) obj;
		if (questionid == null) {
			if (other.questionid != null)
				return false;
		} else if (!questionid.equals(other.questionid))
			return false;
		if (student == null) {
			if (other.student != null)
				return false;
		} else if (!student.equals(other.student))
			return false;
		return true;
	}

	@JoinColumn(name="regno")
	@ManyToOne
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@JoinColumn(name="questionid")
	@ManyToOne
	public EndModuleTest getQuestionid() {
		return questionid;
	}

	public void setQuestionid(EndModuleTest questionid) {
		this.questionid = questionid;
	}
}
