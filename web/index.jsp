<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레몬 에듀</title>
    <%@ include file="head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="google.css">
    <link rel="stylesheet" href="fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="header.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; }
        .contents::after { content:""; clear:both; display:block; width:100%; }
        .vs { clear:both; width:95%; min-height:400px;
            position:relative; overflow:hidden;  border-radius: 150px; margin: 0 auto;}
        .img_box { position:relative; width: 100%; height:600px; overflow:hidden; }
        .img_box li { visibility:hidden; opacity:0;  transition-duration:0.7s;
            transition-delay:0.1s;    width:100%; height:600px;  }
        .img_box li .bg_box { width:100vw; height:600px; background-repeat: no-repeat;
            background-position:center center; background-size:cover; position:absolute;
            left: 0; top: 0; z-index:5; }
        .img_box li.active .bg_box { z-index:6; }
        .img_box li.item1 .bg_box { background-image: url("./images/slidebanner.jpg"); }
        .img_box li.item2 .bg_box { background-image: url("./images/slidebanner2.jpg");}
        .img_box li .vs_tit { position:absolute; top:180px; left:100px; z-index:10;
            font-weight: 300; font-size: 60px; line-height: 1.3; }
        .img_box li .vs_tit strong { font-weight: 500; }

        .img_box li.active { visibility: visible; opacity: 1; }
        .vs_tit { font-size:60px; color:#fff; font-weight: bold}
        .btn_box li .vs_btn { display:block; width: 12px; height: 12px;
            background-color:rgba(255,255,255,0.8); border:2px solid #fff;
            position:absolute; top:100px; left: 100px; z-index:14; cursor:pointer;
            border-radius:50%; }
        .btn_box li.item2 .vs_btn { left: 132px; }
        .btn_box li.active .vs_btn { background-color: #fff; border:2px solid #333; }
        .vs_ra { display:none; }

        .play_btn { display:block; width: 12px; height: 12px; position:absolute;
            top:98px; left: 164px; z-index:14; cursor:pointer; color: #fff;
            border:0;  background-color: transparent; font-weight: 900; }
        .play_btn:after { content:"| |"; }
        .play_btn.active:after { content:"▶"; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1.75em; }

        #page1 { background-color: #f1f2f1;
            background-position:15vw 63vh; background-repeat: no-repeat; }

        .pic_lst { clear:both; width: 1200px; margin: 60px auto; }
        .pic_lst li { width: 380px; margin-right:26px; height: 400px; float:left;
            background-repeat: no-repeat; background-position:center center;
            filter:brightness(90%); margin-top:30px; transition:0.4s;
            box-shadow:12px 12px 12px #999; overflow:hidden;  }
        .pic_lst li:hover { filter:brightness(140%); margin-top: -10px; }
        .pic_lst li a { display:block; width: 358px; height: 376px; margin: 11px;
            border:1px solid #fff; color:#fff; }
        .pic_lst li:last-child { margin-right: 0; }
        .pic_lst li.item1 { background-image: url("./images/kor.jpg"); }
        .pic_lst li.item2 { background-image: url("./images/mat.jpg"); }
        .pic_lst li.item3 { background-image: url("./images/eng.jpg"); }
        .pic_com { padding-left: 20px; padding-top: 20px; font-size:34px; }
        .pic_tit { padding-left: 20px; padding-top: 20px; font-size:20px; }

        .cate_lst li { border-top:1px solid #333; margin-left: 14px; margin-right: 14px;
            padding-top: 32px; height: 90px;  }
        .cate_tit li a { display:block; }
        .sl-btn-box .btn { display:block; width: 48px; height: 48px; font-size:32px;
            color:#fff; background-color:#333; text-align: center; line-height: 48px;
            font-weight: 700; cursor:pointer; position:absolute; left:100px; }
    </style>

    <link rel="stylesheet" href="footer.css">
    <script>document.onkeydown = function() { return false; }</script>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <figure class="vs">
            <ul class="img_box">
                <li class="item1 active">
                    <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">비타민같은 필수적인 교육,<br>
                        <strong>레몬에듀와 함께</strong></h2>
                </li>
                <li class="item2">
                    <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">
                        <strong>한 슬라이스씩<br>성장하는 지식의 나무</strong>
                    </h2>
                </li>
            </ul>
            <ul class="btn_box">
                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
            </ul>
            <button type="button" class="play_btn"></button>
        </figure>
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
                }, 3500);

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
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">인기 강좌</h2>
                <ul class="pic_lst">
                    <li class="item1">
                        <a href="">
                            <p class="pic_com">국어</p>
                            <h3 class="pic_tit">김국어 선생님</h3>
                        </a>
                    </li>
                    <li class="item2">
                        <a href="">
                            <p class="pic_com">수학</p>
                            <h3 class="pic_tit">박수학 선생님</h3>
                        </a>
                    </li>
                    <li class="item3">
                        <a href="">
                            <p class="pic_com">영어</p>
                            <h3 class="pic_tit">최영어 선생님</h3>
                        </a>
                    </li>
                </ul>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="footer.jsp" %>
    </footer>
</div>
</body>
</html>