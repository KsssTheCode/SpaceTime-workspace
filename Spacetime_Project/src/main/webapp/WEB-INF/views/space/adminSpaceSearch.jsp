<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 검색 결과</title>
<style>
        
    #header_container { height: 80px;}

    /* content 영역 */
    #content {
        margin-left: 25%;
        padding-bottom: 80px;
        width: 60%;
        min-width: 1000px;
        /* height: 100%; */
        /* min-height: 940px; */
        /* background-color: rgba(128, 128, 128, 0.1); */
    }

    /* 검색결과 제목 */
    #title {
        /* border: 1px solid blue; */
        margin: auto;
        margin-top: 80px;
        width: 100%;
    }

    /* 검색 폼 회색 배경 */
    #search {
        margin: auto;
        margin-top: 30px;
        padding: 40px;
        width: 100%;
        min-width: 600px;
        border-radius: 10px;
        background-color: rgb(235, 235, 235);
    }

    /* 검색창 */
    #searchForm {
        width: 70%;
        min-width: none;
    }
    
    /* 탭 메뉴 */
    #tab {
        margin: auto;
        margin-top: 40px;
        width: 100%;
        min-width: 600px;
    }
    
    /* 탭 내용(테이블) */
    .tab-content {
        width: 100%;
        min-width: 600px;
        margin-top: 20px;
    }

    /* 테이블 행 */
    .table>tbody>tr:hover {
        cursor: pointer;
        background-color: rgb(236, 236, 236);
        font-weight: bold;
    }
    thead th, tbody>tr {
        text-align: center;
    }

    
    /* 모달창에서 공간명 */
    .spTitle:hover {
        cursor: pointer;
        color: green;
    }
    
    /* 모달창에서 반려 메세지 */
    .DM {
        padding-top: 20px;
        padding-bottom: 5px;
        text-align: left;
    }

    /* 페이지 버튼 */
    .pagination {
        margin: auto;
        justify-content: center;
    }

    .pagination a {
        cursor: pointer;
        border: none;
        border-radius: 3px;
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

</style>
</head>
<body>

    <div class="wrap">
        <div id="header_container"><jsp:include page="../common/header.jsp" /></div>
        <jsp:include page="../common/adminNavi.jsp" />
        <div id="content">

            <!-- 검색결과 제목 -->
            <div align="left" id="title"><h3>공간 검색 결과</h3></div>
            
            <!-- 검색창 -->
            <div id="search">
                <form action="searchSp.ad" method="get">
                    <table align="center" id="searchForm">
                        <tr>
                            <td align="right">
                                <input type="hidden" name="currentPage" value="1">
                                <select name="condition" class="select_category form-control mb-2" style="width:70%;">
                                    <option value="spaceTitle">공간명</option>
                                    <option value="hostId">호스트ID</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="keyword" class="form-control mb-2 title" id="myInput" placeholder="검색어를 입력해주세요." value="${keyword}" required>
                            </td>
                            <td align="left">
                                <button type="submit" class="btn btn-secondary mb-2">검색</button>
                            </td> 
                        </tr>
                    </table>
                </form>
            </div>
        
            <c:if test="${ not empty condition }">
                <script>
                    $(function() {
                        $("#searchForm option[value=${ condition }]").attr("selected", true);
                    });
                </script>
            </c:if>
            
            <br><br>
            <!-- 컨텐츠 탭 -->
            <div class="tab-pane container active" id="all" align="right" value="all">
                <table class="table spaceList" style="table-layout:fixed;">
                    <thead>
                        <tr>
                            <th style="width:10%;">공간번호</th>
                            <th style="width:15%;">호스트ID</th>
                            <th style="width:45%;">공간명</th>
                            <th style="width:15%;">공간유형</th>
                            <th style="width:15%;">처리여부</th>
                        </tr>
                    </thead>
                    <tbody class="myTable">
                        <c:forEach var="s" items="${list}">
	                        <c:if test="${!empty list}">
	                            <tr data-toggle='modal' data-target='#checkSpace' id='changeStatus' class="staceTr">
	                                <td class='sno'>${s.spaceNo}</td>
	                                <td>${s.hostNo}</td>
	                                <td align='left' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>${s.spaceTitle}</td>
	                                <td>
	                                    <c:choose>
	                                        <c:when test="${s.stypeNo eq '1'}">
	                                            파티룸
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '2'}">
	                                            카페 
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '3'}">
	                                            공연장
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '4'}">
	                                            연습실 
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '5'}">
	                                            연습주방 
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '6'}">
	                                            갤러리 
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '7'}">
	                                            운동시설 
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '8'}">
	                                            스터디룸 	
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '9'}">
	                                            회의실 
	                                        </c:when>
	                                        <c:when test="${s.stypeNo eq '10'}">
	                                            촬영스튜디오
	                                        </c:when>
	                                    </c:choose>
	                                </td> 
	                                <td>
	                                    <c:choose>
	                                        <c:when test="${s.spaceStatus eq 'Y'}">
	                                            승인 
	                                        </c:when>
	                                        <c:when test="${s.spaceStatus eq 'N'}">
	                                            반려 
	                                        </c:when>
	                                        <c:when test="${s.spaceStatus eq 'W'}">
	                                            승인대기
	                                        </c:when>
	                                    </c:choose>
	                                </td>
	                                <input type="hidden" name="denyMessage" value="${s.denyMessage}">
	                            </tr>
	                        </c:if>
	                        <c:if test="${empty list}">
	                        	<tr class='spaceTr'>
	                                <td colspan="5" onclick='event.cancelBubble=true;'>결과가 존재하지 않습니다.</td>
	                            </tr>
	                        </c:if>
                        </c:forEach>
                    </tbody>
                </table>
                <br>
                
                <!-- 페이지 버튼 -->
                <div class="btnPage" align="center">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item no-page-prev disabled"><a class="page-link" href="#">&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item no-page-prev"><a class="page-link" href="searchSp.ad?currentPage=${pi.currentPage - 1}&condition=${condition}&keyword=${keyword}">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>
    
                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                            <li class="page-item page-btn"><a id="" class="page-link" href="searchSp.ad?currentPage=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
                        </c:forEach>
    
                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item no-page-next disabled"><a class="page-link" href="#">&gt;</a></li>        
                            </c:when>
                            <c:otherwise>
                                <li class="page-item no-page-next"><a class="page-link" href="searchSp.ad?currentPage=${pi.currentPage + 1}&condition=${condition}&keyword=${keyword}">&gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
                
    <!-- 검수 모달창으로 공간 번호 보내기 -->
    <script>
        $(".spaceList>tbody").on("click", "#changeStatus", function() {
            
            var spaceNo = $(this).children().eq(0).text();
            $(".modal-body .spno").val(spaceNo); 
            
            var spaceTitle = $(this).children().eq(2).text();
            $(".modal-body .spTitle").text(spaceTitle); 
            
            var spaceStatus = $(this).children().eq(4).text().trim();
            /* $(".modal-body .spStatus").text(spaceStatus); */
            
            var denyMessage = $(this).children().eq(5).val();
            $(".modal-body .DM").text(denyMessage);
            
            console.log(spaceStatus);
            
            if (spaceStatus == '승인대기') {
                $('#spaceStatusW').show();
                $('#spaceStatusY').hide();
                $('#spaceStatusN').hide();
                
            } else if(spaceStatus == '승인') {
                $('#spaceStatusY').show();
                $('#spaceStatusW').hide();
                $('#spaceStatusN').hide();
                
            } else if(spaceStatus == '반려') {
                $('#spaceStatusN').show();
                $('#spaceStatusW').hide();
                $('#spaceStatusY').hide();
                
            } 
        });

        /* 공간검수 모달창에서 공간명 클릭시 새탭으로 상세정보 확인하기 */
        $(function() {
            $("#spStatus").on("click",".spTitle", function() {
                
                var spaceNo = $(".spno").val();
                    
                console.log(spaceNo);
                window.open('detail.sp?sno=' + spaceNo,'', 'width=1400, height=1000, location=no, status=no, scrollbars=yes');
            });
        });
        
    </script>
                

    <!-- 공간검수 처리 모달창 -->
    <div class="modal fade" id="checkSpace">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">공간검수</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form id="spaceStatusForm" action="updateAdminSpace.ad" method="post">
                    <div class="modal-body">
                        <table style="width: 100%;">
                            <thead>
                                <tr id="spStatus">
                                    <input type="hidden" class="spno" name="spaceNo">
                                    <th style="width:50px; height: 50px;" align="left">공간명</th>
                                    <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" align="left" class="spTitle"></td>
                                </tr>
                            </thead>   
                            <!-- 승인대기일 때  -->
                            <tbody id="spaceStatusW">
                                <tr>
                                    <th rowspan="2" style="width:100px;">처리</th>
                                    <td class="form-group" align="left">
                                        <select name="spaceStatus" class="select_category form-control mb-2" style="width:50%;">
                                            <option value="W">승인대기</option>
                                            <option value="Y">승인</option>
                                            <option value="N">반려</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><textarea name="denyMessage" class="form-control mb-2" cols="20" rows="5" placeholder="반려 사유를 작성해주세요."></textarea></td>
                                    <td rowspan="2" align="right"><button type="submit" class="btn btn-sm btn-light">처리하기</button></td>
                                </tr>
                            </tbody>

                            <!-- 승인일 때 -->
                            <tbody id="spaceStatusY" style="display:none;">
                                <tr>
                                    <th style="width:100px;">처리</th>
                                    <td class="form-group spStatus" align="left" style="color: blue;">승인</td>
                                </tr>
                            </tbody>

                            <!-- 반려일 때 -->
                            <tbody id="spaceStatusN" style="display:none;">
                                <tr>
                                    <th rowspan="2" style="width:100px;">처리</th>
                                    <td class="form-group spStatus" align="left" style="color: red;">반려</td>
                                </tr>
                                <tr>
                                    <td class="DM"></td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </form> 
                    
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary spaceStatusBtn" data-dismiss="modal">확인</button>
                    <!-- 검수처리가 잘 되면 alert 창 띄우기! -->
                </div>
                
            </div>
        </div>
    </div>

</body>
</html>