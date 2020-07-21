package com.mycompany.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.OwnerDao;
import com.mycompany.project.model.Omember;

@Service
public class OwnerService {
	
	@Autowired
	private OwnerDao ownerDao;
	
	public void join(Omember omember) {
		ownerDao.insert(omember);
	}

}
