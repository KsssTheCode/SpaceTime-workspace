<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!--  현재날짜가져오기  -->
<%
  String date = new java.text.SimpleDateFormat("yyyy. MM. dd").format(new java.util.Date());
  int today = Integer.parseInt(new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date()));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역 리스트</title>
<style>
      body * {
        box-sizing: border-box;
      }

      #spaceList_Host {
        width: 1200px;
        margin: 0 auto;
        margin-top: 50px;
      }

      .sheader {
        font-size: 25px;
        font-weight: 800;
        display: inline-block;
      }


      /* 페이지네이션 */
      .pagination {
        justify-content: center;
      }

      .pagination a {
        cursor: pointer;
        border: none;
        border-radius: 5px;
        padding: 5px 8px;
        background-color: #eeeeee;
        color: black;
      }

      .pagination a:hover {
        color: rgb(253, 193, 55);
        background-color: #e4e4e4;
        border-color: #ccc;
      }

      #active-page {
        background-color: rgb(253, 193, 55);
        color: white;
      }

      .page-btn {
        margin: 0 5px;
      }

      /* ---------- */
      /* 공간 리스트 */
      #space_area {
        overflow: hidden;
        margin-bottom: 40px;
      }

      #space_area > div {
        width: 31%;
        margin : 15px 10px;
        display: inline-block;
      }
/* 
      #space_area > div:nth-child(1) {
        float: left;
      }

      #space_area > div:nth-child(2) {
        float: left;
        margin-left: 3.5%;
      }

      #space_area > div:nth-child(3) {
        float: right;
      } */

      .space > div:nth-child(2) {
        padding: 15px 10px;
        font-size: 16px;
        font-weight: 600;
        color: rgb(68, 68, 68);
      }

      .space {
        width: 100%;
      }

      .img_area {
        position: relative;
        overflow: hidden;
        cursor: pointer;
      }

      .img_area .space_state {
        position: absolute;
        right: 0;
        top: 0;
        width: 70px;
        height: 30px;
        padding: 0;
        border: none;
        font-size: 15px;
        font-weight: 600;
      }

      .img_area .conok {
        background-color: rgb(253, 193, 55);
      }

      .img_area .conwait {
        background-color: rgb(224, 224, 224);
      }

      .img_area .conrefuse {
        background-color: rgb(231, 76, 60);
        color: white;
      }

      .img_area > img {
        width: 100%;
        height: 200px;
        background-size: cover;
        transition: transform 0.3s ease-in-out;
      }

      .img_btn_area {
        display: none;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
      }

      .button_img_prev,
      .button_img_next {
        width: 40px;
        height: 100%;
        border: none;
        background-color: rgba(0, 0, 0, 0.2);
      }

      .button_img_next {
        float: right;
      }

      .img_btn_area i {
        font-size: 30px;
        color: white;
      }

      .space .stitle {
        font-size: 20px;
        font-weight: 600;
        color: rgb(51, 51, 51);
      }

      .space hr {
        border: 1px solid rgb(112, 112, 112);
      }

      .space .sprice {
        float: right;
      }

      .space_btn_area button {
        float: left;
        height: 50px;
        color: white;
        border: none;
        font-size: 18px;
        font-weight: 500;
      }
      
      
      .btn-reserveList {
      	background-color : rgb(96, 155, 204);
      	border-radius: 0.25rem;
      	
      }

