package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.mycompany.project.model.Rmember;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class RestaurantDao extends EgovAbstractMapper{
	
	//레스토랑 가입 insert mapper 불러오기
	public int insert(Rmember rmember) {
		int rrows = insert("rmember.insert", rmember);
		return rrows;
	}
	
	//레스토랑 리스트 select mapper 불러오기
	public List<Rmember> selectAll(int pageNo1, int rowsPerPage1) {
		int startIndex1 = (pageNo1-1) * rowsPerPage1;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex1", startIndex1);
		map.put("rowsPerPage1", rowsPerPage1);
		
		List<Rmember> list = selectList("rmember.selectAllByPage", map);
		
		return list;
	}	
	
	//레스토랑 페이져 count mapper 불러오기
	public int count() {
		int totalRows = selectOne("rmember.count");
		return totalRows;
	}
	
	//레스토랑 명단 제명 delete mapper 불러오기
	public void deleteByRid(String rid) {
		delete("rmember.deleteByRid", rid);
		System.out.println(rid);
		System.out.println("1");
	}
	
}
