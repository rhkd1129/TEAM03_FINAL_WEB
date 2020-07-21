package com.mycompany.project.dao;

import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Cmember;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class CustomerDao extends EgovAbstractMapper{
	
	public int insert(Cmember cmember) {
		int crows = insert("cmember.insert", cmember);
		return crows;
	}

}
