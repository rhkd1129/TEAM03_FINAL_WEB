package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.project.model.Amember;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Fnb;
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




	public int Rcountbytoday() {
		int RtodayRows = selectOne("rmember.Rcountbytoday");
//		System.out.println("DAO RtodayRows : " + RtodayRows);
		return RtodayRows;
	}

	public int Rcountbyyesterday() {
		int RyesterdayRows = selectOne("rmember.Rcountbyyesterday");
//		System.out.println("DAO RyesterdayRows : " + RyesterdayRows);
		return RyesterdayRows;
	}

	public int Rcountby2day() {
		int Ryesterday2Rows = selectOne("rmember.Rcountby2day");
//		System.out.println("DAO Ryesterday2Rows : " + Ryesterday2Rows);
		return Ryesterday2Rows;
	}

	public int Rcountby3day() {
		int Ryesterday3Rows = selectOne("rmember.Rcountby3day");
//		System.out.println("DAO Ryesterday3Rows : " + Ryesterday3Rows);
		return Ryesterday3Rows;
	}

	public int Rcountby4day() {
		int Ryesterday4Rows = selectOne("rmember.Rcountby4day");
//		System.out.println("DAO Ryesterday4Rows : " + Ryesterday4Rows);
		return Ryesterday4Rows;
	}

	public int Rcountby5day() {
		int Ryesterday5Rows = selectOne("rmember.Rcountby5day");
//		System.out.println("DAO Ryesterday5Rows : " + Ryesterday5Rows);
		return Ryesterday5Rows;
	}

	public int Rcountby6day() {
		int Ryesterday6Rows = selectOne("rmember.Rcountby6day");
//		System.out.println("DAO Ryesterday6Rows : " + Ryesterday6Rows);
		return Ryesterday6Rows;
	}

	public int Rcountby7day() {
		int Ryesterday7Rows = selectOne("rmember.Rcountby7day");
//		System.out.println("DAO Ryesterday7Rows : " + Ryesterday7Rows);
		return Ryesterday7Rows;
	}

	public int Rcountby8day() {
		int Ryesterday8Rows = selectOne("rmember.Rcountby8day");
//		System.out.println("DAO Ryesterday8Rows : " + Ryesterday8Rows);
		return Ryesterday8Rows;
	}

	public int Rcountby9day() {
		int Ryesterday9Rows = selectOne("rmember.Rcountby9day");
//		System.out.println("DAO Ryesterday9Rows : " + Ryesterday9Rows);
		return Ryesterday9Rows;
	}




	public int selectRnoByRid(String rid) {
		int rno = selectOne("rmember.selectRnoByRid", rid);
		return rno;
	}

	public void insertNewMenu(Fnb fnb) {
		insert("fnb.insertNewMenu", fnb);
	}

	public List<Fnb> selectFoodListByFrno(int frno) {
		List<Fnb> list = selectList("fnb.selectFoodList", frno);
		return list;
	}

	public List<Fnb> selectBeverageListByFrno(int frno) {
		List<Fnb> list = selectList("fnb.selectBeverageList", frno);
		return list;
	}


}
