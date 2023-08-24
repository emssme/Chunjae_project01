<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path3 = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path3%>/google.css">
    <link rel="stylesheet" href="<%=path3%>/fonts.css">
    <link rel="stylesheet" href="<%=path3%>/login.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="./jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="../css/lib/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="<%=path3%>/common.css">
    <link rel="stylesheet" href="<%=path3%>/header.css">
    <link rel="stylesheet" href="<%=path3%>/footer.css">

    <style>
        /*콘텐츠 헤더*/
        .content_header {
            clear: both;
            height: 250px;
            background-image: url("/images/banner.jpg");
            background-repeat: no-repeat;
            background-position:center -300px;
            background-size: cover;
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
    </style>

    <style>
        /*로그인*/
        .login-wrapper{
            text-align: center;
            width: 500px;
            border-radius: 10px;
            padding: 80px 50px;
            background-color: #eee;
            box-sizing: border-box;
            margin: 130px auto;
        }

        #login-form > input{
            width: 75%;
            height: 48px;
            padding: 0 10px;
            box-sizing: border-box;
            margin-bottom: 16px;
            border-radius: 6px;
            background-color: #F8F8F8;
        }

        #login-form > .container input {
            width: 75%;
            height: 48px;
            padding: 0 10px;
            box-sizing: border-box;
            margin-bottom: 16px;
            border-radius: 6px;
            background-color: #F8F8F8;
        }

        #login-form > input[type=button] {
            width: 75%;
            height: 24px;
            background-color: #efef9b;
            color: #333;
            margin-bottom: 10px;
        }
        #login-form > input::placeholder{
            color: #D2D2D2;
        }
        #login-form > input[type="submit"]{
            width: 75%;
            font-size: 16px;
            background-color: #efef9b;
            color: #333;
            margin-top: 10px;
        }
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
                <p><a href="/">Home</a> &gt; <span> 로그인 </span> </p>
                <h2 class="page_tit"> 로그인 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="login-wrapper">
                <h2 style="font-size: 20px">로그인 하시겠습니까?</h2>
                <br>
                <br>
                <form method="post" action="<%=path3%>/member/loginpro.jsp" id="login-form">
                    <input type="text" name="id" placeholder="아이디" autofocus required>
                    <div class="container">
                        <input type="password" id="pw" name="pw" placeholder="비밀번호" class="active" required>
                        <input type="button" id="showpw" class="showpw" value="비밀번호 확인하기">
                    </div>
                    <input type="submit" value="Login">
                </form>
                <script>
                    $(function(){
                        $('#showpw').on('click',function (){
                            $('#pw').toggleClass('active');
                            if ($('#pw').hasClass('active')){
                                $('#pw').prop('type','text');
                            } else {
                                $('#pw').prop('type','password');
                            }
                        });
                    });
                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>