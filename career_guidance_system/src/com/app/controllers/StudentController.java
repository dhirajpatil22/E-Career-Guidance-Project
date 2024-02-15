package com.app.controllers;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.daos.CourseDao;
import com.app.daos.StudentDao;
import com.app.daos.TestDao;
import com.app.pojos.Chapter;
import com.app.pojos.Courses;
import com.app.pojos.DailyTest;
import com.app.pojos.Module;
import com.app.pojos.QuestionSet;
import com.app.pojos.Student;
import com.app.pojos.StudentResponse;
import com.app.pojos.StudentResponseId;
import com.app.pojos.TestId;
import com.app.utils.DataUtils;

@RequestMapping("/student")
@Controller
public class StudentController {

	@Autowired
	StudentDao studao;
	@Autowired
	CourseDao cdao;
	@Autowired
	TestDao tdao;
	
	@GetMapping("/register")
	public String getRegisterationForm(Model map)
	{
		map.addAttribute("student", new Student());
		return "student/stu_register";
	}
	
	@PostMapping("/register")
	public String registerStudent(@ModelAttribute Student student,Model map) throws NoSuchAlgorithmException, UnsupportedEncodingException
	{
		Student s = studao.getStudentByEmail(student.getEmail());
		System.out.println(s);
/*		System.out.println(s + "EMAIL"+s.getEmail());
*/		if(s!=null)
		{
			System.out.println("IN NULL");
			map.addAttribute("emailmsg","email aready exits");
			return "student/stu_register";
		}
		student.setPassword(DataUtils.generateHash(student.getPassword()));
		DataUtils.sendEmail(student.getEmail());
		if(studao.registerStudent(student))
		{
			map.addAttribute("student",student);
			return "student/emailconfirm";
		}
		else
		{
			return "student/stu_register";
		}
	}
	
	@GetMapping("/activateaccount")
	public String activateAccount(@RequestParam String email,HttpSession sess)
	{
		/*System.out.println(sess.getAttribute("student"));
		if(sess.getAttribute("student")==null)
		{
			return "redirect: login";
		}S*/
		System.out.println("IN ACTIVATE ACCOUNT");
		System.out.println("In Activate Account"+ "Email = "+email);
		studao.activateAccount(email);
		return "redirect: login";
	}
	
	@GetMapping("/login")
	public String getLogin(Model map,HttpSession sess)
	{
		if(sess.getAttribute("student")!=null)
		{
			return "redirect: profile";
		}
		
		map.addAttribute("student", new Student());
		return "student/login";
	}
	
	@PostMapping("/login")
	public String validateLogin(@ModelAttribute Student student,Model map,HttpSession sess) throws NoSuchAlgorithmException, UnsupportedEncodingException
	{
		if(studao.validateLogin(student.getEmail(), DataUtils.generateHash(student.getPassword())))
		{
			if(studao.getStudentByEmail(student.getEmail()).isAccstatus()==false)
			{
				map.addAttribute("errormessage","Account Not Activated");
				return "student/login";
			}
			sess.setAttribute("student", studao.getStudentByEmail(student.getEmail()));
			return "redirect: profile";
		}
		else
		{
			map.addAttribute("errormessage", "Invalid username or password");
			map.addAttribute("student", new Student());
			return "student/login";
		}
	}
	
	@GetMapping("/profilecomplete")
	public String getProfileCompletion(Model map,HttpSession sess)
	{
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
			map.addAttribute("student", sess.getAttribute("student"));
			return "student/profilecomplete";
		
		
	}
	
	@PostMapping("/profilecomplete")
	public String completeProfile(@ModelAttribute Student student,HttpSession sess)
	{
		System.out.println("IN POST");
		System.out.println(student);
		studao.updateProfile(student);
		sess.setAttribute("profileerrmsg", "");
		return "student/profile";
	}
	
	@GetMapping("/todaystask")
	public String getTask(Model map,HttpSession sess)
	{
		/*List<Chapter> chaps = new ArrayList<>();
		for(Object[] x:studao.getChap(1))
		{
			Chapter c = new Chapter();
			c.setChapterid((int)x[0]);
			c.setChaptername((String) x[1]);
			c.setDescription( (String) x[2]);
			c.setWebsitelinks((String)x[3]);
			c.setYoutubelinks((String)x[4]);
			c.setModuleid(cdao.getModuleById((int)x[5]));
			c.setTestid(tdao.getTestById((int)x[6]));
			chaps.add(c);
		}
		sess.setAttribute("task", chaps);*/
		
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
	List<Chapter> chaps = studao.getChaptersNative(((Student)sess.getAttribute("student")).getRegno());
	sess.setAttribute("task", chaps);
	for(Chapter c:chaps)
		System.out.println(c.getTestid().getTestid());
		return "student/task";
	}
	
