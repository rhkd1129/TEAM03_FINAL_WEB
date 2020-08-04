<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
      <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
      <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
      <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mapcss.css">
   </head>
   <body>
      <h5 class="alert alert-success" style="text-align: center;">Manual 실험 페이지</h5>
      <div id="gomainpage">Manual 페이지 이동</div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   </body>
   <script type="text/javascript">
		/* 뒤로가기 */
		$("#gomainpage").click(function(){
		    location.href = "${pageContext.request.contextPath}/admin/mainviewbox6.do";
		}); 

   </script>
</html>