<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String sid = null;
    sid = (String) session.getAttribute("id");

    String path8 = request.getContextPath();
%>

<div class="hd_wrap">
    <nav class="tnb">
        <ul class="menu">
            <% if(sid!=null) { %>
                <li><a href="<%=path8 %>/member/logout.jsp">로그아웃</a></li>
                <li><a href="<%=path8 %>/member/mypage.jsp">마이페이지</a></li>
                <li><a href="<%=path8%>/introduce/map.jsp">오시는길</a></li>
                    <% if(sid.equals("admin")) { %>
                    <li><a href="<%=path8 %>/admin/admin.jsp">관리자페이지로</a></li>
                    <% } %>
            <% } else { %>
                <li><a href="<%=path8 %>/member/login.jsp">로그인</a></li>
                <li><a href="<%=path8 %>/member/term.jsp">회원가입</a></li>
                <li><a href="<%=path8%>/introduce/map.jsp">오시는길</a></li>
            <% } %>
        </ul>
    </nav>
</div>
<div class="hd_wrap">
    <a href="<%=path8 %>" class="logo">
        <img src="<%=path8 %>/images/lemonedu_logo.png" alt="레몬에듀 로고">
    </a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="" class="dp1">소 개</a>
                <ul class="sub">
                    <li><a href="<%=path8%>/introduce/intro.jsp">회사소개</a></li>
                    <li><a href="<%=path8%>/introduce/map.jsp">오시는길</a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="" class="dp1">국&nbsp;어</a>
                <ul class="sub">
                    <li><a href="<%=path8%>/introduce/kor/korTeacher.jsp">강사 소개</a></li>
                    <li><a href="<%=path8%>/introduce/kor/korBookInfo.jsp">교재 소개</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="" class="dp1">수&nbsp;학</a>
                <ul class="sub">
                    <li><a href="<%=path8%>/introduce/mat/matTeacher.jsp">강사 소개</a></li>
                    <li><a href="<%=path8%>/introduce/mat/matBookInfo.jsp">교재 소개</a></li>
                </ul>
            </li>
            <li class="item4">
                <a href="" class="dp1">영&nbsp;어</a>
                <ul class="sub">
                    <li><a href="<%=path8%>/introduce/eng/engTeacher.jsp">강사 소개</a></li>
                    <li><a href="<%=path8%>/introduce/eng/engBookInfo.jsp">교재 소개</a></li>
                </ul>
            </li>
            <li class="item5">
                <a href="<%=path8%>/notice/NoticeList.jsp" class="dp1">커뮤니티</a>
                <ul class="sub">
                    <li><a href="<%=path8%>/notice/NoticeList.jsp">공지사항</a></li>
                    <li><a href="<%=path8%>/board/boardList.jsp">자유 게시판</a></li>
                </ul>
            </li>
            <li class="item6">
                <a href="<%=path8%>/faq/faqList.jsp" class="dp1">고객지원</a>
                <ul class="sub">
                    <li><a href="<%=path8%>/faq/faqList.jsp">FAQ</a></li>
                    <li><a href="<%=path8%>/qna/qnaList.jsp">질문과 답변</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>