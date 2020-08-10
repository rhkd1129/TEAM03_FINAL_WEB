package com.mycompany.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.BeforeOrder;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Comment;
import com.mycompany.project.model.Fnb;

import com.mycompany.project.model.OrderReceipt;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.CustomerService;


import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class CustomerDao extends EgovAbstractMapper{
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerDao.class);

	public void insert(Cmember cmember) {
		insert("cmember.insert", cmember);
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
		System.out.println(mid);
		System.out.println("1");
	}


	public Cmember selectByMid(String mid) {
		Cmember cmember = selectOne("cmember.selectByMid", mid);
		return cmember;
	}

	public String getSaltByMid(String mid) {
		String csalt = selectOne("cmember.getSaltByMid", mid);
		return csalt;
	}

	public void loginFailCount(String mid) {
		update("cmember.loginFailCount", mid);
		update("cmember.loginTryDate", mid);
	}

	public void updateLoginTryDate(String mid) {
		update("cmember.loginTryDate", mid);
	}

	public int getFailCountByMid(String mid) {
		int failCount = selectOne("cmember.getFailCountByMid", mid);
		return failCount;
	}

	public void loginLock(String mid) {
		update("cmember.loginLock", mid);
	}

	public String getLoginLockByMid(String mid) {
		String loginLock = selectOne("cmember.getLoginLockByMid", mid);
		return loginLock;
	}

	public String getLoginTryDateByMid(String mid) {
		String loginTryDate = selectOne("cmember.getLoginTryDate", mid);
		return loginTryDate;
	}

	public void resetLoginLock(String mid) {
		update("cmember.resetLoginLock", mid);
	}

	public void insertComment(Comment comment) {
		insert("comment.insert", comment);
	}

	public double averageRating(Comment comment) {
		double averageRating = selectOne("comment.averageRating", comment);
		return averageRating;
	}

	public List<Comment> reviewList(Comment comment) {
		List<Comment> reviewList = selectList("comment.selectAllByCno", comment);
		return reviewList;
	}

	public int countbytoday() {
		int todayRows = selectOne("cmember.countbytoday");
//		System.out.println("DAO todayRows : " + todayRows);
		return todayRows;
	}

	public int countbyyesterday() {
		int yesterdayRows = selectOne("cmember.countbyyesterday");
//		System.out.println("DAO yesterdayRows : " + yesterdayRows);
		return yesterdayRows;
	}

	public int countby2day() {
		int yesterday2Rows = selectOne("cmember.countby2day");
//		System.out.println("DAO yesterday2Rows : " + yesterday2Rows);
		return yesterday2Rows;
	}

	public int countby3day() {
		int yesterday3Rows = selectOne("cmember.countby3day");
//		System.out.println("DAO yesterday3Rows : " + yesterday3Rows);
		return yesterday3Rows;
	}

	public int countby4day() {
		int yesterday4Rows = selectOne("cmember.countby4day");
//		System.out.println("DAO yesterday4Rows : " + yesterday4Rows);
		return yesterday4Rows;
	}

	public int countby5day() {
		int yesterday5Rows = selectOne("cmember.countby5day");
//		System.out.println("DAO yesterday5Rows : " + yesterday5Rows);
		return yesterday5Rows;
	}

	public int countby6day() {
		int yesterday6Rows = selectOne("cmember.countby6day");
//		System.out.println("DAO yesterday6Rows : " + yesterday6Rows);
		return yesterday6Rows;
	}

	public int countby7day() {
		int yesterday7Rows = selectOne("cmember.countby7day");
//		System.out.println("DAO yesterday7Rows : " + yesterday7Rows);
		return yesterday7Rows;
	}

	public int countby8day() {
		int yesterday8Rows = selectOne("cmember.countby8day");
//		System.out.println("DAO yesterday8Rows : " + yesterday8Rows);
		return yesterday8Rows;
	}

	public int countby9day() {
		int yesterday9Rows = selectOne("cmember.countby9day");
//		System.out.println("DAO yesterday9Rows : " + yesterday9Rows);
		return yesterday9Rows;
	}

	public Fnb selectFnbByFno(int fno) {
		Fnb fnb = selectOne("fnb.selectByFno", fno);
		return fnb;
	}

	public void insertOrderTable(BeforeOrder beforeOrder) {
		insert("beforeOrder.insertOrderTable", beforeOrder);
	}

	public List<BeforeOrder> selectOrderTableByBmid(String bmid) {
		List<BeforeOrder> list = selectList("beforeOrder.selecOrderTable", bmid);
		return list;
	}

	public void insertOrderTable(int bno) {
		delete("beforeOrder.deleteOrderTable", bno);
	}

	public void insertOrder(OrderReceipt orderReceipt) {
		insert("orderReceipt.insertOrder", orderReceipt);
	}

	public int selectOnobyOmid(String omid) {
		int ono = selectOne("orderReceipt.selectOnobyOmid", omid);
		return ono;
	}

	public void udateOnoAtBo(int ono, String omid) {
		LOGGER.info("실행");
		LOGGER.info(""+ono);
		LOGGER.info(omid);

		Map<String, Object> map = new HashMap<>();
		map.put("bono", ono);
		map.put("bmid", omid);

		update("beforeOrder.udateBonoAtBo", map);
	}

	public String selectRtitleByRno(int rno) {
		Rmember rmember = selectOne("rmember.selectByRno", rno);
		return rmember.getRtitle();
	}


}
