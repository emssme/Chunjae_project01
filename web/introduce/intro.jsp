<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path33 = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../google.css">
    <link rel="stylesheet" href="../fonts.css">
    <link rel="stylesheet" href="../common.css">


    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="./jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="../footer.css">

    <style>
        /*콘텐츠 헤더*/
        .content_header {
            clear: both;
            height: 250px;
            background-image: url("/images/banner.jpg");
            background-repeat: no-repeat;
            background-position:center -300px;
            background-size: cover;
            margin-top: 2px;
        }

        .page_tit {
            font-size:48px;
            text-align: center;
            padding-top:1em;
            color:#fff;
            padding-bottom: 2.4rem;
        }

        .breadcrumb {
            clear:both;
            width:1200px;
            margin: 0 auto;
            text-align: right;
            color:#fff;
            padding-top: 28px;
            padding-bottom: 28px;
        }


        .breadcrumb a {
            color:#fff;
        }

        /*회사 소개*/
        .intro img {
            margin-bottom: 20px;
            width: 100%;
        }
    </style>

    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; }
        .contents::after { content:""; clear:both; display:block; width:100%; }


        .page { clear:both; width: 100vw; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }


        #page1 { background-color: #f1f2f1;
            background-position:15vw 63vh; background-repeat: no-repeat; }

        .pic_lst li { width: 380px; margin-right:26px; height: 400px; float:left;
            background-repeat: no-repeat; background-position:center center;
            filter:brightness(90%); margin-top:30px; transition:0.4s;
            box-shadow:12px 12px 12px #999; overflow:hidden;  }
        .pic_lst li:hover { filter:brightness(140%); margin-top: -10px; }
        .pic_lst li a { display:block; width: 358px; height: 376px; margin: 11px;
            border:1px solid #fff; color:#fff; }
        .pic_lst li:last-child { margin-right: 0; }
        .cate_lst li { border-top:1px solid #333; margin-left: 14px; margin-right: 14px;
            padding-top: 32px; height: 90px;  }
        .cate_tit li a { display:block; }

    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 회사 소개 </span> </p>
                <h2 class="page_tit"> 회사 소개 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="intro">
                <img src="<%=path33%>/images/intro.jpg" alt="회사소개" >
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>