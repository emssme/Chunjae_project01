<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    String path42 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>국어 강사 소개</title>
    <%@ include file="../../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path42%>/google.css">
    <link rel="stylesheet" href="<%=path42%>/fonts.css">
    <link rel="stylesheet" href="<%=path42%>/login.css">


    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path42%>/common.css">
    <link rel="stylesheet" href="<%=path42%>/header.css">
    <link rel="stylesheet" href="<%=path42%>/footer.css">


    <style>
        /*breadcrumb*/
        .content_header {
            clear: both;
            width: 100%;
            height: 250px;
            background-image: url("/images/banner.jpg");
            background-repeat: no-repeat;
            background-position:center -300px;
            background-size: cover;
            margin-top: 40px;
        }

        .page_tit {
            font-size:48px;
            text-align: center;
            padding-top:1em;
            color:#fff;
            padding-bottom: 2.4rem;
            margin-left: 450px;
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

        /*contents*/
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 650px;
        }

        .contents{
            margin-top: 20px;
        }
        ul.list.row {
            width : 900px
        }
        .row{
            display: flex;
            flex-wrap: wrap;
            margin: auto;

        }
        div .card {
            margin: 25px auto;
        }

        .col-3 {
            width: 300px;
            height: 300px;
        }

        .card-text{
            height: 50px;
        }
        .card-body {
            height: 150px;
        }
        .btn {
            margin-top: 10px;
            background-color: #efef9b;
            color: #333;
            border: 1px solid #969696;
        }
        .card-img-top {
            height: 130px;
        }

    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <h2 class="page_tit"> 국어 강사 소개 </h2>
            </div>
        </div>
        <div class="container">
            <div class="box_wrap">
                <ul class="list row">
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path42%>/images/teacher04.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">윤국어</h5>
                                <p class="card-text">네 꿈에 날개를 달아 줄, 만점 국어의 시작과 끝~!</p>
                                <a href="#" class="btn btn-primary">강의 듣기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path42%>/images/teacher03.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">최국어 선생님</h5>
                                <p class="card-text">국어 영역 최선의 선택!</p>
                                <a href="#" class="btn btn-primary">강의 듣기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path42%>/images/teacher02.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">명국어 선생님</h5>
                                <p class="card-text">귀에 쏙쏙 들어와 마음을 움직이는, 쉽고 재밌는 국어!</p>
                                <a href="#" class="btn btn-primary">강의 듣기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path42%>/images/teacher01.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">남국어 선생님</h5>
                                <p class="card-text">9회말 2아웃, 한가운데 돌직구! 실력으로 꽉 찬 국어!</p>
                                <a href="#" class="btn btn-primary">강의 듣기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path42%>/images/teacher04.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">김국어 선생님</h5>
                                <p class="card-text">전문가와 함께 완성하는 국어 자신감!</p>
                                <a href="#" class="btn btn-primary">강의 듣기</a>
                            </div>
                        </div>
                    </li>
                    <li class="col-3">
                        <div class="card">
                            <img src="<%=path42%>/images/teacher03.png" class="card-img-top" alt="강의소개">
                            <div class="card-body">
                                <h5 class="card-title">곽국어 선생님</h5>
                                <p class="card-text">잠재력이 실력으로 변하는 시간! 키워줄게, 너의 국어 능력!</p>
                                <a href="#" class="btn btn-primary">강의 듣기</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../../footer.jsp" %>
    </footer>
</div>
</body>
</html>
