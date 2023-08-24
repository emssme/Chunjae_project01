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
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 고객지원 관리 </title>
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

    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>

    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-repeat: no-repeat; background-position:center -250px; height: 1100px; margin-top: 2px;}
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; height: auto; margin:0 auto; }
        .table {
            width: 960px; margin: 0 auto; margin-top: 20px;
        }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .tb1 { width:960px; margin:50px auto; vertical-align: middle;}
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:#efef9b; color:#000; vertical-align: middle;}
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:50%; text-align: center}
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }
        .tb1 .item5 { width: 15%; }


        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #efef9b; color:#333; font-size: 18px; border: 1px solid #333; }
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

        //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
        String sql = "SELECT qno, title, author, q.resdate FROM qna q JOIN member m ON(q.author=m.id) WHERE par IN (SELECT par FROM qna GROUP BY par HAVING COUNT(par) < 2)";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        //4. 받아온 결과셋(ResultSet) 을 질문및답변 목록(qnaList)에 불러와 하나의 레코드씩 담기
        List<Qna> qnaList = new ArrayList<>();
        while(rs.next()){
            Qna qna = new Qna();
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setAuthor(rs.getString("author"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            qna.setResdate(sdf.format(d));
            qnaList.add(qna);
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
                <p><a href="<%=path %>">Home</a> &gt; <a href="<%=path %>/admin/adminPage.jsp">관리자 페이지</a> &gt; <span> 고객지원 관리 </span> </p>
                <h2 class="page_tit"> 관리자 페이지 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 답변이 필요한 질문 목록 </p>
                <hr>
                <div class="table">
                    <table class="tb1" id="myTable">
                        <thead>
                        <tr>
                            <th class="item1">글번호</th>
                            <th class="item2">글제목</th>
                            <th class="item3">작성자</th>
                            <th class="item4">작성일</th>
                            <th class="item5">답변하기</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                            int tot = qnaList.size();
                            for(Qna q:qnaList) {
                                Date d = ymd.parse(q.getResdate());
                                String date = ymd.format(d);
                        %>
                        <tr>
                            <td class="item1"><%=tot %></td>
                            <td class="item2"><%=q.getTitle()%></td>
                            <td class="item3"><%=q.getAuthor()%></td>
                            <td class="item4"><%=date%></td>
                            <td class="item5">
                                <button class="inbtn" onclick="javascript:location.href='<%=path%>/admin/addAnswer.jsp?qno=<%=q.getQno()%>'"> 답변 </button>
                            </td>
                        </tr>
                        <%
                                tot--;
                            }
                        %>
                        </tbody>
                    </table>
                </div>
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
