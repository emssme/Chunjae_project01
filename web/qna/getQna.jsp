<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    int qno = Integer.parseInt(request.getParameter("qno"));

    //3. DB연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. sql 실행 및 실행결과 받기
    String sql = "SELECT * FROM qna WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);

    //5. 실행결과(ResultSet) 인 해당 Qna 1건 qna(질문및답변) 객체에 넣기
    rs = pstmt.executeQuery();
    Qna qna = new Qna();
    if(rs.next()){
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 및 답변 글 상세보기</title>
    <%@ include file="../head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../google.css">
    <link rel="stylesheet" href="../fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="../header.css">

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
            border-bottom:1px solid #333; border-top:1px solid #333; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:65%; }
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }

        .inbtn {
            display: inline-block;
            border-radius: 100px;
            width: 140px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 48px;
            background-color: #efef9b;
            color: #333;
            font-size: 18px;
            border: 1px solid #333;
            margin: 4px;
        }
    </style>

    <link rel="stylesheet" href="../footer.css">
    <style>

    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp"%>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 질문과 답변 </span> </p>
                <h2 class="page_tit"> 질문과 답변 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문 및 답변 글 상세보기</h2>
                <br><br><hr><br><br>
                <table class="tb1" id="myTable">
                    <tbody>
                    <!-- 6. 해당 글번호에 대한 글 상세내용 출력 -->
                    <tr>
                        <th>유형</th>
                        <td>
                            <% if(qna.getLev()==0) { %>
                            <span>질문</span>
                            <% } else { %>
                            <span>답변</span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td><%=qna.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td><%=qna.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%=qna.getAuthor()%></td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td><%=qna.getResdate() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=qna.getCnt() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <!-- 7. 용도별 링크 버튼 추가 -->
                            <!-- 현재 글이 질문 글이면,
                                로그인한 사람만 답변하기,
                                질문을 등록한 사람(관리자포함)만 질문글 수정,
                                질문글 삭제 버튼 추가
                             아니면(답변 글이면),
                                답변을 등록한 사람(관리자포함)만 답변글 삭제,
                                답변글 버튼 수정 -->
                            <!-- 모든 사용자 목록 버튼 추가 -->
                            <% if(qna.getLev()==0) { %>
                                <% if(sid!=null) { %>
                                    <a href="/qna/addQuestion.jsp?lev=1&par=<%=qna.getQno() %>" class="inbtn">답변하기</a>
                                <% } %>
                                <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                                    <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">질문 수정하기</a>
                                    <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=0" class="inbtn">질문 삭제하기</a>
                                <% } %>
                            <% } else { %>
                                <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                                    <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">답변 수정하기</a>
                                    <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=1" class="inbtn">답변 삭제하기</a>
                                <% } %>
                            <% } %>
                            <a href="/qna/qnaList.jsp" class="inbtn">목록</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp"%>
    </footer>
</div>
</body>
</html>