<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path42 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path42%>/css/google.css">
    <link rel="stylesheet" href="<%=path42%>/css/fonts.css">


    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="./jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="<%=path42%>/css/common.css">
    <link rel="stylesheet" href="<%=path42%>/css/header.css">
    <link rel="stylesheet" href="<%=path42%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path42%>/css/footer.css">
    <link rel="stylesheet" href="<%=path42%>/css/join.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
        <div class="contents" id="contents">
            <div class="content_header">
                <div class="breadcrumb">
                    <p><a href="<%=path42%>">Home</a> &gt; <span> 회원 가입 </span> </p>
                    <h2 class="page_tit"> 회원 가입 </h2>
                </div>
            </div>
            <section class="page" id="page1">
                <div class="join-wrapper">
                    <form name="frm1" action="<%=path42%>/member/joinpro.jsp" method="post" onsubmit="return inform(this)" >
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <div class="person">
                                    <label><input type="radio" name="per" id="student" value="1" checked>학생</label> &nbsp;&nbsp;
                                    <label><input type="radio" name="per" id="mother" value="2">학부모</label>
                                </div>
                            </tr>
                            <tr>
                                <th><label for="id">아이디</label></th>
                                <td>
                                    <input type="text" name="id" id="id" class="indata" required>
                                    <button type="button" id="ck_btn" class="inbtn" onclick="idcheck()">아이디 중복 체크</button>
                                    <input type="hidden" name="ck_item" id="ck_item" value="no">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw">비밀번호</label></th>
                                <td>
                                    <input type="password" name="pw" id="pw" class="indata" placeholder="8~20자리 영문+숫자+특수문자 조합" required>
                                    <input type="button" id="showpw1" class="inbtn" value="비밀번호 확인하기">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw2">비밀번호 확인</label></th>
                                <td>
                                    <input type="password" name="pw2" id="pw2" class="indata" require>
                                    <input type="button" id="showpw2" class="inbtn" value="비밀번호 확인하기">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="name">이름</label></th>
                                <td><input type="text" name="name" id="name" class="indata" required></td>
                            </tr>
                            <tr>
                                <th><label for="tel">전화번호</label></th>
                                <td><input type="tel" name="tel" id="tel" class="indata" required></td>
                            </tr>
                            <tr>
                                <th><label for="email">이메일</label></th>
                                <td><input type="email" name="email" id="email" class="indata" required></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="colspan">
                                    <input type="submit" value="회원 가입" class="inbtn2" >
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    <script>
                        function inform(frm){
                            var ck_item = frm.ck_item;
                            if(ck_item.value!="yes"){
                                alert("아이디 중복 검사를 진행하시기 바랍니다.");
                                frm.id.focus();
                                return false;
                            }
                            var pw = frm.pw.value;
                            var pw2 = frm.pw2.value;
                            if(pw!=pw2){
                                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                                return false;
                                frm.pw.focus;
                            }

                            //비밀번호 유효성 검사
                            var pw = $("#pw").val();
                            var num = pw.search(/[0-9]/g);
                            var eng = pw.search(/[a-z]/ig);
                            var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

                            if(pw.length < 8 || pw.length > 20){

                                alert("8자리 ~ 20자리 이내로 입력해주세요.");
                                return false;
                            }else if(pw.search(/\s/) != -1){
                                alert("비밀번호는 공백 없이 입력해주세요.");
                                return false;
                            }else if(num < 0 || eng < 0 || spe < 0 ){
                                alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
                                return false;
                            }else {
                                console.log("통과");
                                return true;
                            }

                        }

                        function idcheck(){
                            var child;
                            var id = document.getElementById("id");
                            if(id.value!="") {
                                child = window.open("idcheck.jsp?id="+id.value, "child", "width=250, height=100");
                                return;
                            } else {
                                alert("아이디 입력란에 아이디를 입력하고, 진행하시기 바랍니다.");
                                id.focus();
                                return;
                            }
                        }
                        $(function(){
                            $('#showpw1').on('click',function (){
                                $('#pw').toggleClass('active');
                                if ($('#pw').hasClass('active')){
                                    $('#pw').prop('type','text');
                                } else {
                                    $('#pw').prop('type','password');
                                }
                            });
                        });
                        $(function(){
                            $('#showpw2').on('click',function (){
                                $('#pw2').toggleClass('active');
                                if ($('#pw2').hasClass('active')){
                                    $('#pw2').prop('type','text');
                                } else {
                                    $('#pw2').prop('type','password');
                                }
                            });
                        });
                    </script>
                </div>
            </section>
        </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>