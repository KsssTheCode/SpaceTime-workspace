<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceTime</title>
<style>
      body * {
        box-sizing: border-box;
      }

      #reserveList_Host {
        width: 1000px;
        margin: 0 auto;
      }

      #reserveList_Host > div:nth-child(1) {
        font-size: 25px;
        font-weight: 800;
        margin-bottom: 20px;
      }

      #reserveList_Host > form {
        overflow: hidden;
        margin-bottom: 25px;
      }

      #reserveList_Host input {
        float: left;
        width: 80%;
        height: 40px;
        padding: 0 10px;
        outline: none;
        border: 1px solid lightgray;
        border-radius: 5px;
      }

      #reserveList_Host button {
        float: right;
        height: 40px;
        width: 150px;
        background-color: rgb(39, 123, 192);
        color: white;
        border-radius: 5px;
        border: none;
        font-size: 18px;
      }
      
      #hReserveTb th,
	   #hReserveTb td {
			text-align: center;
		}
      #hReserveTb img {
	 	  width: 30px;
		  height:30px;     	
      }

      /* 채팅방 모달 */
      #chattingModal .modal-content {
        width: 550px;
        margin: auto;
        border: none;
        border-radius: 10px;
        overflow: hidden;
      }

      #chattingModal .modal-header {
        background-color: rgb(39, 123, 192);
        text-align: center;
        color: white;
        font-size: 23px;
        border-bottom: none;
        display: block;
        padding: 10px;
      }

      #chattingModal .modal-body {
        height : 400px;
        padding: 15px 20px;
        background-color: #FBFACD;
        overflow: auto;
      }


	  #chatFooter {
	  	margin:0;
	  	padding:0;
	  	overflow: hidden;
	  }
	  #chatFooter>div {
	  margin:0;
	  padding:10px;
	  	overflow : hidden;
	  	width: 100%;
	  }
	  #chatFooter textarea {
	  width: 68%;
      height: 50px;
      border: 1px solid lightgray;
      outline: none;
      padding: 10px;
      resize: none;
      color: rgb(54, 54, 54);
      margin-right: 2%;
      font-size: 14px;
                  border-radius: 5px;
      
	  
	  }
	  #chatFooter button {
		  float:right;
		  margin:0;
		   width:30%;
		  height: 50px;
		  background-color:  rgb(253, 193, 55);
        font-size: 22px;
        font-weight: 600;
          color: white;
                 border-radius: 5px;
                 border:none;
	  }
	  #chatFooter button:hover {
          color: rgb(39, 123, 192);
	  }
	  

	  #chattingModal .sender {
	  	overflow: hidden;
	  	margin-bottom: 10px;
	  }
	   #chattingModal .sender>div {
	  	float:left;
	  }
	  
	  #chattingModal .sender>div:nth-child(1) {
	  	width: 10%;
	  }
	   #chattingModal .sender>div:nth-child(2) {
	  	width: 90%;
	  }
	  #chattingModal .sender img {
		  display: block;
		  margin: 20px auto 10px;
	 	  width: 30px;
		  height:30px;     	
	  }
	  #chattingModal .sender .sname {
	 	 font-size: 12px;
        font-weight: 500;
	  }
	  #chattingModal .sender .scontent-area {
	  	overflow: hidden;
	  
	  }
	  #chattingModal .sender .srealcontent {
		float:left;
	  	border-radius: 5px;
	  	padding:2px 5px;
	  	background-color: white;
	  	border:1px solid gray;
	  	max-width: 75%;
	  	word-break:break-all;
	  	position : relative;
	  	font-size: 15px;
        font-weight: 500;
	  }
	  
	  #chattingModal .sender .sdate {
	 	position : absolute;
	 	bottom : 0;
	 	right : -58px;
	    font-size: 10px;
        font-weight: 500;
        color: rgb(107, 107, 107);
	  
	  }
	  #chattingModal .receiver {
	  	  margin-bottom: 10px;
	  }
	  #chattingModal .receiver .rcontent-area {
	  	overflow: hidden;
	  }
	  #chattingModal .receiver .rrealcontent {
		float:right;
	  	border-radius: 5px;
	  	padding:2px 5px;
	  	background-color: white;
	  	border:1px solid gray;
	  	max-width: 75%;
	  	word-break:break-all;
	  	position : relative;
	  	font-size: 15px;
        font-weight: 500;
	  }
	  
	  #chattingModal .receiver .rdate {
	 	position : absolute;
	 	bottom : 0;
	 	left : -58px;
	    font-size: 10px;
        font-weight: 500;
        color: rgb(107, 107, 107);
	  }
	  
	
      /* -------------------------------------- */

    </style>
