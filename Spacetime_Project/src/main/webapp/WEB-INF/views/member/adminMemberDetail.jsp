<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세조회</title>
<style>

    /* 회원 상세조회 전체 영역 */
    #memProfile {
        /* border: 3px solid rgba(128, 128, 128, 0.2); */
        background-color: white;
        border-radius: 10px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        padding: 25px 0px 25px 0px;
        width: 35%;
        width: 650px;
        min-height: 570px;
    }

    /* 프로필 영역(사진, 정보, 탈퇴버튼 영역) */
    .mem_info {
        /* border: 1px solid red; */
        margin: auto;
        margin-top: 25px;
        width: 80%;
    }

    /* 프로필 사진 영역 */
    .mem_img {
        border: 2px solid rgba(128, 128, 128, 0.2);
        margin-bottom: 20px;
        border-radius: 100%;
        width: 100px;
        height: 100px;
    }

    /* 프로필사진, 닉네임 변경 아이콘 */
    .memEdit { vertical-align: -120%; }
    .memEdit:hover { cursor: pointer; }

    /* 회원등급.. 일단 border 줘서 구분해줬는데.. 어떻게 할지... */
    #memGrade { 
        border: 2px solid orange;
        border-radius: 5px;
        padding: 5px;
    }

    /* 프로필 정보 영역 */
    #mem_detail th, #mem_detail td { height: 50px; }
    #mem_detail {
        border-bottom: 2px solid lightgray;
        border-top: 2px solid lightgray;
        width: 100%; 
    }
    
    /* 비밀번호 변경, 운영공간, 운영공간 더보기 링크 ------------------------------------------------- 색 나중에 바꾸기 */
    .changePwd, .space, .showmore { color: green; }

    /* 운영공간이름 위아래 여백 */
    div.space { padding: 5px; }

    /* 탈퇴하기 */
    .delete { 
        margin-bottom: 25px;
        text-align: right;
        color: darkgray;
    }
    .showmore:hover, .changePwd:hover, .space:hover, .delete:hover {
        text-decoration: none;
        cursor: pointer;
    }

    /* 연락처 변경 모달창 */
    .modal-body .phone { 
        display: inline-block; 
        width: 100px;
    }

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="content">
    <jsp:include page="../common/adminNavi.jsp" />
        
        <!-- 회원 상세조회 -->
        <div id="memProfile">
                
            <!-- 프로필 사진, 닉네임 -->
            <div class="mem_info" align="center">
                <img src="../../../resources/images/profile_default.png" class="mem_img photo">
                <span class="memEdit"><a class="mamEdit" data-toggle="modal" data-target="#editModal"><i class="fa-solid fa-pencil"></i></a></span>
                <br>
                <div style="height:30px;"><b>김철수닉네임</b>&nbsp;&nbsp;<span id="memGrade">회원등급</span></div>
            </div>

            <!-- 프로필 정보 -->
            <div class="mem_info">
                <table id="mem_detail"> 
                    <tr>
                        <th>아이디</th>
                        <td colspan="2">kimkim</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td colspan="2">김철수 &nbsp;&nbsp;<span id="gender">[성별]</span></td>
                    </tr>
                    <tr>
                        <th>이메일</th> 
                        <td colspan="2">kcs123456@gmail.com</td>
                    </tr> 
                    <tr>
                        <th>연락처</th>
                        <td>010-1234-5678</td>
                        <td align="right"><button class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target="#editPhone">변경하기</button></td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td colspan="2">2022-10-10</td>
                    </tr> 
                    <tr>
                        <th>비밀번호</th> 
                        <td colspan="2"><a class="changePwd" data-toggle="modal" data-target="#editPwd">변경하기</a></td>
                    </tr> 

                    <!-- ===================================== 호스트만 보이기 ===================================== -->
                    <tr>
                        <th>정산 계좌</th>
                        <td>은행명 계좌번호 예금주이름</td>
                        <td align="right"><button class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target="#editAccount">변경하기</button></td>
                    </tr>
                    <tr>
                        <th>운영공간</th> 
                        <td class="space">
                            <div class="space"><a href="#" class="space">운영공간이름 1</a></div> 
                            <div class="space"><a href="#" class="space">운영공간이름 2</a></div>
                        </td>
                        <td align="right"><a href="" class="showmore">더보기</a></td>
                    </tr>
                    <!-- ===================================== 호스트만 보이기 ===================================== -->
                </table>
            </div> 
                
            <div class="mem_info delete"><a href="" class="delete">서비스 탈퇴하기</a></div>
                
        </div>
    </div>

    <!-- 프사, 닉네임 수정 모달창 -->
    <div class="modal fade" id="editModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">프로필 변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form action="" method="post">
                    <div class="modal-body">
                        <table>
                            <tr>
                                <th style="width:25%;">프로필 사진</th>
                                <td><img src="../../../resources/images/profile_default.png" class="mem_img photo"></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td style="height:70px;"><input type="file"></td>
                            </tr>
                            <tr>
                                <th>닉네임</th>
                                <td><input type="text" class="form-control mb-2" value="김철수닉네임"></td>
                                <!-- 닉네임 중복확인은 ajax 로!!!! -->
                            </tr>
                        </table>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-dismiss="modal">변경</button>
                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 연락처 수정 모달창 -->
    <div class="modal fade" id="editPhone">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">연락처 변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form action="" method="post">
                    <div class="modal-body">
                        <table>
                            <tr>
                                <th style="width:20%;">연락처</th>
                                <td><input type="text" class="form-control mb-2 phone">
                                    &nbsp;-&nbsp;<input type="text" class="form-control mb-2 phone">
                                    &nbsp;-&nbsp;<input type="text" class="form-control mb-2 phone">
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-dismiss="modal">변경</button>
                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 비밀번호 수정 모달창 -->
    <div class="modal fade" id="editPwd">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">비밀번호 변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form action="" method="post">
                    <div class="modal-body">
                        <table>
                            <tr>
                                <th style="width:40%;">현재 비밀번호</th>
                                <td><input type="password" class="form-control mb-2"></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호</th>
                                <td><input type="password" class="form-control mb-2"></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호 확인</th>
                                <td><input type="password" class="form-control mb-2"></td>
                            </tr>
                        </table>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-dismiss="modal">변경</button>
                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 정산계좌정보 수정 모달창 -->
    <div class="modal fade" id="editAccount">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">계좌 정보 변경</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form action="" method="post">
                    <div class="modal-body">
                        <table>
                            <tr>
                                <th style="width:30%;">은행명</th>
                                <td>
                                    <select name="" class="select_category form-control mb-2">
                                        <option value="All" selected>은행명</option>
                                        <option value="">KB국민은행</option>
                                        <option value="">신한은행</option>
                                        <option value="">IBK기업은행</option>
                                        <option value="">우리은행</option>
                                        <option value="">KEB하나은행</option>
                                        <option value="">SC제일은행</option>
                                        <option value="">NH농협</option>
                                        <option value="">새마을금고</option>
                                        <option value="">씨티은행</option>
                                        <option value="">한국산업은행</option>
                                        <option value="">케이뱅크</option>
                                        <option value="">카카오뱅크</option>
                                        <option value="">우체국</option>
                                        <option value="">수협은행</option>
                                        <option value="">KDB산업은행</option>
                                        <option value="">광주은행</option>
                                        <option value="">부산은행</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>계좌번호</th>
                                <td><input type="text" class="form-control mb-2" placeholder="- 없이 숫자만 입력"></td>
                            </tr>
                            <tr>
                                <th>예금주명</th>
                                <td><input type="text" class="form-control mb-2"></td>
                            </tr>
                        </table>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-dismiss="modal">변경</button>
                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>