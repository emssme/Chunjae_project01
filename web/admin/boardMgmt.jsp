<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="com.chunjae.dto.Board" %>

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
    <title>커뮤니티 관리 </title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../common.css">
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
    </style>
    <style>
        /*Mgmt*/
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

        .board_list_wrap {
            width: 1000px;
            margin: 0px auto;
            padding-bottom: 150px;
        }


        .board_title strong {
            font-size: 3rem;
        }

        .board_title p {
            margin-top: 5px;
            font-size: 1rem;
        }

        .board_list {
            width: 100%;
            border-top: 2px solid #000;
        }

        .board_list > div {
            border-bottom: 1px solid #ddd;
            font-size: 0;
            height: 60px;
        }

        .board_list > div.top {
            border-bottom: 1px solid #999;
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
            background-color: #8CB964;
            border: 1px solid #8CB964;
            color: #fff;
            cursor: pointer;
        }

        .board_list .result {
            padding: 25px;
            text-align: center;
            font-size: 13pt;
        }

        .board_list .bno {
            width: 10%;
        }

        .board_list .title {
            width: 35%;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .board_list .author {
            width: 15%;
        }

        .board_list .resdate {
            width: 20%;
        }

        .board_list .modify {
            width: 10%;
            height: 30px;
        }

        .board_list .delete {
            width: 10%;
            height: 30px;
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
            margin: 0px auto;
            margin-top: 20px;
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
    </style>

    <%

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DBC con = new MariaDBCon();
        conn = con.connect();

        String sql = "select * from board order by bno desc";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        List<Board> boardList = new ArrayList<>();
        while(rs.next()) {
            Board Board = new Board();
            Board.setBno(rs.getInt("bno"));
            Board.setTitle(rs.getString("title"));
            Board.setAuthor(rs.getString("author"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            Board.setResdate(sdf.format(d));
            boardList.add(Board);
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
                <p><a href="/">Home</a> &gt; <a href=/admin/adminPage.jsp">관리자 페이지</a> &gt; <span> 학부모 커뮤니티 관리 </span> </p>
                <h2 class="page_tit"> 자유게시판 관리 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="bno"> 번호 </div>
                            <div class="title"> 제목 </div>
                            <div class="author"> 작성자 </div>
                            <div class="resdate"> 작성일 </div>
                            <div class="modify"> 수정 </div>
                            <div class="delete"> 삭제 </div>
                        </div>
                        <% for(Board Board : boardList) { %>
                        <div>
                            <div class="bno"> <%=Board.getBno()%> </div>
                            <div class="title"> <%=Board.getTitle()%> </div>
                            <div class="author"> <%=Board.getAuthor()%> </div>
                            <div class="resdate"> <%=Board.getResdate()%></div>
                            <div class="modify"><button onclick="javascript:location.href='../board/updateBoard.jsp?bno=<%=Board.getBno()%>'"> 수정 </button></div>
                            <div class="delete"><button onclick="javascript:location.href='../board/delBoard.jsp?bno=<%=Board.getBno()%>'"> 삭제 </button></div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>;
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