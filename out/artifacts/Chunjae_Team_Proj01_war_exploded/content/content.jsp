<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
String path49 = request.getContextPath();
%>
<link rel="stylesheet" href="<%=path49%>/css/content.css">
<div class="contents" id="contents">
    <figure class="vs">
        <ul class="img_box">
            <li class="item1 active">
                <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                <div class="bg_box"></div>
                <h2 class="vs_tit">학생들의 미래를 위한 교육<br>
                    콘에듀</h2>
            </li>
            <li class="item2">
                <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra" checked>
                <div class="bg_box"></div>
                <h2 class="vs_tit">최고의 교육을 경험하세요</h2>
            </li>
            <ul class="btn_box">
                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li> &nbsp;&nbsp;
                <li class="item2"><label for="vs_ra1" class="vs_btn"></label></li>
            </ul>
            <button type="button" class="play_btn"></button>
            <script>
                $(function(){
                    $(".btn_box li .vs_btn").click(function(){
                        var par = $(this).parents("li").index();
                        $(".img_box li").removeClass("active");
                        $(".img_box li").eq(par).addClass("active");
                        $(".btn_box li").removeClass("active");
                        $(".btn_box li").eq(par).addClass("active");
                    });
                    var sw = 1;
                    var int1 = setInterval(function(){
                        if(sw==1){
                            autoplay(1);
                            sw = 0;
                        } else {
                            autoplay(0);
                            sw = 1;
                        }
                    }, 4000);

                    function autoplay(n){
                        $(".img_box li").removeClass("active");
                        $(".img_box li").eq(n).addClass("active");
                        $(".btn_box li").removeClass("active");
                        $(".btn_box li").eq(n).addClass("active");
                    }

                    $(".play_btn").click(function(){
                        if($(this).hasClass("active")){
                            $(this).removeClass("active");
                            sw = 1;
                            int1 = setInterval(function(){
                                if(sw==1){
                                    autoplay(1);
                                    sw = 0;
                                } else {
                                    autoplay(0);
                                    sw = 1;
                                }
                            }, 3500);
                        } else {
                            $(this).addClass("active");
                            sw = 0;
                            clearInterval(int1);
                        }
                    });
                });
            </script>
        </ul>
    </figure>
</div>
</div>
</div>
