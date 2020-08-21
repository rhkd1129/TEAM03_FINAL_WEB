package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Omember;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class ObjectdiscriminationDao extends EgovAbstractMapper{
	private static final Logger LOGGER = LoggerFactory.getLogger(ObjectdiscriminationDao.class);

	public int insert(Omember omember) {
		int rows = insert("omember.insert",omember);
		return rows;
	}

	public List<Omember> selectAll(int pageNo, int rowsPerPage) {
		int startIndex = (pageNo-1) * rowsPerPage;
		Map<String, Integer> map = new HashMap<>();
		map.put("startIndex", startIndex);
		map.put("rowsPerPage", rowsPerPage);

		List<Omember> list = selectList("omember.selectAllByPage", map);
		return list;
	}

	public int count() {
		int totalRows = selectOne("omember.count");
		return totalRows;
	}
}