/*       .space_btn_area button:nth-child(1) {
        width: 0%; 
        background-color: rgb(39, 123, 192);
      }

      .space_btn_area button:nth-child(2) {
        width: 30%; 
        background-color: rgb(94, 94, 94);
      } */

      /* 공간 검수 반려 모달 */
      #refuse-info-Modal .modal-content {
        width: 600px;
        margin: auto;
        border: 1px solid gray;
        border-radius: 10px;
        overflow: hidden;
        margin-top: 100px;
      }

      #refuse-info-Modal .modal-header {
        background-color: rgb(231, 76, 60);
        text-align: center;
        color: white;
        font-size: 18px;
        border-bottom: none;
        display: block;
        padding: 10px;
        margin-bottom: 10px;
      }

      #refuse-info-Modal .modal-body {
        text-align: center;
        margin-top: 30px;
        padding: 10px 30px;
      }

      #refuse-info-Modal .modal-body > div:nth-child(1) {
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 20px;
      }

      #refuse-info-Modal .modal-body > div:nth-child(2) {
        font-size: 18px;
        font-weight: 600;
        color: rgb(11, 130, 208);

        margin-bottom: 20px;
      }

      #refuse-info-Modal .modal-footer {
        margin: 0 auto 20px;
        border: none;
      }

      #refuse-info-Modal button {
        color: white;
        width: 200px;
        height: 60px;
        margin: 0 10px;
        text-align: center;
        font-size: 18px;
        font-weight: 500;
        border-radius: 5px;
        border: none;
      }

      #refuse-info-Modal button:nth-child(1) {
        background-color: rgb(158, 158, 158);
      }

      #refuse-info-Modal button:nth-child(2) {
        background-color: rgb(253, 193, 55);
      }

      #refuse-info-Modal button:nth-child(1):hover {
        background-color: rgb(136, 136, 136);
        font-size: 20px;
        font-weight: 600;
      }

      #refuse-info-Modal button:nth-child(2):hover {
        background-color: rgb(255, 187, 27);
        font-size: 20px;
        font-weight: 600;
        color: black;
      }
      
      /* 검색필터  */
      .selectbox {
        position: relative;
        width: 200px;  /* 너비설정 */
        border: 1px solid #999;  /* 테두리 설정 */
        z-index: 1;
        display: inline-block;
      }
      
      .selectbox:before {  /* 화살표 대체 */
        content: "";
        position: absolute;
        top: 50%;
        right: 15px;
        width: 0;
        height: 0;
        margin-top: -1px;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-top: 5px solid #333;
      }
      
      .selectbox label {
        position: absolute;
        top: 1px;  /* 위치정렬 */ 
        left: 5px;  /* 위치정렬 */
        
        color: #999;  
        z-index: -1;  /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
      }
      
      .selectbox select {
        width: 100%; 
        height: auto;  /* 높이 초기화 */
        line-height: normal;  /* line-height 초기화 */
        font-family: inherit;  /* 폰트 상속 */
        border: 0;
        opacity: 0;  /* 숨기기 */
        filter:alpha(opacity=0);  /* IE8 숨기기 */
        -webkit-appearance: none; /* 네이티브 외형 감추기 */
        -moz-appearance: none;
        appearance: none;
      }
      .btn-sort {
        background-color : rgb(96, 155, 204);
      	border-radius: 0.25rem;
        cursor: pointer;
        border: none;
        color: white;
      }

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	
    <div id="spaceList_Host">
        <div class="sheader" style="padding-top: 100px;">
       		예약 내역 리스트 
        </div> 

        <br>
          
      <!--  정렬기준 드롭박스  -->
     <form action="myReserveSort.re" method="post">
     	<div align="right">
        <div class="selectbox" align="right">
          <label for="sort_select">정렬조건선택</label>
            <select id="sort_select" name="selectbox">
                <option selected>정렬조건선택</option>
                <option>예약대기</option>
                <option>예약취소</option>
                <option>예약확정</option>
                <option>이용완료</option>
                <option>예약반려</option> 
            </select>
        </div>
  
        <button type="submit" class="btn-sort">검색</button>
      </div>
     </form>
      
      
      <br>
			
			<!-- 드롭박스 선택시 드롭박스 값자동으로 바뀌게 -->
			<!-- 드롭박스 값 받아오기 -->
			<script>
				$(document).ready(function(){
					  var selectTarget = $('.selectbox select');
	
					 selectTarget.on('blur', function(){
					   $(this).parent().removeClass('focus');
					 });
	
					  selectTarget.change(function(){
					    var select_name = $(this).children('option:selected').text();
	
					  $(this).siblings('label').text(select_name);
					  });
					});
				
				
				
				$(document).ready(function() {
		      		$("#sort_select").change(function(){
		      			/* console.log("테스트 : " + $(this).val()); */
		      			var select = $(this).val();
		      		});
		      	});
			</script>

        
        
        <div id="space_area">
		<c:choose>
			<c:when test="${ empty list }">
				<div style="width:100%; display: block; text-align:center; margin: 80px 0px;">
					예약 내역이 없습니다
				</div>
			</c:when>
			<c:otherwise>
				          <c:forEach var="r" items="${ list }">
				          	    <!--  jstl 형변환 -->
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:formatDate var="now" value="${now}" pattern="yyyyMMdd" />
								<fmt:parseDate var="useDate" value="${r.useDate}" pattern="yyyyMMdd"/> <!-- String 을 Date 로 바꿈 -->
								<fmt:formatDate var="useDate1" value="${useDate}" pattern="yyyyMMdd"/> <!-- Date 를 뒤에 시분초 뺀 포맷으로 바꿈 -->
				          
            		            <div class="space">
				              <div class="img_area">
				                <img src="resources/images/space/space/${ r.attachmentRename }" alt="사진 없음" />
				                <div class="img_btn_area">
				                  <button type="button" class="button_img button_img_prev">
				                    <i class="fa fa-angle-left" aria-hidden="true"></i>
				                  </button>
				                  <button type="button" class="button_img button_img_next">
				                    <i class="fa fa-angle-right" aria-hidden="true"></i>
				                  </button>
				                </div>
				                <button class="space_state conwait" id="selectText" name="selectText">
				                    <c:choose>
				                		<c:when test="${ r.reserveStatus eq 'W' }">
				                			예약 대기 
				                		</c:when>
				                		<c:when test="${ r.reserveStatus eq 'Y'  and useDate1 > now }">
				                			예약 확정 
				                		</c:when>
				                		<c:when test="${ r.reserveStatus eq 'C' }">
				                			예약 취소
				                		</c:when>
				                		<c:when test="${ r.reserveStatus eq 'N' }">
				                			예약 반려
				                		</c:when>
				                		<c:otherwise>
				                			이용 완료 
				                		</c:otherwise>
				                		
				                	</c:choose>
				                </button>
				              </div>
				              <div>
				                <span class="stitle">${ r.memNo }</span> <input type="hidden" class="rnoInput" value="${ r.reserveNo }"/>
				                <hr />
				                ${ r.denyMessage }
				                <span class="sprice">${ r.price }</span>
				              </div>
				
				              <!--  jstl 형변환 -->
				              <fmt:parseNumber var = "parseDate" integerOnly = "true" type = "number" value = "${ r.useDate }" />
				
				              <c:set var="today" value="<%= today %>" /> 
							
								      <!-- ststus 가 'Y' 이고 사용일이 현재날짜를 지난 경우 -->
				              <c:choose>
				                <c:when test="${(r.reserveStatus eq 'Y') and (today gt parseDate)}">
				                  <div class="space_btn_area">
				                  <button style="width: 70%" class="btn btn-warning">리뷰 작성하기</button>
				                  <button style="width: 30%" class="btn btn-danger">신고하기</button>
				                </div>
				                </c:when>
				                <c:otherwise>
				                  <div class="space_btn_area">
				                    <button style="width: 100%;" class="btn-reserveList detailBtn" >예약내역 확인</button>
				                	<script>
						                	$(function() {
						                		$(".detailBtn").click(function() {
						                			/* console.log($(".rnoInput").val()); */
						                			location.href = "reserveDetail.re?rno=" + $(".rnoInput").val();
						                		});
						                	});
				                	</script>
				                
				                </div>
				                </c:otherwise>
				              </c:choose>              
				            </div>
          </c:forEach>

			</c:otherwise>
		</c:choose>











        </div>
        <script>
          $(function () {
            $(".img_area").mouseover(function () {
              $(this).children(".img_btn_area").show();
              $(this).children("img").css({ transform: "scale(1.1)" });
            });
            $(".img_area").mouseleave(function () {
              $(this).children(".img_btn_area").hide();
              $(this).children("img").css({ transform: "scale(1.0)" });
            });
          });
        </script>
  
  
  
  
  		<!-- 페이징처리 -->
  
