<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% String path24 = request.getContextPath(); %>
<style>
    .pic_lst { clear:both; width: 1110px; margin: 0px auto; padding-top: 50px; }
    .pic_lst li { width: 340px; height: 242px; padding :40px; margin-left:30px; float:left;
        margin-top:50px; transition:0.4s; overflow:hidden; box-sizing: border-box; box-shadow:5px 5px 5px #999; }
    .pic_lst li:hover { margin-top: 20px; box-shadow:10px 10px 10px #999; }
    .pic_lst li a { display:block; width: 256px; height: 376px; margin: 11px;
        color:#fff; text-align: left; }
    .pic_lst li:first-child { background-color: #FFD966; border-radius: 50px; }
    .pic_lst li:nth-child(2) { background-color: #A9D18E; border-radius: 50px;}
    .pic_lst li:last-child { margin-right:0px; background-color:#9DC3E6; border-radius: 50px;}
    .pic_tit { font-size : 26px; text-shadow:0px 2px 7px rgba(0,0,0,0.12); font-weight:bold;}
    .pic_com {display: block; line-height: 1.2; position: relative; margin-top:10px; margin-bottom: 50px;}
    .pic_arrow { border : 2px solid #fff; border-radius: 50px; padding:10px; float: right; }
    #pic_a1:hover { background-color:#ffffff; color:#FFD966; transition: 0.7s; }
    #pic_a2:hover { background-color:#ffffff; color:#A9D18E; transition: 0.7s; }
    #pic_a3:hover { background-color:#ffffff; color:#9DC3E6; transition: 0.7s; }
</style>

<section class="page" id="page1">
    <div class="page_wrap">
        <ul class="pic_lst">
            <li class="item1">
                <a href="<%=path24 %>/lecture/lectures.jsp?target=초등">
                    <strong class="pic_tit">초등</strong>
                    <em class="pic_com">초등학생 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a1">이동하기 →</span>
                </a>
            </li>
            <li class="item2">
                <a href="<%=path24 %>/lecture/lectures.jsp?target=중등">
                    <strong class="pic_tit">중등</strong>
                    <em class="pic_com">중학생 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a2">이동하기 →</span>
                </a>
            </li>
            <li class="item3">
                <a href="<%=path24 %>/lecture/lectures.jsp?target=고등">
                    <strong class="pic_tit">고등</strong>
                    <em class="pic_com">고등학생 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a3">이동하기 →</span>
                </a>
            </li>
        </ul>
    </div>
</section>