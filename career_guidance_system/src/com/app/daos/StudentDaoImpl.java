package com.app.daos;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.Chapter;
import com.app.pojos.Courses;
import com.app.pojos.DailyTest;
import com.app.pojos.DailyTestId;
import com.app.pojos.QuestionSet;
import com.app.pojos.Student;
import com.app.pojos.StudentResponse;
import com.app.pojos.StudentResponseId;
import com.app.pojos.TestId;

import javassist.bytecode.annotation.IntegerMemberValue;

@Component
@Transactional
public class StudentDaoImpl implements StudentDao {

	@Autowired
	private SessionFactory factory;
	
	@Override
	public boolean registerStudent(Student s) {
	
		try{
		factory.getCurrentSession().save(s);
		return true;
		}
		catch(HibernateException e)
		{
		return false;
		}
	}
	
	@Override
	public Student getStudentByEmail(String email)
	{
		try{
				String sql = "select s from Student s where s.email=:em";
				return factory.getCurrentSession().createQuery(sql, Student.class).setParameter("em", email).getSingleResult();
		}
		catch(NoResultException e)
		{
			return null;
		}
	}
	
	@Override
	public boolean activateAccount(String email)
	{
		Student s = getStudentByEmail(email);
		s.setAccstatus(true);
		return true;
	}
	
	@Override
	public Student getStudentById(int id)
	{
		return factory.getCurrentSession().get(Student.class, id);
	}
	
	@Override
	public boolean registerWithCourse(int id, Courses c) {
		Student s = getStudentById(id);
		s.setCourse(c);
		return false;
	}

	@Override
	public List<Object[]> getChap(int rno) {
		StoredProcedureQuery query = factory.getCurrentSession()
			    .createStoredProcedureQuery("getDailyTest")
			    .registerStoredProcedureParameter(1, 
			        void.class, ParameterMode.REF_CURSOR)
			    .registerStoredProcedureParameter(2, 
			        Integer.class, ParameterMode.IN)
			    .setParameter(2, rno);
		return query.getResultList();
	}
	
	

	@Override
	public List<Chapter> getChaptersNative(int rno) {
		String sql = "select * from chapter where testid=:no";
		String sql1 = "select count(*) from dailytest where regno=:rno";
		BigInteger totaltests = (BigInteger) factory.getCurrentSession().createNativeQuery(sql1).setParameter("rno", rno).getSingleResult();
		System.out.println("BIGINT = "+totaltests+"INTVAL = "+totaltests);
		String sql2 = "select count(*) from dailytest where regno=:rno and ispass=false";
		BigInteger passedtests = (BigInteger) factory.getCurrentSession().createNativeQuery(sql2).setParameter("rno", rno).getSingleResult();
		int no = totaltests.intValue()- passedtests.intValue();
		System.out.println("NO = "+no);
		List<Chapter> cha = factory.getCurrentSession().createNativeQuery(sql, Chapter.class).setParameter("no",no+1).getResultList();
		for(Chapter c:cha)
			System.out.println("CHAPTER NAME"+c.getChaptername());
		return cha;
	}

	@Override
	public List<QuestionSet> getQuesionsByTestId(int tid) {
		String jpql = "select q from QuestionSet q where q.testid=:tid";
		return factory.getCurrentSession().createQuery(jpql, QuestionSet.class).setParameter("tid", getTestByTestId(tid)).getResultList();
	}

	@Override
	public TestId getTestByTestId(int tid) {
		return factory.getCurrentSession().createQuery("select t from TestId t where t.testid=:tid", TestId.class).setParameter("tid", tid).getSingleResult();
	}

	@Override
	public boolean validateLogin(String email,String password)
	{
		String sql = "select count(*) from Student s where s.email=:em and s.password=:pwd";
		long count = (long)factory.getCurrentSession().createQuery(sql).setParameter("em", email).setParameter("pwd", password).getSingleResult();
		if(count>0)
			return true;
		else
			return false;
	}
	
	@Override
	public DailyTest getTestResult(int regno) {
		
		DailyTest d=factory.getCurrentSession().createNativeQuery("select * from dailytest where regno=:reg",DailyTest.class).setParameter("reg", regno).getSingleResult();
		
		return d;
	}

	@Override
	public boolean updateProfile(Student s)
	{ s.setAccstatus(true);
		factory.getCurrentSession().update(s);
		Student s1 = factory.getCurrentSession().get(Student.class, s.getRegno());
		s1.setProfilecompleted(true);
		return true;
	}

	@Override
	public boolean updateMarks(int regno, int testid) {
		String jpql = "select count(*) from questionset q join studentresponse r on q.questionid=r.questionid and r.studentresponse=q.answer where testid=:tid and regno=:rno";
		BigInteger count = (BigInteger)factory.getCurrentSession().createNativeQuery(jpql).setParameter("tid", testid).setParameter("rno", regno).getSingleResult();
		System.out.println("***********MARKS***********"+count);
		DailyTest d = new DailyTest();
		boolean ispass = false;
		if(count.intValue() > 5)
			ispass=true;
		d.setMarksobtained(count.intValue());
		d.setTotalmarks(10);
		d.setDailytestid(new DailyTestId());
		d.getDailytestid().setStudent(getStudentById(regno));
		d.getDailytestid().setTestId(getTestByTestId(testid));
		
		d.setIspass(ispass);
		
		factory.getCurrentSession().saveOrUpdate(d);
		return true;
	}

	@Override
	public boolean saveStudentResponse(String sres,int qid,int regno) {
		
		
		StudentResponse s = new StudentResponse(new StudentResponseId(getQuestionById(qid), getStudentById(regno)),sres);
		//System.out.println("************************in save response***********"+factory.getCurrentSession().get(StudentResponse.class,s.getResponseid()));
		/*int n=factory.getCurrentSession().createNativeQuery("delete from studentresponse where regno=:regno and questionid=:qid").setParameter("regno", regno).setParameter("qid", qid).executeUpdate();
		if(n==1)
		{
			System.out.println("************dleted*******");
		}
		else
*/		factory.getCurrentSession().saveOrUpdate(s);
		return true;
	}
	
	@Override
	public QuestionSet getQuestionById(int id)
	{
		return factory.getCurrentSession().get(QuestionSet.class, id);
	}

	@Override
	public int getTestStatus(int regno, int testid)throws Exception {
		// TODO Auto-generated method stub
		
		DailyTest d=factory.getCurrentSession().createNativeQuery("select * from dailytest where regno=:reg and testid=:tid and ispass=true",DailyTest.class).setParameter("reg", regno).setParameter("tid",testid).getSingleResult();
		
		if(d.isIspass()==false)
		{
		return 0;
		}
		else
			return 1;
		}

	@Override
	public int getTestNumber(int regno) {
		// TODO Auto-generated method stub
		String sql2 = "select count(*) from dailytest where regno=:rno and ispass=true";
		
		BigInteger testid=(BigInteger)factory.getCurrentSession().createNativeQuery(sql2).setParameter("rno", regno).getSingleResult();
		
		int num=testid.intValue();
		
		return num+1;
	}
	 
}
