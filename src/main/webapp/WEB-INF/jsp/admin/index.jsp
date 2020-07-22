<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="sms.SMS" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.css">
   <title>SMS 프로젝트</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
   	<div class="container">
    <form method="post" name="smsForm" action="smssend.do">
    	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
    		<thead>
    			<tr>
    				<td style="text-align: center;">문자 전송 양식</td>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td>
      					<textarea class="form-control" maxlength="45" name="msg" style="width:1100px; height: 300px;" placeholder="보낼 내용"></textarea>
    				</td>
    			</tr>    	
    			<tr>
    				<td>
						<input class="form-control" type="text" name="rphone" placeholder="받는 번호">
    				</td>
    			</tr>  	
    			<tr>
    				<td>
						(받는 번호는 010-0000-0000과 같이 전체 번호로 작성해주세요.)
    				</td>
    			</tr>  	
    			<tr>
    				<td>
						남은 문자 잔여량 : <%= new SMS().getCount() %>
    				</td>
    			</tr>  	
    			<tr>
    				<td>
    					<input type="hidden" name="action" value="go">
				        <input type="hidden" name="sphone1" value="010">
				        <input type="hidden" name="sphone2" value="8832">
				        <input type="hidden" name="sphone3" value="7217">
				        <input class="btn btn-primary pull-right" type="submit" value="전송">
    				</td>
    			</tr>  	 									
    		</tbody>
    	</table>

    </form>
   	</div>
</body>
</html>
            