<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="java.util.List" %>
<%@ page import="com.chunjae.dto.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <title>회원 관리</title>
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
    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>
    <style>
        /*배너*/
        .content_header {
            clear: both;
            height: 250px;
            background-image: url("/images/mypage_cover.jpg");
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
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-repeat: no-repeat; background-position:center -250px; height: 1100px; margin-top: 2px;}
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; margin-top: 20px;}
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:#efef9b; color:#333; }
        .tb1 td {    line-height: 32px;
            border-top: 1px solid #333;
            border-bottom: 1px solid #333;
        vertical-align: middle;}
        .tb1 tr {height: 50px}

        .tb1 .item1 { width:25%; text-align: center; }
        .tb1 .item2 { width:25%; text-align: center; }
        .tb1 .item3 { width:25%; text-align: center; }
        .tb1 .item4 { width:25%; text-align: center; }

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            background-color: #333; color:#fff; font-size: 15px;
        height: 30px; width: auto;}
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DBC con = new MariaDBCon();
        conn = con.connect();

        String sql = "select * from member where id != 'admin' order by resdate";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        List<Member> memberList = new ArrayList<>();
        while (rs.next()){
            Member member = new Member();
            member.setId(rs.getString("id"));
            member.setName(rs.getString("name"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            member.setResdate(sdf.format(d));
            memberList.add(member);
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
                <p><a href="/">Home</a> &gt; <a href="/adminPage.jsp">관리자 페이지</a> &gt; <span> 회원 관리 </span> </p>
                <h2 class="page_tit"> 회원 관리 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <div class="table">
                    <table class="tb1" id="myTable">
                        <thead>
                        <tr>
                            <th class="item1">이름</th>
                            <th class="item2">아이디</th>
                            <th class="item3">가입일</th>
                            <th class="item4">강퇴</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                            for(Member member:memberList) {
                                Date d = ymd.parse(member.getRegdate());
                                String date = ymd.format(d);
                        %>
                        <tr>
                            <td class="item1"><%=member.getName()%></td>
                            <td class="item2"><%=member.getId()%></td>
                            <td class="item3"><%=member.getRegdate()%></td>
                            <td class="item4">
                                <button class="inbtn" onclick="javascript:location.href='<%=path%>/admin/kickpro.jsp?id=<%=member.getId()%>">강퇴</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                        <script>
                            $(document).ready( function () {
                                $('#myTable').DataTable({
                                    order:[[0, "desc"]]
                                });
                            });
                        </script>
                    </table>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>

    <% if(sid == null || !sid.equals("admin")) { %>
    <script>
        alert("관리자만 접근 가능한 페이지입니다.");
        history.go(-1);
    </script>
    <% } %>
</div>
</body>
</html>
