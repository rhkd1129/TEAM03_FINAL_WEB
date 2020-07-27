package com.mycompany.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.CustomerDao;
import com.mycompany.project.model.CloginForm;
import com.mycompany.project.model.Cmember;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDao customerDao;
	
	public static final int LOGIN_MID_FAIL = 0;
	public static final int LOGIN_MAPSSWORD_FAIL = 1;
	public static final int LOGIN_SUCCESS = 2;
	
	public int login(CloginForm cloginForm) {
		Cmember dbCmember = customerDao.selectByMid(cloginForm.getMid());
		if (dbCmember == null) {
			return LOGIN_MID_FAIL;
		} else {
			if (dbCmember.getMpassword().equals(cloginForm.getMpassword())) {
				return LOGIN_SUCCESS;
			} else {
				return LOGIN_MAPSSWORD_FAIL;
			}
		}
	}
	
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
	
	public Cmember getCmember(String mid) {
		Cmember cmember = customerDao.selectByMid(mid);
		return cmember;
	}

}