	@GetMapping("/course")
	public String getCoursePage(Model map,HttpSession sess)
	{
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
		map.addAttribute("courses",cdao.getCourses());
		return "student/courses";
	}
	
	@GetMapping("/registerCourse")
	public String registerStudentToCourse(@RequestParam int courseid,HttpSession sess,Model map)
	{
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
		
		Student s = studao.getStudentByEmail(((Student)sess.getAttribute("student")).getEmail());
		/*System.out.println(s + "++++++"+s.getCourse());*/
		if(s.isProfilecompleted()==false)
		{
			sess.setAttribute("profileerrmsg", "You have not completed your profile.You have to complete profile before registering to any course");
			return "redirect: profile";
		}
		if(s.getCourse() != null)
		{
			sess.setAttribute("regcou", "You have already Registered to course.You need to complete current course before starting new course");
			return "redirect: profile";
		}
		
		Courses c = cdao.getCourseById(courseid);
		studao.registerWithCourse(s.getRegno(), c);
		
		cdao.registerStudentToCourse(studao.getStudentById(s.getRegno()), c.getCourseid());
		
	Student s2=	studao.getStudentByEmail(s.getEmail());
	
	
	sess.setAttribute("student",s2);
		
		
	
		return "redirect: profile";
	}
	
	@GetMapping("/profile")
	public String getProfile(HttpSession sess)
	{
		System.out.println(sess.getAttribute("student"));
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
		Student s=(Student)sess.getAttribute("student");
		sess.setAttribute("test_id", studao.getTestNumber(s.getRegno()));

		return "student/profile";
	}
	
	@GetMapping("/taskcomplete")
	public String scheduleTest(@RequestParam int testid,HttpSession sess)
	{
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
		
		sess.setAttribute("testwarnmsg", "Your Test has been scheduled.Please visit Today's Test and give the Test.You will not be able to proceed further without giving test");
		Student s2=(Student)sess.getAttribute("student");
		try
		{
		if(studao.getTestStatus(s2.getRegno(), testid)==1)
		{
			sess.setAttribute("test_id", testid+1);
			sess.setAttribute("question", null);
		}
		}
		catch(Exception e)
		{
			
		}
		sess.setAttribute("test_id", testid);
		
		sess.setAttribute("questions", studao.getQuesionsByTestId(testid));
		return "redirect: profile";
	}
	
	@GetMapping("/todaystest")
	public String giveTest(Model map,HttpSession sess)
	{
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
		int testid=(int)sess.getAttribute("test_id");
		Student s2=(Student)sess.getAttribute("student");
		
			
		map.addAttribute("studentres", new StudentResponse());
		return "student/test";
	}
	
	@PostMapping("/saveresponse")
	public String saveStudentResponse(HttpSession sess,HttpServletRequest req)
	{
		
		for(int i=1;i<=10;i++)
		{
			studao.saveStudentResponse(req.getParameter("question"+i+"_option"), Integer.parseInt(req.getParameter("qid"+i)),Integer.parseInt(req.getParameter("regno")));
		}
		studao.updateMarks(((Student)sess.getAttribute("student")).getRegno(), (int)sess.getAttribute("test_id"));
		sess.setAttribute("testwarnmsg", "");
/*		sess.setAttribute("testres");
*/		int testid=(int)sess.getAttribute("test_id");
Student s2=(Student)sess.getAttribute("student");
		try {
			if(studao.getTestStatus(s2.getRegno(), testid)!=0)
			{System.out.println("in if********************");
			sess.setAttribute("questions",null);
			 testid=(int)sess.getAttribute("test_id");
			 sess.setAttribute("test_id", testid+1);
			}}
					catch(Exception e)
					{
						
					}
				
		
		
		return "redirect:profile";
	}
	
	/*@GetMapping("/testMarks")
	public String testMarks(HttpSession sess)
	{
		System.out.println(sess.getAttribute("student")+" "+sess.getAttribute("questions"));
		studao.updateMarks(((Student)sess.getAttribute("student")).getRegno(), (int)sess.getAttribute("test_id"));
		return "redirect:profile";
	}*/
	
	@GetMapping("/logout")
	public String logout(HttpSession sess)
	{
		if(sess.getAttribute("student")==null)
		{
			return "redirect:/student/login";
		}
		sess.invalidate();
		return  "redirect: login";
	}
}
