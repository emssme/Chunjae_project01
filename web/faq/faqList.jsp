
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="com.chunjae.dto.Faq" %>

<%
    String path15 = request.getContextPath();
%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
    String sql = "select * from faq order by fno asc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4. 받아온 결과셋(ResultSet) 을 질문및답변 목록(qnaList)에 불러와 하나의 레코드씩 담기
    List<Faq> faqList = new ArrayList<>();
    while(rs.next()){
        Faq faq = new Faq();
        faq.setFno(rs.getInt("fno"));
        faq.setQuestion(rs.getString("question"));
        faq.setAnswer(rs.getString("answer"));
        faq.setCnt(rs.getInt("cnt"));
        faqList.add(faq);
    }
    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주하는 질문</title>
    <%@ include file="../head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path15%>/google.css">
    <link rel="stylesheet" href="<%=path15%>/fonts.css">
    <link rel="stylesheet" href="<%=path15%>/common.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <link rel="stylesheet" href="<%=path15%>/header.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-repeat: no-repeat; background-position:center -250px; height: 1100px; margin-top: 2px;}
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap {clear:both; height: auto; margin:0 auto; width: 1200px;
            margin-top: 20px;}
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }
        .content_tit{
            font-size: 20px; font-weight: 600; margin-bottom: 20px;
        }

        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

    </style>
    <style>
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

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

    <link rel="stylesheet" href="<%=path15%>/footer.css">
    <style>
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
    <style>
        .qnalist li { padding-top:8px; padding-bottom:8px; line-height: 2; }
        .qnalist li .ans { padding: 16px;  background-color: #f1f1f1; }
        .ans { display:none; }
        .que:after { content:"▼"; padding-left: 36px;}
        .que.on:after { content:"▲"; }
    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 고객지원 </span> > <span> 자주 묻는 질문 </span> </p>
                <h2 class="page_tit"> 자주 묻는 질문 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 자주 묻는 질문 </p>
                <ul class="qnalist">
                    <% for(Faq f:faqList) { %>
                    <li>
                        <div class="que"><%=f.getQuestion() %></div>
                        <div class="ans"><%=f.getAnswer() %></div>
                        <hr>
                    </li>
                    <% } %>
                </ul>
                <script>
                    $(document).ready(function(){
                        $(".qnalist li").click(function(){
                            $(this).find(".ans").slideToggle(500);
                            $(this).find(".que").toggleClass("on");
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