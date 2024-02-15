package com.app.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.daos.CompanyDao;
import com.app.pojos.Company;
import com.app.pojos.PostedJob;
//import com.app.services.CompanyService;
//import com.fasterxml.jackson.core.sym.Name;
import static com.app.utils.SendEmail.SendMail;

//import java.math.BigInteger;
//import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Date;;



@Controller
@RequestMapping("/company")
public class CompanyController {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Autowired
	private CompanyDao cdao;
	
	
	public CompanyController()
	{
		
	}
	
	@GetMapping("")
	public String login()
	{
		return "company/companyLogin";
	}
	
	@PostMapping("")
	public String processCompanyLogin(Model map,@RequestParam String email,@RequestParam String pass, HttpSession hs)
	{
		Company u=null;
		try
		{
			u=cdao.validateUser(email, pass);
		}catch (Exception e) 
		{
			map.addAttribute("mesg", "can not login");
			return "/company/companyLogin";
		}
		if(u!=null)
		{
			hs.setAttribute("user_dtls", u);
			hs.setAttribute("company",u);
			return "company/companyDashboard";
		}
		else
		{
			map.addAttribute("mesg", "account either does not exists or is not active");
			return "company/companyLogin";
		}
	}
	
	@GetMapping("register")
	public String register(Model model)
	{
		model.addAttribute("register", new Company());
		return "company/companyRegister";
	}
	
	@PostMapping("/register")
	public String doReg(@ModelAttribute Company company,Model map)
	{
		if(company.getCountry() == null)
			company.setCountry("India");
		
		String mesg = cdao.registerCompany(company);
		if(mesg == "")
		{
			mesg = "email already exists";
			return "company/companyLogin";
		}
		SendMail(company.getEmail());
		map.addAttribute("mesg", mesg + "Email has beem sent to your email id. Please Verify your account by clicking on the link in email");
		return "company/companyLogin";
	}
	
	@GetMapping("/accountActivate")
	public String accountActivate(@RequestParam String email,Model map,HttpSession hs)
	{
		Company c = (Company) hs.getAttribute("company");
		if(c == null)
		{
			map.addAttribute("mesg", "Session expired. Please login again");
			return "/company/companyLogin"; 
		}
		cdao.activateCompanyAccount(email);
		return "/company/companyLogin";
	}
	
	@GetMapping("companyProfile")
	public String companyProfile(Model map,HttpSession hs)
	{
		Company c = (Company) hs.getAttribute("company");
		if(c == null)
		{
			map.addAttribute("mesg", "Session expired. Please login again");
			return "/company/companyLogin"; 
		}
		map.addAttribute("register", c);
		return "/company/companyProfile";
	}
	
	@PostMapping("companyProfile")
	public String editCompany(@ModelAttribute("register") Company c,HttpSession hs,Model map)
	{
		String msg = cdao.updateCompany(c);
		if(msg != "Company details updated successfully")
		{
			map.addAttribute("mesg", msg);
			return "company/companyDashboard"; 
		}
		hs.setAttribute("company", c);
		return "company/companyDashboard"; 
	}
	
	@GetMapping("/postJob")
	public String postJob(HttpSession hs,Model map)
	{
		Company c = (Company) hs.getAttribute("company");
		if(c == null)
		{
			map.addAttribute("mesg", "Session expired. Please login again");
			return "/company/companyLogin"; 
		}
		return "/company/postJob";
	}
	
	@PostMapping("/postJobProcess")
	public String processJobPost(HttpSession hs, Model map, /*@ModelAttribute("post_job") PostedJob pj*/
			@RequestParam long cId,
			@RequestParam String jobTitle, @RequestParam String jobDescription,
			@RequestParam String jobLocation, @RequestParam int vacancies, @RequestParam String interviewLocation,
			@RequestParam String jobType, @RequestParam String salary, @RequestParam String lastDateToApply,
			@RequestParam String interviewDate, @RequestParam String requiredSkills,
			@RequestParam double sscPercentage,@RequestParam double hscPercentage,
			@RequestParam double diplomaPercentage,@RequestParam double gradPercentage,
			@RequestParam double postGradPercentage) throws Exception
	{
		Company c = (Company) hs.getAttribute("company");
		if(c != null)
		{
			PostedJob pj = new PostedJob(c, jobTitle, jobDescription, vacancies, jobLocation, jobType,
				salary, interviewLocation, interviewDate, lastDateToApply, requiredSkills,
				sscPercentage,hscPercentage,diplomaPercentage,gradPercentage,postGradPercentage);
				
			String msg = cdao.postJob(pj);
			map.addAttribute("mesg", msg);
			return "/company/companyDashboard";
		}
		map.addAttribute("mesg", "Session expired. Please login again");
		return "/company/companyLogin"; 
		
	}
	
	@GetMapping("postedJobHistory")
	public String postedJobHistory(@RequestParam long id,Model map,HttpSession hs)
	{
		Company c = (Company) hs.getAttribute("company");
		if(c == null)
		{
			map.addAttribute("mesg", "Session expired. Please login again");
			return "/company/companyLogin"; 
		}
		
		ArrayList<PostedJob> hj = cdao.getPastJobs(id);
		if(hj != null)
		{
			map.addAttribute("his_jobs", hj);
			map.addAttribute("history_jobs", "History of Jobs Posted");
		}
		else
			map.addAttribute("history_jobs", "No jobs posted yet");
		return "/company/postedJobHistory";
	}
	
	@GetMapping("editJob/{jid}")
	public String editJob(Model map, @PathVariable int jid,HttpSession hs)
	{
		Company c = (Company) hs.getAttribute("company");
		if(c == null)
		{
			map.addAttribute("mesg", "Session expired. Please login again");
			return "/company/companyLogin"; 
		}
		
		PostedJob j = cdao.getJobObject(jid);
		if(j!=null)
		{	map.addAttribute("job_edit", j);
			return "/company/editJob";
		}
		map.addAttribute("mesg", "error in retriving job details. Please try again");
		return "/company/companyDashboard";
	}
	
	@PostMapping("/editJob")
	public String updateJob(@ModelAttribute("job_edit") PostedJob j, HttpSession hs,Model map)
	{
		Company c = (Company) (hs.getAttribute("company"));
		j.setCompanyId(c);
		String msg = cdao.updateJob(j);
		
		if(msg == "Can not update job details. Please try again")
		{
			map.addAttribute("mesg", msg);
			return "/company/companyDashboard";
		}
		
		ArrayList<PostedJob> hj = cdao.getPastJobs(c.getCompanyId());
		if(hj != null)
		{
			map.addAttribute("his_jobs", hj);
			map.addAttribute("history_jobs", "History of Jobs Posted");
		}
		else
			map.addAttribute("history_jobs", "No jobs posted yet");
		
		return "company/postedJobHistory";
	}
	
	@GetMapping("/companyLogout")
	public String companyLogout(HttpSession hs)
	{
		hs.invalidate();
		return "/company/companyLogin";
	}
	
}
