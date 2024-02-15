package com.app.daos;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.TestId;

@Component
@Transactional
public class TestDaoImpl implements TestDao {

	@Autowired
	private SessionFactory factory;
	
	@Override
	public TestId getTestById(int id) {
		return factory.getCurrentSession().get(TestId.class, id);
	}

}
