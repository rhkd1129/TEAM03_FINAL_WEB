<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   // 헤더에서 스마트폰 여부확인 후 리다이렉트
   String browser = request.getHeader("User-Agent");
   System.out.println(browser);
   boolean result = false;
   if (browser.indexOf("Android") > 0) {
      result = true;
   }else if (browser.indexOf("iPhone") > 0) {
      result = true;
   }
   if (result == true) { %>
      <c:redirect url="/customer/customer_mobile_main.do"/>
<%   }else{ %>
      <c:redirect url="/home/landingpage.do"/>
<%   }
%>