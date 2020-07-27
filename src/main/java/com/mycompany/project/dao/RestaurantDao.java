package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.project.model.Amember;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import com.mycompany.project.model.Rmember;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class RestaurantDao extends EgovAbstractMapper{
	private static final Logger LOGGER = LoggerFactory.getLogger(RestaurantDao.class);

	public int insert(Amember amember) {
		int arows = insert("amember.insert", amember);
		return arows;
	}

	public Rmember selectByRid(String rid) {
		Rmember rmember = selectOne("rmember.selectByRid", rid);
		return rmember;
	}

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

	public List<Rmember> selectByAddr(String siNm, String emdNm) {
		Map<String, String> map = new HashMap<>();
		map.put("siNm", siNm);
		map.put("emdNm", emdNm);
		List<Rmember> list = selectList("rmember.selectByAddr", map);
		LOGGER.info("실행");
		return list;
	}

}
