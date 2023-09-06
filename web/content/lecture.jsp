<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path23 = request.getContextPath();
%>
<style>
    <!--추천 강의 목록 스타일 -->
    .box_tit { text-align: center; padding : 10px; margin-top:20px; margin-bottom : 20px;}
    .box_group { width: 992px; height : 250px; margin: 20px auto; }
    .box { float:left; display : block; width : 228px; height: 250px; margin : 10px; padding: 10px; transition: 0.3s; border: 1px solid #ddd; box-sizing: border-box; }
    .box:hover { box-shadow: 10px 10px 10px #aaa; }
    .image { padding-bottom:20px; }
    .image img { width: 100%; height: 130px; }
</style>

<section class="page" id="page2">
    <div class="page_wrap">
        <h2 class="page_tit"> 인기 강의 </h2>
        <p class="page_con"> 많은 학생들에게 사랑받은 인기 강의로 한 단계 더 성장해보세요 </p>
        <!--추천 강의 목록 박스(이미지,제목, 내용순)로 정렬-->
        <div class="box_group">
            <div class="box">
                <div class="image"><img src="<%=path23%>/images/math01.png" alt="수학Ⅰ 썸네일"></div>
                <div class="box_com">
                    <h4> [2024 수능] 수학Ⅰ </h4><br>
                    <p> 김이름 </p>
                </div>
            </div>
            <div class="box">
                <div class="image"><img src="<%=path23%>/images/math02.jpg" alt="수학Ⅱ 썸네일"></div>
                <div class="box_com">
                    <h4> [2024 수능] 수학Ⅱ </h4><br>
                    <p> 이하나 </p>
                </div>
            </div>
            <div class="box">
                <div class="image"><img src="<%=path23%>/images/english01.jpg"></div>
                <div class="box_com">
                    <h4> 영어구문 </h4><br>
                    <p> 박지영 </p>
                </div>
            </div>
            <div class="box">
                <div class="image"><img src="<%=path23%>/images/english02.jpg"></div>
                <div class="box_com">
                    <h4> 영어독해연습 </h4><br>
                    <p> 박지영 </p>
                </div>
            </div>
        </div>
    </div>
</section>
