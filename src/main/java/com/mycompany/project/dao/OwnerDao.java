package com.mycompany.project.dao;

import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Omember;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class OwnerDao extends EgovAbstractMapper{
	
	public int insert(Omember omember) {
		int orows = insert("omember.insert", omember);
		return orows;
	}

}
