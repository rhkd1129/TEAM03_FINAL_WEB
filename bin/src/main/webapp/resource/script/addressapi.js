function getAddr(){
			// 적용예 (api 호출 전에 검색어 체크) 	
	if (!checkSearchedWord(document.form.keyword)) {
		return ;
	}

	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += '<div id="searchedaddress"><table>';
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += '<td id="eachaddress">';
		htmlStr += '<a href="/project/customer/customer_search.do?roadAddr=' + this.roadAddr 
		+ "&siNm=" + this.siNm
		+ "&emdNm=" + this.emdNm
		+ "&bdNm=" + this.bdNm 
		+ '">'+this.roadAddr+ " " +this.bdNm+"</a>";
		htmlStr += "</td>";
		htmlStr += "</tr>"; 
	});
	htmlStr += "</table></div>";
	$("#list").html(htmlStr);
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		getAddr(); //jsonp사용시 enter검색 
	} 
}

function mobilegetAddr(){
		// 적용예 (api 호출 전에 검색어 체크) 	
	if (!mobilecheckSearchedWord(document.form.keyword)) {
	return ;
	}

	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					mobilemakeListJson(jsonStr);
				}
			}
		}
		,error: function(xhr,status, error){
			alert("에러발생");
		}
	});
}

function mobilemakeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += '<div id="searchedaddress"><table>';
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += '<td id="eachaddress">';
		htmlStr += '<a href="/project/customer/customer_mobile_restaurantlist.do?roadAddr=' + this.roadAddr 
		+ "&siNm=" + this.siNm
		+ "&emdNm=" + this.emdNm
		+ "&bdNm=" + this.bdNm 
		+ '">'+this.roadAddr+ " " +this.bdNm+"</a>";
		htmlStr += "</td>";
		htmlStr += "</tr>"; 
	});
	htmlStr += "</table></div>";
	$("#list").html(htmlStr);
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function mobilecheckSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
		     		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}

function mobileenterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		mobilegetAddr(); //jsonp사용시 enter검색 
	} 
}