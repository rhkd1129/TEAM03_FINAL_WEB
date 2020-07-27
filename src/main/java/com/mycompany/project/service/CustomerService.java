package com.mycompany.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.CustomerDao;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Rmember;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDao customerDao;
	
	public void join(Cmember cmember) {
		customerDao.insert(cmember);
	}
	
	public List<Cmember> getList(int pageNo, int rowsPerPage) {
		List<Cmember> list = customerDao.selectAll(pageNo, rowsPerPage);	
		return list;
	}	
	
	public int getTotalAdboardNo() {
		int totalAdboardNo = customerDao.count();
		return totalAdboardNo;
	}
	
	public void deleteCMember(String mid) {
		customerDao.deleteByMid(mid);
		System.out.println("2");

	}

	

}
