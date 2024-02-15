package com.app.pojos;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.ManyToAny;

@Embeddable
public class DailyTestId implements Serializable {
	private TestId testid;
	private Student student;
	
	public DailyTestId() {
		// TODO Auto-generated constructor stub
	}
	
	@JoinColumn(name="testid")
	@ManyToOne
	public TestId getTestId() {
		return testid;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((student == null) ? 0 : student.hashCode());
		result = prime * result + ((testid == null) ? 0 : testid.hashCode());
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
		DailyTestId other = (DailyTestId) obj;
		if (student == null) {
			if (other.student != null)
				return false;
		} else if (!student.equals(other.student))
			return false;
		if (testid == null) {
			if (other.testid != null)
				return false;
		} else if (!testid.equals(other.testid))
			return false;
		return true;
	}

	public void setTestId(TestId testid) {
		this.testid = testid;
	}
	
	@JoinColumn(name="regno")
	@ManyToOne
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
}
