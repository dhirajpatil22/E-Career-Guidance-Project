package com.app.daos;
import java.util.List;

import com.app.pojos.*;

public interface StudentDao {
	public boolean registerStudent(Student s);
	public boolean updateProfile(Student s);
	public Student getStudentByEmail(String email);
	public boolean activateAccount(String email);
	public boolean validateLogin(String email,String password);
	public Student getStudentById(int id);
	public boolean registerWithCourse(int id,Courses c);
	public List<Object[]> getChap(int rno);
	public List<Chapter> getChaptersNative(int rno);
	public List<QuestionSet> getQuesionsByTestId(int tid);
	public TestId getTestByTestId(int tid);
	public boolean saveStudentResponse(String sres,int qid,int regno);
	public QuestionSet getQuestionById(int id);
	public boolean updateMarks(int regno,int testid);
	public DailyTest getTestResult(int regno);
	public int getTestStatus(int regno,int testid) throws Exception;
	public int getTestNumber(int regno); 
}

