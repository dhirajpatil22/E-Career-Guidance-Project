package com.app.pojos;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.AttributeConverter;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Converter;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKey;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.postgresql.util.HStoreConverter;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class PostedJob {
	private Company companyId;
	private Integer jobId,vacancies;
	private String jobTitle,jobLocation,jobDescription,interviewLocation,jobType;
	private String salary;
	private Date lastDateToApply,interviewDate,jobPostedDate;
	private String requiredSkills;
	private JobEligibilityCriteria jobEligibilityCriteria;	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	

	
	public PostedJob() {
		
	}
	

	public PostedJob(Company companyId,String jobTitle, String jobDescription, Integer vacancies,  String jobLocation, 
			String jobType, String salary, String interviewLocation, String interviewDate,  String lastDateToApply, 
			String requiredSkills,double sscPercentage,double hscPercentage,double diplomaPercentage,double gradPercentage,
			double postGradPercentage) throws Exception {
		//super();
		this.companyId = companyId;
		this.vacancies = vacancies;
		this.jobTitle = jobTitle;
		this.jobLocation = jobLocation;
		this.jobDescription = jobDescription;
		this.interviewLocation = interviewLocation;
		this.jobType = jobType;
		this.salary = salary;
		this.lastDateToApply = sdf.parse(lastDateToApply);
		this.interviewDate = sdf.parse(interviewDate);
		this.jobPostedDate = new Date();
		this.requiredSkills = requiredSkills;
		
		jobEligibilityCriteria = new JobEligibilityCriteria(sscPercentage,hscPercentage,diplomaPercentage,gradPercentage,postGradPercentage);
		
	}



	@JoinColumn(name="companyId")
    @ManyToOne
	public Company getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Company companyId) {
		this.companyId = companyId;
	}
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
    
	public Integer getVacancies() {
		return vacancies;
	}

	public void setVacancies(Integer vacancies) {
		this.vacancies = vacancies;
	}
	
	@Column(length=32)
	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	
	@Column(length=32)
	public String getJobLocation() {
		return jobLocation;
	}

	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	
	@Column(length=512)
	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	
	@Column(length=32)
	public String getInterviewLocation() {
		return interviewLocation;
	}

	public void setInterviewLocation(String interviewLocation) {
		this.interviewLocation = interviewLocation;
	}
	
	@Column(length=32)
	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
     
	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy/mm/dd")
	public Date getLastDateToApply() {
		return lastDateToApply;
	}

	public void setLastDateToApply(Date lastDateToApply) {
		this.lastDateToApply = lastDateToApply;
	}
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy/mm/dd")
	public Date getInterviewDate() {
		return interviewDate;
	}

	public void setInterviewDate(Date interviewDate) {
		this.interviewDate = interviewDate;
	}
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-mm-dd")
	public Date getJobPostedDate() {
		return jobPostedDate;
	}

	public void setJobPostedDate(Date jobPostedDate) {
		this.jobPostedDate = jobPostedDate;
	}
	
	@Column(length=1000)
	public String getRequiredSkills() {
		return requiredSkills;
	}
	
	public void setRequiredSkills(String requiredSkills) {
		this.requiredSkills = requiredSkills;
	}

	@Embedded
	public JobEligibilityCriteria getJobEligibilityCriteria() {
		return jobEligibilityCriteria;
	}


	public void setJobEligibilityCriteria(JobEligibilityCriteria jobEligibilityCriteria) {
		this.jobEligibilityCriteria = jobEligibilityCriteria;
	}





	@Override
	public String toString() {
		return "PostedJob [CompanyId=" + companyId + ", vacancies=" + vacancies + ", jobTitle=" + jobTitle + ", jobLocation="
				+ jobLocation + ", jobDescription=" + jobDescription + ", interviewLocation=" + interviewLocation
				+ ", jobType=" + jobType + ", salary=" + salary + ", lastDateToApply=" + lastDateToApply
				+ ", interviewDate=" + interviewDate + ", jobPostedDate=" + jobPostedDate + ", requiredSkills="
				+ requiredSkills + "]";
	}
	
/*	public Map<String, String> getEligibilityCriteria() {
		return eligibilityCriteria;
	}
	public void setEligibilityCriteria(HashMap<String, String> eligibilityCriteria) {
		this.eligibilityCriteria = eligibilityCriteria;
	}
	*/
	
	

}
