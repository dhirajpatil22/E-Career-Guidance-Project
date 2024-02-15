package com.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.daos.AdminDAO;
import com.app.pojos.Admin;
import com.app.pojos.Company;
import com.app.pojos.Courses;
import com.app.pojos.Student;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminDAO dao;
	//List<DataTable> l=null;
	
	@Override
	public Admin validateAdmin(String username, String password)
	{
		//if(username!=null && password!=null)
			return dao.validateAdmin(username,password);
	}

	/*@Override
	public List<DataTable> studentStatistics() 
	{
		l=dao.studentStatistics();
		return l;
	}*/

	/*@Override
	public List<DataTable> studentStatistics() 
	{   System.out.println("stat service");
		return dao.studentStatistics();
	}*/
	
	@Override
	public List<Object[]> getStudentStatistics() 
	{  
		return dao.getStudentStatistics();
	}
	
	@Override
	public List<Company> getCompanyDetails() 
	{  
		return dao.getCompanyDetails();
	}

	@Override
	public void changeCompActiveStatus(long companyId) 
	{
		dao.changeCompActiveStatus(companyId);
	}

	@Override
	public List<Object[]> getPostedJobs() 
	{
		return dao.getPostedJobs();
	}

	@Override
	public List<Object[]> getStudentDetails() 
	{
		return dao.getStudentDetails();
	}

	@Override
	public void changeStudActiveStatus(int regno) 
	{
		dao.changeStudActiveStatus(regno);	
	}

	@Override
	public void changeStudPlacementStatus(int regno) 
	{
		dao.changeStudPlacementStatus(regno);
	}

	@Override
	public void changeCompVerificationStatus(long companyId) 
	{
		dao.changeCompVerificationStatus(companyId);
	}

	@Override
	public List<Courses> getCourseDetails() 
	{
		return dao.getCourseDetails();
	}

	@Override
	public void postNewCourse(Courses c) 
	{
		dao.postNewCourse(c);		
	}

	@Override
	public List<Student> shortlistStudents(float sscmarks, float hscmarks, float diplomamarks, float gradmarks) 
	{
		return dao.shortlistStudents(sscmarks,hscmarks, diplomamarks,gradmarks);
	}
	
}