<!--   
        <ul class="pagination">
          <li class="page-item no-page-prev"><a class="page-link">&lt;</a></li>
          <li class="page-item page-btn">
            <a id="active-page" class="page-link">1</a>
          </li>
          <li class="page-item page-btn"><a class="page-link">2</a></li>
          <li class="page-item page-btn"><a class="page-link">3</a></li>
          <li class="page-item no-page-next"><a class="page-link">&gt;</a></li>
        </ul>
         -->
        
        <div id="pagingArea">
                <ul class="pagination">
			      	<c:choose>
				   		<c:when test="${ pi.currentPage eq 1 }">
				   			<li class="page-item no-page-prev disabled"><a class="page-link">&lt;</a></li>
				   		</c:when>
				   		<c:otherwise>
				   			<li class="page-item"><a class="page-link" href="myReserve.re?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
				   		</c:otherwise>
				   	</c:choose>	       
				       <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				       	<li class="page-item page-btn"><a class="page-link" href="myReserve.re?cpage=${ p }">${ p }</a></li>
				       </c:forEach>
				       <c:choose>
				       	<c:when test="${ pi.currentPage eq pi.maxPage }">
				       		<li class="page-item no-page-next disabled"><a class="page-link" >&gt;</a></li>
				       	</c:when>
				       	<c:otherwise>
				      	 	<li class="page-item no-page-next"><a class="page-link" href="myReserve.re?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
				       	</c:otherwise>
				       </c:choose>	       
     			 </ul>
            </div>
        
        
        
      </div>
  
      <!-- 공간 검수 반려 확정 Modal -->
      <div class="modal" id="refuse-info-Modal">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">검수 반려</div>
            <!-- Modal body -->
            <div class="modal-body">
              <div>
                아래 사유로 검수가 반려되었습니다.<br />
                수정 후 재검수 신청을 해주시기 바랍니다.
              </div>
              <div>
                (반려 메시지)공간 고유 이름을 등록해주시고 블라 블라 블라 블라전체
              </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" onclick="">관리자 문의</button>
              <button type="button" onclick="">재검수 신청</button>
            </div>
          </div>
        </div>
      </div>
	
	<jsp:include page="../common/footer.jsp" />
	

	
</body>
</html>