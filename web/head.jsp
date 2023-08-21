<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Author" content="김보경">
<meta http-equiv="Publisher" content="김보경">
<meta http-equiv="Copyright" content="copyright@lemonedu.com">
<title>레몬 에듀</title>

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="레몬에듀, lemonedu">
<meta name="Keywords" content="고등 강의, 인터넷 강의, 고등 교육">
<meta name="Description" content="레몬 에듀는 고등학생의 교육 활동을 지원하는 교육 기업입니다.">
<!-- <meta name="Robots" content="noindex, nofllow"> -->
<meta name="robots" content="index,follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="레몬에듀">
<meta property="og:description" content="비타민처럼 필수적인 교육을 제공하는 레몬에듀">
<meta property="og:image" content="<%=path %>/images/lemonedu_logo.png">
<meta property="og:url" content="<%=path %>">

<!-- 트위터 -->
<meta name="twitter:card" content="<%=path %>/images/lemonedu_logo.png">
<meta name="twitter:title" content="레몬에듀">
<meta name="twitter:description" content="비타민처럼 필수적인 교육을 제공하는 레몬에듀">
<meta name="twitter:image" content="<%=path %>/images/lemonedu_logo.png">

<!-- 모바일 앱의 iOS 인 경우
<meta property="al:ios:url" content="ios 앱 url">
<meta property="al:ios:app_store_id" content="ios 앱스토어 ID" />
<meta property="al:ios:app_name" content="ios 앱 이름" />
-->

<!-- 모바일 앱의 Android 인 경우
<meta property="al:android:url" content="안드로이드 앱 URL" />
<meta property="al:android:app_name" content="안드로이드 앱 이름" />
<meta property="al:android:package" content="안드로이드 패키지 이름" />
<meta property="al:web:url" content="안드로이드 앱 URL" />
-->

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="<%=path %>/images/lemonedu_icon.png">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="<%=path %>/images/lemonedu_icon.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="<%=path %>/images/lemonedu_icon.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="<%=path %>/images/lemonedu_icon.png" sizes="16x16">

<script>
document.oncontextmenu = function() { return false; }
document.ondragstart = function() { return false; }
document.onselectstart = function() { return false; }
//document.onkeydown = function() { return false; }
</script>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>