<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	textarea{
		font-family:'Malgun Gothic';
		text-shadow:4px 2px 3px black;
		font-size:1.7em;
		font-size: 30px;
		color:white;
		background: none;
	}
	th{
		text-shadow:4px 2px 3px black;
		background-color:rgba(0,0,0,0.1);
		font-size:1.7em;
		color: white;
	}
	td{
        text-shadow:4px 2px 3px black;
        background-color:rgba(0,0,0,0.3);
		font-size:1.7em;
		color: white;
	}
	#content{
		align-content: flex-start;
	}
	#fav {
		position:absolute;
	    transition: all 0.2s linear;
	  }
	#fav:hover {
	  transform: scale(1.1);
	}
	
	@-webkit-keyframes bounce {
    0%, 20%, 50%, 80%, 100% {-webkit-transform: translateY(0);}
    	80% {-webkit-transform: scale(1.5);}
	} 
	@keyframes bounce {
	    0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
	    20% {transform: scale(1.5);}
	} 
	
.bounce {
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
    -webkit-animation-name: bounce;
    animation-name: bounce;
}
	
html { 
  background: url('images/${ott.image}') no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  bgcolor="black"
}
textarea:focus{
    outline: none;
}
#more{
	font-size: 0.7em;
	text-shadow:4px 2px 3px red;
}
</style>
</head>
<body>
<div align="center">
	<a href="main.do?user_id=${fav.user_id}"><img alt="" src="images/back.png" style="float: left;" width="50px"></a>
	<h1 style="color: white">${ott.title}</h1>
	<hr>
	<input name="seq" type="hidden" value="${ott.id}"/>
	<table style="float: left; width: 600px;">
		<tr>
			<th width="150">장르</th>
			<td>${ott.genre}</td>
		</tr>
		<tr>
			<th width="150">감독</th>
			<td>${ott.director}</td>
		</tr>
		<tr>
			<th width="150">배우</th>
			<td>${ott.actor}</td>
		</tr>
		<tr>
			
			<th  width="150">내용</th>
			<td width="450"id="content" class="content">
			<textarea readonly="readonly"  rows="5" style=" width:90%; border:none; resize: none; overflow: hidden;">${ott.content} </textarea>
			<br><a id="more" style="cursor: pointer;" >(더보기)</a></td>
		</tr>
		<tr>
			<th width="150">스트리밍</th>
			<td>
				<c:choose>
					<c:when test="${ott.server == 'NETFLIX'}">
						<a href="https://www.netflix.com/kr/" target="_blank"><img alt="Netflix" src="images/Streaming/NetFlix.png" width="30px"></a>
					</c:when>
					<c:when test="${ott.server  == 'WAVVE'}">
						<a href="https://www.wavve.com/" target="_blank"><img alt="WAVVE" src="images/Streaming/wavve.jpg" width="30px"></a>
					</c:when>
					<c:when test="${ott.server  == 'WATCHA'}">
						<a href="https://watcha.com/" target="_blank"><img alt="WATCHA" src="images/Streaming/watcha.png" width="30px"></a>
					</c:when>
					<c:otherwise>
						${ott.server}
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th width="150">조회수</th>
			<td>${ott.cnt}</td>
		</tr>
		<tr>
			<th>
				<a id="favs" class="favs" style="text-decoration-line: none;">
					<img id="fav" alt="즐겨찾기 등록" src="images/Fav/noFav.png" width="100px" style="cursor: pointer;">
				</a>
			</th>
		</tr>
	</table>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/autosize.min.js"></script>
<script>
	$("#more").click(function(){
		if($("#more").html()=='(더보기)'){
			autosize($('textarea'));
			$("#more").html('닫기')
		} else {
			autosize.destroy($('textarea'));
			$("#more").html('(더보기)')
		}
	});
    $(document).ready(function () {
    	var content = "${ott.content}";
        var favval = ${Fav};
        if(content.length>=80){
        	console.log(content.length);
        } else{
        	$("#more").attr("hidden","");
        }
        if(favval>0) {
            console.log(favval);
            $("#fav").attr("src", "images/Fav/readyFav.png");
        }
        else {
            console.log(favval);
            $("#fav").attr("src", "images/Fav/noFav.png");
        }
        $("#fav").on("click", function (e) {
        		$.ajax({
		    	url :'fav.do',
		        type :'POST',
		        data : {'ott_id':${ott.id}, 'user_id':"${fav.user_id}"},
		    	success : function(data){
		    		tmp = data;
		        	if(data==1) {
		        		setTimeout(function(){ 
		        			$('#fav').attr("src","images/Fav/readyFav.png");
		        		}, 300);
		        	} else {
	        				$('#fav').attr("src","images/Fav/noFav.gif");
		        		setTimeout(function(){
	        				$('#fav').attr("src","images/Fav/noFav.png");
		        		}, 55);
		        	}
	           	}
		    });
        });
    });
    element = document.getElementById("fav");
   	element.addEventListener("click", function(e) {
   		e.preventDefault;
   		element.classList.remove("bounce");
   		element.offsetWidth = element.offsetWidth;
   		element.classList.add("bounce");
   	}, false);
</script>

</html>