package com.mycompany.project.dao;

import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Amember;
import com.mycompany.project.model.Rmember;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class RestaurantDao extends EgovAbstractMapper{
	
	public int insert(Amember amember) {
		int arows = insert("amember.insert", amember);
		return arows;
	}

	public Rmember selectByRid(String rid) {
		Rmember rmember = selectOne("rmember.selectByRid", rid);
		return rmember;
	}

}
