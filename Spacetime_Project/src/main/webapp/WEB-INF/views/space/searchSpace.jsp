<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/searchSpace.css" rel="stylesheet"
	type="text/css" />
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mn7cwsrvym"></script>
	<script src="resources/js/map.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<div class="main">
			<div id="search_display">
				<!-- 목록 보기 -->
				<div id="spaceList">
					<div id="listOption">
						<div id="listOption_lineList"
							class="listOption_listStyle listOption_options">
							<img src="resources/images/space/listStyle.png">
						</div>
						<div id="listOption_picList"
							class="listOption_listStyle listOption_options">
							<img src="resources/images/space/picStyle.png">
						</div>
						<div id="test">click</div>
						<div id="listOption_filter" class="listOption_options">
							<img src="resources/images/space/filter.png">
						</div>
					</div>

					<form action="" method="get" id="mapFilter" style="display:none;">
						<div id="mapFilter_option_date">
							<div class="mapFilter_option_title">날짜</div>
							<div>
								<input type="date" class="mapFilter_options">
							</div>
						</div>
						<div>
							<div class="mapFilter_option_title">지역</div>
							<div>
								<select class="mapFilter_options">
									<option>강서양천구로영등포</option>
									<option>금천동작관악서초</option>
									<option>강남송파광진강동</option>
									<option>은평마포서대문종로</option>
									<option>성북강북도봉노원중랑</option>
									<option>용산중구성동동대문</option>
								</select>
							</div>
						</div>
						<div id="mapFilter_option_category">
							<div class="mapFilter_option_title">시설</div>
							<div id="mapFilter_category_list" class="mapFilter_options">
								<input type="checkbox" value="partyRoom">파티룸 <input
									type="checkbox" value="cafe">카페 <input type="checkbox"
									value="office">공유오피스 <input type="checkbox"
									value="hall">공연장 <input type="checkbox" value="studio">연습실<br>
								<input type="checkbox" value="kitchen">공유주방 <input
									type="checkbox" value="gallery">갤러리 <input
									type="checkbox" value="sports">운동시설 <input
									type="checkbox" value="studyRoom">스터디룸 <input
									type="checkbox" value="conferenceRoom">회의실
							</div>
						</div>
						<div id="mapFilter_option_price">
							<div class="mapFilter_option_title">가격</div>
							<div id="mapFilter_priceRange" class="mapFilter_options">
								최소 <input type="text" id="min_price">원 &nbsp;~&nbsp; 최대
								<input type="text" id="max_price">원
							</div>
						</div>
						<div id="mapFilter_btns">
							<button type="reset" class="mapFilter_btn">초기화</button>
							<button type="submit" class="mapFilter_btn">검색</button>
						</div>
					</form>
					
					<!-- 사진형 리스트 -->
					<div id="picList">
						<div class='picList_content'>
						   <div class='picList_content_pic'>이미지</div>
						   <div class='picList_content_spaceName'>상호명</div>
						   <div class='picList_content_price click_disable'>원 / 시간</div>
					   </div>
					</div>
					<!-- 게시판형 리스트 -->
					<div id="lineList" style="display: none;">
						<div class='lineList_content'>
						    <div class='lineList_content_spaceTitle'>상호명</div>
						    <div class='lineList_content_hashtag'></div>
						    <div class='lineList_content_extraInfo'>
							    <div class='lineList_content_price'>원 / 시간</div>
							    <div class='lineList_content_reviewCount'>리뷰갯수</div>
							    <div class='lineList_content_like'></div>
						    </div>
					    </div>
					</div>
				</div>
				<!-- 지도 -->
				<div id="map">
				</div>
				
				<script>
					var spaceListArr = [];
					var markers = [];
					var map, HOME_PATH;
					
					window.onload = () => {
						loadMap(map, HOME_PATH);
						selectList(map);
						loadList(spaceListArr);
						insertMarkers();
 					};
 					
 					//필터 Open-Close를 위한 전역변수
					var filterBtn = document.querySelector("#listOption_filter");
					var filter = document.querySelector("#mapFilter");
 					
					//게시판 형태 변환을 위한 전역변수(버튼)
					var lineListBtn = document.querySelector("#listOption_lineList");
					var picListBtn = document.querySelector("#listOption_picList");
					
					//불러온 데이터를 담아두기 위한 전역변수 (게시판형-사진형 전환에 필요)
					var picList = document.querySelector("#picList");
					var lineList = document.querySelector("#lineList");
					var picContent = picList.innerHTML;
					
					
					var test = document.querySelector("#test");
					test.onclick = () => {
						selectList(map);
						loadList(spaceListArr);
						updateMarkers();
					}
					
					//O
					picListBtn.onclick = () => {
						toPicList();
					}
					
					//O
					lineListBtn.onclick = () => {
						toLineList();
					}
					
					//O
					filterBtn.onclick = () => {
						console.log(filter);
						filterOpenClose();
					}
					
					picList.onclick = (e) => {
						var a = e.target.closest("#");
						var aValue = a.value;
						console.log(a);
						console.log(aValue);
						console.log(a.value);
					}
					
					lineList.onclick = (e) => {
						var a = e.target.closest(".picList_content");
						var aValue = a.value;
						console.log(a);
						console.log(aValue);
						console.log(a.value);
					}
					
					
				</script>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>