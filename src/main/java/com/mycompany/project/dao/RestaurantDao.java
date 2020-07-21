package com.mycompany.project.dao;

import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Rmember;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class RestaurantDao extends EgovAbstractMapper{
	
	public int insert(Rmember rmember) {
		int rrows = insert("rmember.insert", rmember);
		return rrows;
	}

}
