package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Cmember;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class CustomerDao extends EgovAbstractMapper{
	
	public int insert(Cmember cmember) {
		int crows = insert("cmember.insert", cmember);
		return crows;
	}
	
	public List<Cmember> selectAll(int pageNo, int rowsPerPage) {
		int startIndex = (pageNo-1) * rowsPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);
		
		List<Cmember> list = selectList("cmember.selectAllByPage", map);
		
		return list;
	}	
	
	public int count() {
		int totalRows = selectOne("cmember.count");
		return totalRows;
	}
	
	public void deleteByMid(String mid) {
		delete("cmember.deleteByMid", mid);
	}

}
