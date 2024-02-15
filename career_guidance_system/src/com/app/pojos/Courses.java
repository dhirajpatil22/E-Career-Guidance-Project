package com.app.pojos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
public class Courses {
	
	private String coursename;
	private Integer courseid;
	private String description;
	private String courseimg;
	public String getCourseimg() {
		return courseimg;
	}

	public void setCourseimg(String courseimg) {
		this.courseimg = courseimg;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	private List<Student> students = new ArrayList<>();
	private List<Module> modules = new ArrayList<>();
	
	@OneToMany(mappedBy="course",cascade=CascadeType.ALL)
	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Courses()
	{
		System.out.println("In def const Courses");
	}

	@OneToMany(mappedBy="course",cascade=CascadeType.ALL)
	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	@Column(length=100)
	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCourseid() {
		return courseid;
	}

	public void setCourseid(Integer courseid) {
		this.courseid = courseid;
	}

	
	@Override
	public String toString() {
		return "Courses [coursename=" + coursename + ", courseid=" + courseid /*", students=" + students + "]"*/;
	}

	public Courses(String coursename) {
		super();
		this.coursename = coursename;
	}
	
	public void registerStudent(Student s)
	{
		students.add(s);
		s.setCourse(this);
	}
	
	public void registerModule(Module m)
	{
		modules.add(m);
		m.setCourse(this);
	}
}
