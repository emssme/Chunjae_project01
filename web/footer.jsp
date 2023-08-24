<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="ft_wrap">
    <nav class="ft_link">
        <ul class="fnb">
            <li class="ft_logo"></li>
            <li><a href="">제휴 문의</a></li>
            <li><a href="">이메일 무단 수집 거부</a></li>
        </ul>
        <ul class="snb">
            <li class="item1"><a href="">소셜1</a></li>
            <li class="item2"><a href="">소셜2</a></li>
            <li class="item3"><a href="">소셜3</a></li>
            <li class="item4"><a href="">소셜4</a></li>
            <li class="item5"><a href="">소셜5</a></li>
            <li class="locate">
                <select name="sel" id="sel" onchange="loc()">
                    <option value="">FAMILY LINK</option>
                    <option value="">레몬참고서</option>
                    <option value="">레몬T</option>
                </select>
            </li>
        </ul>
    </nav>
    <script>
        function loc(){
            var url = document.getElementById("sel").value;
            //location.href = url;  //현재 창에
            if(url!="") {
                var win = window.open(url); //새창에
            }
        }
    </script>
</div>
<div class="ft_wrap2">
    <p class="copyright">
        <span>레몬 에듀</span>
        <span>서울시 금천구 가산로9길 54</span>
        <span>대표자 김보경</span>
        <span>사업자등록번호 000-00-00000</span>
        <span>통신판매신고번호 제00-000호</span>
        <span class="end">부가통신사업신고 000000</span>
    </p>
    <p class="copyright">
        <span>레몬에듀 0000-0000</span>
        <span>레몬참고서 1111-1111</span>
        <span>레몬T 2222-2222</span>
    </p>
    <p class="cp">COPYRIGHT 1981-2023 LEMONEDU EDUCATION INC. ALL RIGHTS RESERVED.</p>
</div>