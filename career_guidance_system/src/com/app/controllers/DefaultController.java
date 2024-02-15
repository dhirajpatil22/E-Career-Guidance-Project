package com.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.daos.CourseDao;

@Controller
public class DefaultController {
	
	@Autowired
	private CourseDao cdao;
	
	@GetMapping("/")
	public String preSetup(Model map)
	{
		map.addAttribute("courses", cdao.getCourses());
		return "index";
	}
}
