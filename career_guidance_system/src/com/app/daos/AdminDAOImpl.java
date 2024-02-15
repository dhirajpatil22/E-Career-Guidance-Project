package com.app.daos;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.Admin;
import com.app.pojos.Company;
import com.app.pojos.Courses;
import com.app.pojos.Student;


@Repository
@Transactional
public class AdminDAOImpl implements AdminDAO
{
	@Autowired
	private SessionFactory sf;

	@Override
	public Admin validateAdmin(String username, String password)
	{
		String login="select a from Admin a where a.username= :username and a.password= :password";
		return sf.getCurrentSession().createQuery(login, Admin.class).
				  setParameter("username", username).
				  setParameter("password", password).
				  getSingleResult();		
	}


	
	/*@Override
	public List<DataTable> studentStatistics() 
	{
		List<DataTable> l=null;
		System.out.println("In stat dao");
		String stat="select new DataTable(count(s.studentname),s.coursename) from DataTable s group by s.coursename";
		//select count(studentname), coursename from table group by coursename;
		//String stat="select new DataTable(s.studentname,s.coursename) from DataTable s";
		l=sf.getCurrentSession().createQuery(stat,DataTable.class).getResultList();
		return l;
	}*/
	
	@Override
	public List<Object[]> getStudentStatistics() 
	{
		String jpql="SELECT count(s.regno),c.coursename FROM Student s, Courses c WHERE s.course = c.courseid group by c.coursename";

		@SuppressWarnings("unchecked")
		List<Object[]> lobj=(List<Object[]>)sf.getCurrentSession().createQuery(jpql).getResultList();
		return lobj;
	}


	@Override
	public List<Company> getCompanyDetails() 
	{
		String jpql="SELECT c from Company c";
		List<Company> lcomp=sf.getCurrentSession().createQuery(jpql,Company.class).getResultList();
		return lcomp;
	}

	@Override
	public void changeCompActiveStatus(long companyId) 
	{
		Company c=(Company)sf.getCurrentSession().get(Company.class, companyId);
		c.setActiveStatus(!c.getActiveStatus());
	}

	@Override
	public List<Object[]> getPostedJobs() 
	{
		String jpql="SELECT c.companyId, c.companyName, c.email, p FROM Company c, PostedJob p WHERE c.companyId = p.companyId";

		List<Object[]> lobj=(List<Object[]>)sf.getCurrentSession().createQuery(jpql).getResultList();
		
		
	//System.out.print(lobj.get(1));
		
		return lobj;
	}

	@Override
	public List<Object[]> getStudentDetails() 
	{
		//String jpql="SELECT s from Student s";
		String jpql="SELECT c.coursename, s FROM Student s, Courses c WHERE c.courseid = s.course";
		List<Object[]> lstud=(List<Object[]>)sf.getCurrentSession().createQuery(jpql).getResultList();
		return lstud;
	}

	@Override
	public void changeStudActiveStatus(int regno) 
	{
		Student s=(Student)sf.getCurrentSession().get(Student.class, regno);
		s.setAccstatus(!s.isAccstatus());
	}

	@Override
	public void changeStudPlacementStatus(int regno) 
	{
		Student s=(Student)sf.getCurrentSession().get(Student.class, regno);
		s.setPlaced(!s.isPlaced());
	}



	@Override
	public void changeCompVerificationStatus(long companyId) 
	{
		Company c=(Company)sf.getCurrentSession().get(Company.class, companyId);
		c.setActiveStatus(!c.getActiveStatus());
		c.setVerificationStatus(!c.getVerificationStatus());
	}

	@Override
	public List<Courses> getCourseDetails() 
	{
		String jpql="SELECT c from Courses c";
		List<Courses> lcourses=sf.getCurrentSession().createQuery(jpql,Courses.class).getResultList();
		for(Courses c : lcourses)
			System.out.println(c.getCoursename());
		return lcourses;
	}


	@Override
	public void postNewCourse(Courses c) 
	{
		System.out.println("DAO MADHE AALA");
		sf.getCurrentSession().save(c);
	}



	@Override
	public List<Student> shortlistStudents(float sscmarks, float hscmarks, float diplomamarks,float gradmarks) 
	{	
		String jpql="SELECT s from Student s where Cast(s.sscpercent as float)>= :sscmarks and  Cast(s.hscpercent as float)>= :hscmarks and Cast(s.diplomapercent as float)>= :diplomamarks and Cast(s.gradpercent as float)>= :gradmarks and s.placed!=true and s.accstatus!=false";
		
		return sf.getCurrentSession().createQuery(jpql, Student.class).
				 setParameter("sscmarks", sscmarks).
				 setParameter("hscmarks", hscmarks).
				 setParameter("diplomamarks",diplomamarks).
				 setParameter("gradmarks",gradmarks).
				  
				  getResultList();
	}
}