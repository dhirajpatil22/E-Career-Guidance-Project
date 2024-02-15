package com.app.daos;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.*;

@Transactional
@Repository
public class CompanyDaoImplementation implements CompanyDao {

	@Autowired
	private SessionFactory sf;
	
	@Override
	public Company validateUser(String em1, String pass1) {
		
		String jpql = "select c from Company c where c.email=:em and c.password=:pa and c.activeStatus=true";	
		Company c= null;
		try
		{
			c=  sf.getCurrentSession().createQuery(jpql, Company.class).
				setParameter("em", em1).
				setParameter("pa", pass1).
				getSingleResult();		
			c.setLastLogin(new Date());
		}catch (Exception e) {
			return c;
		}
		return c;
	}

	@Override
	public String registerCompany(Company company) {
		company.setLastLogin(new Date());
		company.setRegDate(new Date());		
		try{
			sf.getCurrentSession().save(company);
			return "Registration successful";
		}catch (Exception e) {
			return "";
		}
				
	}

	@Override
	public String activateCompanyAccount(String em) {
		String jpql = "update Company c set c.activeStatus=true where c.email=:em";
		int n=0;
		try{
			n=sf.getCurrentSession().createQuery(jpql).setParameter("em", em).executeUpdate();
		}catch (Exception e) {
			return "Can not activate your account. Please try again.";
		}
		if(n>0)
			return "Account activated";
		return "Account Activatation Failed";
		
	}
	
	@Override
	public Company getCompanyObj(long id)
	{		
		Company c=null;
		try{
			return (Company) sf.getCurrentSession().get(Company.class, id);
		}catch (Exception e) {
			return c;
		}
	}

	@Override
	public String postJob(PostedJob pj) {
		try{
			sf.getCurrentSession().save(pj);
			return "New job posted successfully";
		}catch (Exception e) {
			return "Can not post new job";
		}
	}

	@Override
	public ArrayList<PostedJob> getPastJobs(long id) {
		
		Company c = sf.getCurrentSession().get(Company.class, id);
		String jpql = "select pj from PostedJob pj where pj.companyId=:c";
		try{
			ArrayList<PostedJob> al = (ArrayList<PostedJob>) sf.getCurrentSession().createQuery(jpql, PostedJob.class).setParameter("c", c).getResultList();
			return al;
		}catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public PostedJob getJobObject(int jid) {
		String jpql = "select p from PostedJob p where p.jobId=:jid";
		try{
			return sf.getCurrentSession().createQuery(jpql, PostedJob.class).setParameter("jid", jid).getSingleResult();
		}catch (Exception e) {
			return null;
		}
	}

	@Override
	public String updateJob(PostedJob j) {
		try{
			sf.getCurrentSession().update(j);
			return "job details updated successfully";
		}catch (Exception e) {
			return "Can not update job details. Please try again";
		}
	}

	@Override
	public String updateCompany(Company c) {
		try{
			sf.getCurrentSession().update(c);
			return "Company details updated successfully";
		}catch (Exception e) {
			return "Can not update company details. Please try again";
		}
		
	}


}
