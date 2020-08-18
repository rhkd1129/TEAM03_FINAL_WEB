package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.project.model.Amember;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Fnb;
import com.mycompany.project.model.OrderReceipt;
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

	
	public List<Rmember> selectByAddr(String siNm, String emdNm) {
		Map<String, String> map = new HashMap<>();
		map.put("siNm", siNm);
		map.put("emdNm", emdNm);
		List<Rmember> list = selectList("rmember.selectByAddr", map);
		LOGGER.info("실행");
		return list;
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

	public Rmember selecRestaurantInfoByRno(int rno) {
		Rmember rmember = selectOne("rmember.selectByRno", rno);
		return rmember;
	}

	public List<OrderReceipt> selectOrderByOrno(int orno) {
		List<OrderReceipt> list = selectList("orderReceipt.selectOrderByOrno", orno);
		return list;
	}

	public void udateByTakeover(int ono) {
		update("orderReceipt.udateByTakeover", ono);
		
	}

	public List<OrderReceipt> selectProcessingByOrno(int orno) {
		List<OrderReceipt> list = selectList("orderReceipt.selectProcessingByOrno", orno);
		return list;
	}

	public void updateByComplete(int ono) {
		update("orderReceipt.updateByComplete", ono);
		
	}

}
