<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스레터 작성</title>
<style>
    /* content */
    /* div { border: 1px black solid; } */
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		/*height: 1450px;  */
        height: auto; /* 공지사항의 테이블이 클릭될 때마다 세로 길이에 영향을 끼쳐 자동으로 조절되게 바꿈 */
		display: flex;
	}
	
	#content>div { height: 100%; float: left; padding:100px 0px;}
	
	#content_1, #content_3 { width: 20%; }
	#content_2 { width: 60%; }
	
    /* --------------------------- */
    /* content_2 내용물 css */

    #text>p {
        border-bottom: 5px solid #277BC0;
        font-size: 35px;
        font-weight: bold;
    }

    #content_2>div>form>div {
        padding: 0px 20px; 
        font-size: 20px;
        margin: auto;
    }

    img {
        object-fit:cover;
    }

</style>
</head>
<body>
    <div class="wrap">
        <div id="header_area"><jsp:include page="../common/header.jsp" /></div>
        <div id="content">
            <div id="content_1"></div>
            
            <!--컨텐츠작성부분 -->
            <div id="content_2" style="height: 100%;">
                <div id="text" style="height: 100px; padding: 20px 20px;">
                    <p>뉴스레터 작성</p>
                </div>
                <div>
                    <form id="updateForm" method="post" action="insert.ne" enctype="multipart/form-data">
                        <div id="photo" style="height: 20%;">
                            <div>
                                <table width="100%">
                                    <tr>
                                        <th width="15%" height="60px">썸네일</th>
                                        <td width="85%"><input type="file" id="input-image" name="upfile" required></td>
                                    </tr>
                                </table>
                                
                            </div>
                            <div id="img_area" style="width: 100%; height: 100%;">
                                <img id="preview-image" style="width:100%; height:100%;">
                            </div>
                        </div>
                        <script>

                            function readImage(input) {

                                // 인풋 태그에 파일이 있는 경우
                                if(input.files && input.files[0]) {

                                    // 이미지 파일인지 검사 (생략)

                                    // FileReader 인스턴스 생성
                                    const reader = new FileReader();

                                    // 이미지가 로드가 된 경우
                                    reader.onload = e => {
                                        const previewImage = document.getElementById("preview-image")
                                        previewImage.src = e.target.result
                                    }

                                    // reader가 이미지 읽도록 하기
                                    reader.readAsDataURL(input.files[0]);
                                }
                            }

                            // input file에 change 이벤트 부여
                            const inputImage = document.getElementById("input-image")
                            inputImage.addEventListener("change", e => {
                                readImage(e.target);
                            })
                        </script>
                        <br clear="both">
                        <div style="height: 20%;">
                            <input type="text" class="form-control" name="newsTitle" required style="width: 100%;" placeholder="뉴스레터 제목을 짧게 적어주세요.">
                        </div>
                        <br>
                        <div style="height: 40%;">
                            <textarea name="newsCont" class="form-control" style="width: 100%; height: 100%; resize: none;"></textarea>
                        </div>
                        <br>
                        <div style="height: 20%; margin-top:30px;">
                            <table width="100%">
                                <tr>
                                    <th width="15%" height="60px">추천 키워드 1</th>
                                    <td width="85%"><input type="text" class="form-control" name="keyword" placeholder="파티룸, 연습실 등 해쉬태그 키워드를 적어주세요." required></td>
                                </tr>
                                <tr>
                                    <th height="60px">추천 키워드 2</th>
                                    <td><input type="text" class="form-control" name="keyword" placeholder="파티룸, 연습실 등 해쉬태그 키워드를 적어주세요." required></td>
                                </tr>
                                <tr>
                                    <th height="60px">추천 키워드 3</th>
                                    <td><input type="text" class="form-control" name="keyword" placeholder="파티룸, 연습실 등 해쉬태그 키워드를 적어주세요." required></td>
                                </tr>
                            </table>
                        </div>
                        <br>
                        <div align="center">
                            <button type="button" class="btn btn-secondary" style="width: 100px;" onclick="javascript:history.go(-1);">취소</button>
                            &nbsp;
                            <button type="submit" class="btn btn-primary" style="width: 100px; background-color: #277BC0;">작성</button>
                        </div>
                    </form>
                </div>

                <script>
                    $(document).ready(function () {
                        $('textarea').summernote({
                            placeholder: '뉴스레터 내용을 적어주세요.',
                            lang: "ko-KR",
                            height: 300,
                            minHeight: 300,
                            maxHeight: 300
                        });

                    });
                    
                </script>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>