package com.app.services;

import java.util.List;

import com.app.pojos.Admin;
import com.app.pojos.Company;
import com.app.pojos.Courses;
import com.app.pojos.PostedJob;
import com.app.pojos.Student;

public interface AdminService 
{
	public Admin validateAdmin(String username, String password);
	
	public List<Object[]> getStudentStatistics();
	
	public List<Company> getCompanyDetails();
	public void changeCompActiveStatus(long companyId);
	public void changeCompVerificationStatus(long companyId);
	
	public List<Object[]> getPostedJobs();
	
	public List<Object[]> getStudentDetails();
	public void changeStudActiveStatus(int regno);
	public void changeStudPlacementStatus(int regno);
	
	public List<Courses> getCourseDetails();

	public void postNewCourse(Courses c);
	
	public List<Student> shortlistStudents(float sscmarks, float hscmarks, float diplomamarks, float gradmarks);
	
}
