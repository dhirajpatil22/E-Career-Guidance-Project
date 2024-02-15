package com.app.daos;

import java.util.ArrayList;

import com.app.pojos.Company;
import com.app.pojos.PostedJob;

public interface CompanyDao {


	Company validateUser(String em1, String pass1);
	String registerCompany(Company company);
	String activateCompanyAccount(String em);
	public Company getCompanyObj(long id);
	String postJob(PostedJob pj);
	ArrayList<PostedJob> getPastJobs(long id);
	PostedJob getJobObject(int jid);
	String updateJob(PostedJob j);
	String updateCompany(Company c);
	
}
