<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="com.chunjae.dto.Member" %>
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
    <title> 개인 정보 변경 </title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="../content_header.css">
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
        .contents {
            clear:both;
            min-height:100vh;
        }
        .contents::after {
            content:"";
            clear:both;
            display:block;
            width:100%;
        }

        .page {
            clear:both;
            width: 100%;
            min-height: 90vh;
            position:relative;
            top: 50px;
            margin: 0px auto;
            margin-top: 2px;
        }
        .page::after {
            content:"";
            display:block;
            width: 100%;
            clear:both;
        }

        .page_wrap {
            clear:both;
            width: 1000px;
            height: auto;
            margin:0 auto;
        }

        .tb1 {
            margin: 30px auto;
            width: 80%;
        }

        .tb1 tr td {
            height: 55px;
            line-height: 55px;
            text-align: center;
        }

        .tb1 tr td:first-child {
            width: 20%;
        }

        .tb1 tr td input {
            width: 95%;
            height: 85%;
            font-size: 13pt;
            padding-left: 10px;
        }

        .tb1 tr td:last-child {
            text-align: right;
        }

        .tb1 tr td .submit_btn {
            width: 200px;
            height: 100%;
            border-radius: 30px;
            margin-top: 20px;
            background-color: #8CB964;
            border: #8CB964;
            color: #fff;
            font-weight: bold;
        }
    </style>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DBC con = new MariaDBCon();
        conn = con.connect();
        String sql = "SELECT * FROM member WHERE id='admin'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        con.close(rs, pstmt, conn);

        Member member = new Member();
        if(rs.next()) {
            member.setId(rs.getString("id"));
            member.setPw(rs.getString("pw"));
            member.setName(rs.getString("name"));
            member.setEmail(rs.getString("email"));
            member.setTel(rs.getString("tel"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            member.setResdate(sdf.format(d));
        }
    %>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <a href=../admin/adminPage.jsp">관리자 페이지</a> &gt; <span> 관리자 정보 변경 </span> </p>
                <h2 class="page_tit"> 회원 정보 변경 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <form action="../admin/modifyInfopro.jsp" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <td><label for="id"> 아이디 </label> </td>
                            <td><input type="text" id="id" name="id" value="<%=member.getId()%>" readonly></td>
                        </tr>
                        <tr>
                            <td><label for="name"> 이름 </label></td>
                            <td><input type="text" id="name" name="name" value="<%=member.getName()%>" readonly></td>
                        </tr>
                        <tr>
                            <td><label for="email"> 이메일 </label></td>
                            <td><input type="text" id="email" name="email" value="<%=member.getEmail()%>" required></td>
                        </tr>
                        <tr>
                            <td><label for="tel"> 전화번호 </label></td>
                            <td><input type="tel" id="tel" name="tel" value="<%=member.getTel()%>"></td>
                        </tr>
                        <tr>
                            <td><label for="resdate"> 가입일 </label></td>
                            <td><input type="text" id="resdate" name="resdate" value="<%=member.getResdate()%>" readonly></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="정보 수정" class="submit_btn">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
    <script>
        <% if(sid == null || !sid.equals("admin")) { %>
        alert("관리자만 접근 가능한 페이지입니다.");
        history.go(-1);
        <% } %>
    </script>
</div>
</body>
</html>