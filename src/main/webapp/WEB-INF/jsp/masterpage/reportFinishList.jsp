<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
 
    <!-- 필수-->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- css -->
    <link href="/css/master.css" rel="stylesheet">
    
    <!-- Bootstrap  -->
<link rel="stylesheet" href="/css/masterpagecss/bootstrap.css">
<!-- Theme style  -->
<link rel="stylesheet" href="/css/masterpagecss/style.css">
<!-- J Query -->
<!-- jQuery -->
<!-- Waypoints -->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/masterpagejs/jquery.waypoints.min.js"></script>
<!-- Counters -->
<script src="/js/masterpagejs/jquery.countTo.js"></script>

<!-- MAIN JS -->
<script src="/js/masterpagejs/main.js"></script>
<link href="/css/common.css" rel="stylesheet">

<style>
#colorlib-aside {
    overflow: hidden;
    position: absolute;
}

#th-pay th, #tb-pay td {
    vertical-align: middle;
    text-align: center
}
    button.note-btn.btn.btn-default.btn-sm{
        font-size: 12px !important;
    }
    #mainNav .navbar-brand{
        margin-bottom: 40px !important;
    }
</style>
</head>

<body>

<div class="container">
        <div class="row">
            <div class="col-lg-12">
                <jsp:include page="../headerMain.jsp"></jsp:include>
            </div>
            <!-- 카테고리 nav (스크립트로 임시 inclue) -->
            <div class="col-lg-12">
                <jsp:include page="../headerNav.jsp"></jsp:include>
            </div>
            </div>
            </div>

    <div id="colorlib-page">
        <div class="container-wrap">

            <a href="#"
                class="js-colorlib-nav-toggle colorlib-nav-toggle"
                data-toggle="collapse" data-target="#navbar"
                aria-expanded="false" aria-controls="navbar"><i></i></a>
            <aside id="colorlib-aside" role="complementary"
                class="border js-fullheight">
                <div class="text-center">
                    <div class="author-img"
                        style="background-image: url(/img/1.jpg);"></div>
                    <h1 id="colorlib-logo">
                        <a href="index.html">관리자</a>
                    </h1>
                    <br />
                </div>

                <nav id="colorlib-main-menu" role="navigation"
                    class="navbar">
                    <div id="navbar" class="collapse">
                        <ul>
                            <li><a
                                onclick="location.href='dashBoard'"
                                data-nav-section="1">메인 화면 </a></li>
                                <li><a
                                onclick="location.href='csList'"
                                data-nav-section="10">문의 목록 </a></li>
                            <li><a
                                onclick="location.href='mentorreqlist'"
                                data-nav-section="2">멘토 등록</a></li>
                            <li><a
                                onclick="location.href='classreqlist'"
                                data-nav-section="3">클래스 등록</a></li>
                            <li><a
                                onclick="location.href='reportList'"
                                data-nav-section="4">신고 접수 목록</a></li>
                            <li><a
                                onclick="location.href='reportFinishList'"
                                data-nav-section="5" style=" color: #2c98f0; font-weight:bold;">신고 완료 목록</a></li>
                            <li><a
                                onclick="location.href='prdtList'"
                                data-nav-section="6">전체 상품 목록</a></li>
                            <li><a
                                onclick="location.href='classList'"
                                data-nav-section="7">전체 클래스 목록 </a></li>
                            <li><a
                                onclick="location.href='prodOrderList'"
                                data-nav-section="8">상품 주문 내역</a></li>
                                <li><a onclick="location.href='classOrderList'" data-nav-section="9">
                                    클래스 신청 내역 </a></li>
                        </ul>
                    </div>
                </nav>

            </aside>

            <div id="colorlib-main">

                <section class="colorlib-experience" data-section="5">
                    <div class="colorlib-narrow-content">
                        <div class="row">

                            <div class="about-desc">

                                <h1 class="colorlib-heading">신고 완료 목록</h1>


                                <!-- 게시판 시작-->
                                <div class="col-lg-12">
                                    <div class="col-lg-5" id="serch-men">
                                        <form action="#" method="get">
                                            <div class="input-group">
                                                <input
                                                    class="form-control"
                                                    id="system-search"
                                                    name="q"
                                                    placeholder="Search for"
                                                    required style="height:48px; font-size:20px;"> <span
                                                    class="input-group-btn">
                                                    <button
                                                        type="submit"
                                                        class="btn btn-default" style="border:1px solid silver;">
                                                        <i
                                                            class="fas fa-search fa-3x"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <br /> <br />
                                    <table
                                        class="table table-list-search">
                                        <thead>
                                            <tr>
                                                <th class="text-center">No</th>
                                                <th class="text-center">최근
                                                    신고 날짜</th>
                                                <th class="text-center">회원
                                                    ID</th>
                                                <th class="text-center">회원
                                                    닉네임</th>
                                                <th class="text-center">신고
                                                    누적 횟수</th>
                                                <th class="text-center">상세보기</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach
                                                items="${ReportList}"
                                                var="rl" varStatus="i">
                                                <tr>
                                                    <td
                                                        class="text-center">${i.count}</td>
                                                    <td
                                                        class="text-center">${rl.rtdt}</td>
                                                    <td
                                                        class="text-center">${rl.mentee2Email}</td>
                                                    <td
                                                        class="text-center">${rl.mentee2Nick}</td>
                                                    <td
                                                        class="text-center">${rl.cnt}</td>
                                                    <td
                                                        class="text-center"><button class="btn btn-light"
                                                            id="block-cho"
                                                            name="${rl.meno2}"
                                                            onclick="location.href='#popup${rl.meno2}'">상세
                                                            보기</button></td>
                                                </tr>

                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-lg-12 text-center"
                                    id="page-list1">
                                    <nav
                                        aria-label="Page navigation example">
                                        <ul class="pagination"
                                            id="page-list"
                                            style="display: inline-block;">
                                            <li class="page-item"><a
                                                class="page-link"
                                                href="#"
                                                aria-label="Previous">
                                                    <span
                                                    aria-hidden="true">«</span>
                                                    <span
                                                    class="sr-only">Previous</span>
                                            </a></li>
                                            <li class="page-item"><a
                                                class="page-link"
                                                href="#">1</a></li>
                                            <li class="page-item"><a
                                                class="page-link"
                                                href="#">2</a></li>
                                            <li class="page-item"><a
                                                class="page-link"
                                                href="#">3</a></li>
                                            <li class="page-item"><a
                                                class="page-link"
                                                href="#"
                                                aria-label="Next"> <span
                                                    aria-hidden="true">»</span>
                                                    <span
                                                    class="sr-only">Next</span>
                                            </a></li>
                                        </ul>
                                    </nav>
                                </div>


                                <!-- popup-->
                                <c:forEach items="${ReportList}"
                                    var="rl" varStatus="i">

                                    <div id="popup${rl.meno2}"
                                        class="overlay">
                                        <div class="popupH">
                                            <h2>신고 누적 목록</h2>
                                            <a class="close" href="#">×</a>
                                            <div class="content">
                                                <br />
                                                <div class="container">
                                                    <div class="row">
                                                        <table
                                                            class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th
                                                                        width="5%">No</th>
                                                                    <th
                                                                        width="10%">신고자</th>
                                                                    <th
                                                                        width="8%">분류</th>
                                                                    <th
                                                                        width="13%">유형</th>
                                                                    <th
                                                                        width="16%">제목</th>
                                                                    <th
                                                                        width="18%">내용</th>
                                                                    <th
                                                                        width="15%">URL</th>
                                                                    <th
                                                                        width="15%">신고날짜</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach
                                                                    items="${rl.finishlist}"
                                                                    var="fl"
                                                                    varStatus="j">
                                                                    <tr>
                                                                        <td>${j.count}</td>
                                                                        <td>${fl.menteeNick}</td>
                                                                        <td>${fl.type}</td>
                                                                        <td>${fl.type_detail}</td>
                                                                        <td>${fl.titl}</td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when
                                                                                    test="${fn:length(fl.conts) >1}">
                                                                                    <a
                                                                                        class="button"
                                                                                        style="color: #007bff; cursor: pointer;"
                                                                                        onclick="viewConts('#visible${fl.no}');">
                                                                                        ${fn:substring(fl.conts,0,10)}
                                                                                        ...
                                                                                    </a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                  ${fl.conts}
                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td><a
                                                                            href="${fl.url}">${fl.url}</a></td>
                                                                        <td>${fl.rtdt}</td>
                                                                    </tr>
                                                                    <tr
                                                                        id="visible${fl.no}"
                                                                        style="display: none">
                                                                        <td
                                                                            colspan="2">내용</td>
                                                                        <td
                                                                            colspan="6">${fl.conts}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- popup row-->

                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>

                </section>
            </div>
        </div>
    </div>
    <footer>
            <div class="col px-0" style="z-index:10000;">
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </footer>
<!-- Bootstrap core JavaScript -->

<script>
function viewConts(visibleTr) {
    var curVisible = $(visibleTr).css('display');
    if(curVisible == "none"){
        $(visibleTr).css('display', 'table-row');
    }else{
        $(visibleTr).css('display', 'none');
    }
}


$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
});
</script>

<script>
    
        var testtTop;
        var setId = "#colorlib-aside";
        $(document).ready(function() {
            $("div#footerCss").css("margin-top","0px");
            testtTop = $("#colorlib-aside").offset().top;
        });

         function scroll_follow(id) {
            $(window).scroll(function() //스크롤이 움직일때마다 이벤트 발생
            {
                var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
                if (position > 157) {
                    $(id).css("position", "absolute");
                    $(id).css("top", (position-157) + "px");

                } else {
                    $(id).css("position", "absolute");
                    $(id).css("top", (0) + "px");
                }
            });
        }
        scroll_follow(setId); 
        
    </script>
    </body>
</html>