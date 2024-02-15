package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class JobEligibilityCriteria {
	
	@Column(name="sscpercentage")
	private double sscPercentage;
	@Column(name="hscpercentage")
	private double  hscPercentage;
	@Column(name="gradpercentage")
	private double gradPercentage;

	@Column(name="diplomapercentage")
	private double diplomaPercentage;
	@Column(name="postgradpercentage")
	private double postGradPercentage;
	
	public JobEligibilityCriteria()
	{
		
	}

	public JobEligibilityCriteria(double sscPercentage, double hscPercentage, double gradPercentage,
			double diplomaPercentage, double postGradPercentage) {
		
		this.sscPercentage = sscPercentage;
		this.hscPercentage = hscPercentage;
		this.gradPercentage = gradPercentage;
		this.diplomaPercentage = diplomaPercentage;
		this.postGradPercentage = postGradPercentage;
	}

	
	public double getSscPercentage() {
		return sscPercentage;
	}

	public void setSscPercentage(double sscPercentage) {
		this.sscPercentage = sscPercentage;
	}

	public double getHscPercentage() {
		return hscPercentage;
	}

	public void setHscPercentage(double hscPercentage) {
		this.hscPercentage = hscPercentage;
	}

	public double getGradPercentage() {
		return gradPercentage;
	}

	public void setGradPercentage(double gradPercentage) {
		this.gradPercentage = gradPercentage;
	}
	public double getDiplomaPercentage() {
		return diplomaPercentage;
	}

	public void setDiplomaPercentage(double diplomaPercentage) {
		this.diplomaPercentage = diplomaPercentage;
	}
	
	public double getPostGradPercentage() {
		return postGradPercentage;
	}

	public void setPostGradPercentage(double postGradPercentage) {
		this.postGradPercentage = postGradPercentage;
	}

	@Override
	public String toString() {
		return "JobEligibilityCriteria [sscPercentage=" + sscPercentage + ", hscPercentage=" + hscPercentage
				+ ", gradPercentage=" + gradPercentage + ", diplomaPercentage=" + diplomaPercentage
				+ ", postGradPercentage=" + postGradPercentage + "]";
	}
	
	
	
}
