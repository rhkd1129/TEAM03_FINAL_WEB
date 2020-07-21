package com.mycompany.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.CustomerDao;
import com.mycompany.project.model.Cmember;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDao customerDao;
	
	public void join(Cmember cmember) {
		customerDao.insert(cmember);
	}

}
