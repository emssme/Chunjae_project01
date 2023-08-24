<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%-- 1. 필요한 라이브러리 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="com.chunjae.dto.Board" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    String path17 = request.getContextPath();
    //2. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>묻고 답하기 목록</title>
    <%@ include file="../head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path17%>/google.css">
    <link rel="stylesheet" href="<%=path17%>/fonts.css">
    <link rel="stylesheet" href="<%=path17%>/common.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path17%>/header.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-repeat: no-repeat; background-position:center -250px; height: 1100px; margin-top: 2px;}
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; height: auto; margin:0 auto; }
        .table {
            width: 1200px; margin: 0 auto; margin-top: 20px;
        }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .tb1 { width:800px; margin:50px auto; vertical-align: middle;}
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:#efef9b; color:#000; vertical-align: middle;}
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:65%; }
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #efef9b; color:#333; font-size: 18px; border: 1px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path17%>/footer.css">
    <style>
        .btn_group { clear:both; width:1200px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

    <style>
        /*
            콘텐츠 헤더
             */
        .content_header {
            clear: both;
            height: 250px;
            background-image: url("<%=path17%>/images/banner.jpg");
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

    <link rel="stylesheet" href="<%=path17%>/jquery.dataTables.css">
    <script src="<%=path17%>/jquery.dataTables.js"></script>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
                <div class="content_header">
                    <div class="breadcrumb">
                        <p><a href="/">Home</a> &gt; <span> 커뮤니티 </span> > <span> 자유 게시판 </span> </p>
                        <h2 class="page_tit"> 자유 게시판 </h2>
                    </div>
                </div>
                <div class="table">
                    <table class="tb1" id="myTable">
                        <thead>
                        <tr>
                            <th class="item1">글번호</th>
                            <th class="item2">글제목</th>
                            <th class="item3">작성자</th>
                            <th class="item4">작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                            int tot = boardList.size();
                            for(Board bd : boardList) {
                                Date d = ymd.parse(bd.getResdate());
                                String date = ymd.format(d);
                        %>
                        <tr>
                            <td class="item1"><%=tot %></td>
                            <td class="item2"><%=bd.getTitle()%></td>
                            <td class="item3"><%=bd.getAuthor()%></td>
                            <td class="item4"><%=date %></td>
                        </tr>
                        <%
                                tot--;
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order:[[0, "desc"]]
                        });
                    });
                </script>
                <div class="btn_group">
                    <br><hr><br>
                    <% if(sid!=null) { %>
                    <a href="<%=path17%>/board/addBoard.jsp" class="inbtn">글쓰기</a>
                    <% } else { %>
                    <p>로그인 한 사용자만 게시판의 글을 쓸 수 있습니다.<br>
                        로그인한 사용자만 글의 상세내용을 볼 수 있습니다.</p>
                    <% } %>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>
