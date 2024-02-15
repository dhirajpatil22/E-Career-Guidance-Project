package com.app.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.utils.GenerateExcel;

import com.app.pojos.Admin;
import com.app.pojos.Company;
import com.app.pojos.Courses;
import com.app.pojos.Student;
import com.app.services.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController 
{
	@Autowired
	private AdminService service;
	private GenerateExcel ge=new GenerateExcel();
	
	public AdminController()
	{
		System.out.println("In AdminController"+System.getenv("pass")+"\n"+System.getProperty("pass"));
	}
	 
	@GetMapping("/")
	public String login()
	{		
		return "admin/adminlogin";
	}
	
	@PostMapping("/")
	public String validateAdmin(Model map, @RequestParam String username, @RequestParam String password, HttpSession hs)
	{
		System.out.println("IN LOGIN");
		
		Admin a=null;
		
		try
		{
			a=service.validateAdmin(username, password);
		}
		catch (RuntimeException e) 
		{
			System.out.println("ERROR in Login"+e);
			map.addAttribute("msg","Invalid Credentials, Please Retry");
			return "/admin/adminlogin";
		}
		
		hs.setAttribute("msg", "Successfull Login");
		hs.setAttribute("admin_obj", a);
		
		return "redirect: adminhome";
	}
	
	@GetMapping("/adminhome")
	public String adminHome()
	{
		//System.out.println("in admin home");
		return "admin/adminhome";
	}
	
	@GetMapping("/course_stat")
	public String getStudentStatistics(Model map)
	{	
		List<Object[]> studstat_list=service.getStudentStatistics();
				
		/*for (int i = 0; i < l.size(); i++) 
		{
			count[i]=(long)l.get(i)[0];
			cname[i]=(String)l.get(i)[1];
			System.out.println(count[i]);
			System.out.println(cname[i]);
		}*/
		
		map.addAttribute("studstat_list",studstat_list);
		
		return "admin/studentstat";
	}
	
	@GetMapping("/company_details")
	public String getCompanyDetails(Model map)
	{	
		System.out.println("In company controller");
		List<Company> comp_list=service.getCompanyDetails();
		map.addAttribute("comp_obj",comp_list);
		return "admin/companydetails";
	}
	
	@GetMapping("/company_activestatus")
	public String changeCompActiveStatus(@RequestParam long companyId)
	{	
		System.out.println("In changeCompActiveStatus controller");		
		service.changeCompActiveStatus(companyId);
		return "redirect: company_details";
	}
	
	@GetMapping("/company_verificationstatus")
	public String changeCompVerificationStatus(@RequestParam long companyId)
	{	
		System.out.println("In changeCompVerificationStatus controller");		
		service.changeCompVerificationStatus(companyId);
		return "redirect: company_details";
	}
	
	@GetMapping("/posted_jobs")
	public String getPostedJobs(Model map)
	{	
		List<Object[]> postedjobs_list=service.getPostedJobs();
		map.addAttribute("postedjobs_obj",postedjobs_list);
		
		return "admin/postedjobs";
	}
	
	@GetMapping("/student_details")
	public String getStudentDetails(Model map)
	{	
		System.out.println("In student controller******");
		List<Object[]> stud_list=service.getStudentDetails();
		for (int i = 0; i < stud_list.size(); i++) 
		{
			System.out.println(stud_list.get(i)[0]);
		}
		map.addAttribute("stud_obj",stud_list);
		return "admin/studentdetails";
	}
	
	@GetMapping("/student_activestatus")
	public String changeStudActiveStatus(@RequestParam int regno)
	{	
		System.out.println("In changeStudActiveStatus controller");		
		service.changeStudActiveStatus(regno);
		return "redirect: student_details";
	}
	
	@GetMapping("/student_placementstatus")
	public String changeStudPlacementStatus(@RequestParam int regno)
	{	
		System.out.println("In changeStudPlacementStatus controller");		
		service.changeStudPlacementStatus(regno);
		return "redirect: student_details";
	}
	
	
	@GetMapping("/get_coursedetails")
	public String getCourseDetails(Model map)
	{	
		List<Courses> course_list=service.getCourseDetails();
		for(Courses c : course_list)
			System.out.println(c.getCoursename());
		map.addAttribute("course_obj",course_list);
		return "admin/viewcourses";
	}
	
	@PostMapping("/add_newcourse")
	public String postJob()
	{
		return "/admin/postcourse";
	}
	
	@GetMapping("/post_newcourse")
	public String postNewCourse(Model map, @RequestParam String coursename, @RequestParam String description, HttpSession hs)throws Exception
	{	
		System.out.println("postingNewCourse");
		//Company companyId = service.getCompanyObj(courseid);
		
		System.out.println(coursename);
		System.out.println(description);
		String imgpath=null;
		
		//Courses c = new Courses(coursename, description, imgpath);
		Courses c = new Courses();
		c.setCoursename(coursename);
		c.setDescription(description);
		c.setCourseimg(imgpath);
		service.postNewCourse(c);
		System.out.println("postedNewCourse");
		return "admin/adminhome";
	}
	
	
	@GetMapping("/shortlist_students")
	public String shortlistStudents(Model map, @RequestParam String companyName, @RequestParam int jobId,  @RequestParam String emailid, @RequestParam float sscmarks, @RequestParam float hscmarks, @RequestParam float diplomamarks, @RequestParam float gradmarks)throws IOException
	{
		System.out.println("shortlistStudents Controller");
		List<Student> lstud=service.shortlistStudents(sscmarks, hscmarks, diplomamarks, gradmarks);
		
		map.addAttribute("shortliststudent_obj",lstud);
		map.addAttribute("companyname",companyName);
		map.addAttribute("jobid",jobId);
		map.addAttribute("emailid",emailid);

		ge.writeExcel(lstud, "I:\\ProjectStuff\\imp\\stud.xls");
		
		return "admin/shortlistedstudents";		
	}
	
	
	
/*	public void writeExcel(List<Student> listBook, String excelFilePath) throws IOException 
	{
		Workbook workbook = getWorkbook(excelFilePath);
		Sheet sheet = workbook.createSheet();
		
		int rowCount = 0;
		
		for (Student aBook : listBook) 
		{
			Row row = sheet.createRow(++rowCount);
			writeBook(aBook, row);
		}
		
		try (FileOutputStream outputStream = new FileOutputStream(excelFilePath)) 
		{
			workbook.write(outputStream);
		}		
	}
	
	private void writeBook(Student aBook, Row row) 
	{
		Cell cell = row.createCell(1);
		cell.setCellValue(aBook.getEmail());

		cell = row.createCell(2);
		cell.setCellValue(aBook.getCity());
		
		cell = row.createCell(3);
		cell.setCellValue(aBook.getDob());
	}
	
	
	
	private Workbook getWorkbook(String excelFilePath) throws IOException 
	{
		Workbook workbook = null;
		
		if (excelFilePath.endsWith("xlsx")) 
		{
			workbook = new XSSFWorkbook();
		} 
		else if (excelFilePath.endsWith("xls")) 
		{
			workbook = new HSSFWorkbook();
		} 
		else 
		{
			throw new IllegalArgumentException("The specified file is not Excel file");
		}
		return workbook;
	}*/
	
	
}