</head>
<body>
	<div class="wrap">		
	<jsp:include page="../common/hostHeader.jsp" />
	<div class="main">
	<div id="reserveList_Host">
      <div>나의 채팅방</div>
      <form action="schNote.me" method="get" id="revList_Search">
        <input
          type="search"
          name="keyword"
          placeholder="이름으로 검색"
          value="${keyowrd}"
        />
        <button type="submit">검색</button>
      </form>
      <table id="hReserveTb" class="table table-hover">
        <thead>
          <tr>
            <th>No</th>
            <th>보낸사람</th>
            <th>마지막메시지</th>
            <th>보낸일자</th>
          </tr>
        </thead>
        <tbody>
	        <c:choose>
		      <c:when test="${rList.size() eq 0}">
		      	<tr>
		      	<td colspan="4">수신 메시지가 없습니다.</td>
		      	</tr>
		      </c:when>
		      <c:otherwise>
		         <c:forEach var="r" items="${rList}" >
		         <tr onclick="chatModalOpen(this)">
		            <td>
		            <c:choose>
		            <c:when test="${empty r.profilePath }">
		            <img src='resources/images/logo.png' 	 >
		            </c:when>
		            <c:otherwise>
		            <img src="${r.profilePath}" class='rounded-circle'	 >
		            </c:otherwise>
		            </c:choose>		    
				    </td>
		            <td>${r.receiver }</td>
		            <td>${r.message}</td>
		            <td>${r.messageDate}</td>
		            <input type="hidden"  value="${r.sender }"> 
		          </tr>
		         </c:forEach>
		       </c:otherwise>
		       </c:choose>
	        </tbody>
      </table>     
    </div>

    <!-- 채팅방 Modal -->
    <div class="modal" id="chattingModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">채팅방</div>
          <!-- Modal body -->
          <div class="modal-body">
          </div>
          <!-- Modal footer -->
          <div id="chatFooter" class="modal-footer">
          		<div >
          			<textarea name="chatMsg"></textarea>
          			<button type="button" onclick="chatInsert(this)"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
          			<input type="hidden" name="sender"  > 
          		</div>
          </div>
        </div>
      </div>
    </div>
	
	</div>	
	<jsp:include page="../common/footer.jsp" />
	</div>
	<script>

	//챗 모달 오픈
    function chatModalOpen(tr) {
		
		$("#chattingModal .modal-header").text($(tr).children().eq(1).text());
		 $("#chattingModal .modal-body").attr("id","chatRoom"+$(tr).children("input").val());
		 $("#chatFooter input[name=sender]").val($(tr).children("input").val());
		
		$.ajax({
			url : "detailChat.me",
			data : {
				sender : $(tr).children("input").val(),
				receiver : ${loginMember.memNo}
			},
			success : result => {
				var str = "";
				var cList = result;
				for(var i in cList) {
					if(cList[i].sender == "${loginMember.memNo}") { // 내가 보낸 메시지일경우
						str+= "<div class='receiver'><div class='rcontent-area'>";
						str+= "<div class='rrealcontent'>"+cList[i].message+"<div class='rdate'>"+cList[i].messageDate+"</div></div></div></div>";
					}else { // 내가 받은경우
						str+= "<div class='sender'><div>";
						
						if(typeof cList[i].profilePath == "undefined") {
					    	  str+= "<img src='resources/images/logo.png' 	 >";
					      }else {
					    	  str+= "<img src='"+cList[i].profilePath+"' class='rounded-circle'	 >";
					      }
						str+= "</div><div class='sender-con'>";
						str+= "<div class='sname'>"+cList[i].receiver+"</div>";
						str+= "<div class='scontent-area'>";
						str+= "<div class='srealcontent'>"+cList[i].message+"<div class='sdate'>"+cList[i].messageDate+"</div></div></div></div></div>";
					}
				}
				$("#chattingModal .modal-body").html(str);
				
			},
			error : () => {
				console.log("통신 실패");
			}
	});
		
       $("#chattingModal").modal("show");
       $("#chattingModal .modal-body").scrollTop($("#chattingModal .modal-body")[0].scrollHeight);

    }
	$(function() {
		//챗창 엔터키 막기
		$("textarea[name=chatMsg]").keydown(function () {    
			 if (event.keyCode === 13 && $(this).val().trim() != "") {
				 if (!event.shiftKey) {
					 event.preventDefault();
					 $("#chatFooter button").click();
				 }
			 }
	    });
	});
	
	
	// 채팅 인서트
	chatInsert = btn => {
		var message = $(btn).prev().val();
		var sender = $(btn).next().val();
		console.log(message);
		console.log(sender);
		
		$.ajax({
			url : "insertChat.me",
			data : {
				message : message,
				sender : sender,
				receiver : ${loginMember.memNo}
			},
			success : result => {
				var str = "";
				str+= "<div class='receiver'><div class='rcontent-area'>";
				str+= "<div class='rrealcontent'>"+result.message+"<div class='rdate'>"+result.messageDate+"</div></div></div></div>";
				$("#chattingModal .modal-body").append(str);
				$("#chattingModal textarea[name=chatMsg]").val("");
				
			},
			error : () => {
				console.log("통신 실패");
			}
		});
	}
	
	
	</script>
</body>
</html>