package com.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.daos.CourseDao;
import com.app.daos.StudentDao;
import com.app.pojos.Courses;

@RequestMapping("/course")
@Controller
public class CourseController {

	@Autowired
	private CourseDao cdao;
	@Autowired
	private StudentDao studao;
	
	
	
	
}
