<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="com.chunjae.vo.Qna" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    String path10 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 답변 추가하기 </title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path10%>/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path10%>/common.css">
    <link rel="stylesheet" href="<%=path10%>/header.css">
    <link rel="stylesheet" href="<%=path10%>/footer.css">

    <style>
        /*배너*/
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
            position:relative;
            margin: 0px auto;
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

        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 80px 30px 30px 10px;
        }

        .tb1 {
            width: 90%;
            margin: 20px auto;
            text-align: center;
        }
        .tb1 td {
            border: 1px solid #333;
            border-collapse: collapse;
            padding: 20px;
        }
        .tb1 tr:last-child td {
            text-align: left;
            padding: 30px 0px 30px 25px;
        }
        .tb1 .label {
            width: 10%;
            background-color: #efef9b;
            color: #333;
        }
        .tb1 .label + td {
            width: 40%;
        }

        .tb2 {
            margin: 30px auto;
            width: 90%;
        }
        .tb2 tr td {
            position: relative;
            height: 55px;
            border: 1px solid #333;
        }
        .tb2 tr td:first-child {
            width: 10%;
            height: 55px;
            background-color: #efef9b;
            color: #333;
        }
        .tb2 tr:last-child td {
            border: none;
        }
        .tb2 tr td label {
            position: absolute;
            line-height: 100%;
            top: 50%;
            margin-top: -8px;
            left: 50%;
            margin-left: -15px;
        }
        .tb2 tr td input[type=text] {
            width: 98%;
            height: 100%;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 13pt;
            padding-left: 10px;
            border: none;
            outline: none;
        }
        .tb2 tr td textarea {
            width: 98.8%;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 13pt;
            padding-left: 10px;
            resize: none;
            border: none;
            outline: none;
        }
        .inbtn {
            display:block;
            float: right;
            border-radius:100px;
            border: none;
            min-width:140px;
            text-align: center;
            font-weight: bold;
            font-size: 15px;
            line-height: 48px;
            background-color: #efef9b;
            color:#333;
            margin: 50px 0px 100px 0px;
        }
    </style>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        ul, li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .board_title strong {
            font-size: 3rem;
        }

        .board_title p {
            margin-top: 5px;
            font-size: 1rem;
        }


        .board_list > div {
            border-bottom: 1px solid #ddd;
            font-size: 0;
            height: 60px;
        }

        .board_list > div:last-child {
            border-bottom: 1px solid #000;
        }

        .board_list > div > div {
            float: left;
            text-align: center;
            font-size: 1rem;
            line-height: 60px;
        }

        .board_list > div.top > div {
            font-weight: 600;
        }

        .board_list button {
            width: 90%;
            height: 100%;
            border-radius: 10px;
            background-color: #efef9b;
            border: 1px solid #efef9b;
            color: #fff;
            cursor: pointer;
        }

        .board_page a {
            display: inline-block;
            width: 32px;
            height: 32px;
            box-sizing: border-box;
            vertical-align: middle;
            border: 1px solid #ddd;
            border-left: 0;
            line-height: 32px;
        }

        .board_page a:first-child {
            border-left: 1px solid #ddd;
        }

    </style>

    <%
        int qno = request.getParameter("qno") != null ? Integer.parseInt(request.getParameter("qno")) : 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DBC con = new MariaDBCon();
        conn = con.connect();

        String sql = "SELECT qno, title, content, q.resdate, author FROM qna q, member b WHERE q.author = b.id AND qno = ?;";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, qno);
        rs = pstmt.executeQuery();

        Qna qna = new Qna();
        if(rs.next()) {
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setAuthor(rs.getString("author"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            qna.setResdate(sdf.format(d));
        }
        con.close(rs, pstmt, conn);
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
                <p><a href="<%=path10%>">Home</a> &gt; <a href="<%=path10%>/qnaList.jsp"> QnA </a> &gt; <span> 답변 추가하기 </span> </p>
                <h2 class="page_tit"> 관리자 페이지 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 질문 내용 </p>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <td class="label"> 작성자 </td>
                        <td> <%=qna.getAuthor()%> </td>
                        <td class="label"> 작성일 </td>
                        <td> <%=qna.getResdate()%> </td>
                    </tr>
                    <tr>
                        <td class="label"> 제목 </td>
                        <td colspan="3"> <%=qna.getTitle()%> </td>
                    </tr>
                    <tr>
                        <td colspan="4"> <%=qna.getContent()%> </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <section class="page" id="page2">
            <div class="page_wrap">
                <p class="content_tit"> 답변 작성 </p>
                <form action="addAnswerPro.jsp" method="post">
                    <table class="tb2">
                        <tbody>
                        <tr>
                            <td><label for="title"> 제목 </label></td>
                            <td><input type="text" name="title" id="title" required autofocus></td>
                        </tr>
                        <tr>
                            <td><label for="content"> 내용 </label></td>
                            <td><textarea rows="10" cols="80" name="content" id="content"></textarea></td>
                        </tr>
                        <tr>
                            <input type="hidden" name="par" id="par" value="<%=qna.getQno()%>">
                            <td colspan="2"><input type="submit" value="작성" class="inbtn"></td>
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