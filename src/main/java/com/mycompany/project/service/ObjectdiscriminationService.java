package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.ObjectdiscriminationDao;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Omember;


@Service
public class ObjectdiscriminationService {
	private static final Logger LOGGER = LoggerFactory.getLogger(ObjectdiscriminationService.class);

	@Autowired
	private ObjectdiscriminationDao objectdiscriminationDao;

	public void insert(Omember omember) {
		objectdiscriminationDao.insert(omember);
	}
	
	public List<Omember> getList(int pageNo, int rowsPerPage) {
		List<Omember> list = objectdiscriminationDao.selectAll(pageNo, rowsPerPage);
		return list;
	}
	
	public int getTotalAdboardNo() {
		int totalAdboardNo = objectdiscriminationDao.count();
		return totalAdboardNo;
	}
}
