<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%--부트 스트랩 --%>
<link
    href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
    src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%--css --%>
<link href="/css/basket.css" rel="stylesheet">

</head>
<body style="background-color: #F2F4F7">

    <div class="container">
        <hr color="black" />
        <br>
        <div class="row">

            <!-- 버튼 -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-lg-offset-12">
                        <p>
                            <button type="button"
                                class="btn btn-default btn-lg"
                                id="btn-cl">장바구니(클래스)</button>
                            <button type="button"
                                class="btn btn-default btn-lg">장바구니(공예품)</button>

                            <span
                                style="font-size: 22px; color: Dodgerblue; position: relative; left: 45%;">
                                <span>장바구니</span> <span><Strong>
                                        ></Strong></span>
                            </span> <span
                                style="font-size: 22px; position: relative; left: 46%;">
                                <span>결제</span> <span><Strong>
                                        ></Strong></span>
                            </span> <span
                                style="font-size: 22px; position: relative; left: 47%;">
                                <span>완료</span>
                            </span>
                        </p>
                    </div>
                </div>
            </div>

            <!-- 장바구니 시작-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-md-offset-12">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">상품</th>
                                    <th class="text-center">수량</th>

                                    <th class="text-center">배송료</th>
                                    <th class="text-center">가격</th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${basketList }" var="r">
                                <tr>
                                    <td
                                        class="col-sm-4 col-md-4 col-lg-4">
                                        <div class="media">
                                            <a
                                                class="thumbnail pull-left"
                                                href="#"> <img
                                                class="media-object"
                                                src="${r.product.phot }"
                                                style="width: 100px; height: 100px;">
                                            </a>
                                            <div class="media-body">
                                                <h4
                                                    class="media-heading">
                                                    <a href="#">${r.product.titl}</a>
                                                </h4>
                                                <h5
                                                    class="media-heading">
                                                    판매자 <a href="#">${r.mentee.nick }</a>
                                                </h5>
                                                <span></span><span
                                                    class="text-warning"><strong>인당
                                                        최대 수량: 1개</strong></span>
                                            </div>
                                        </div>
                                    </td>
                                    <td
                                        class="col-sm-2 col-md-2 col-lg-2 text-center"><strong><input
                                            type="number" name="produc1"
                                            min="1" max="10" value="1"></strong></td>
                                    <td
                                        class="col-sm-2 col-md-2 text-center"><strong>${r.product.deli }원 </strong></td>
                                    <td
                                        class="col-sm-2 col-md-2 text-center"><strong>${r.product.pric }원 </strong></td>
                                    <td class="col-sm-2 col-md-2">
                                        <button type="button"
                                            class="btn btn-danger">
                                            <span
                                                class="glyphicon glyphicon-remove"></span>
                                            장바구니 삭제
                                        </button>
                                    </td>
                                </tr>
                                </c:forEach>
                                
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td>
                                        <h5>가격</h5>
                                    </td>
                                    <td class="text-right">
                                        <h5>
                                            <strong>￦${total }</strong>
                                        </h5>
                                    </td>
                                </tr>
                                <tr class="pay2">
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td>
                                        <h5>배송료</h5>
                                    </td>
                                    <td class="text-right">
                                        <h5>
                                            <strong>￦12,000</strong>
                                        </h5>
                                    </td>
                                </tr>
                                <tr class="pay3">
                                    <td class="pay3-1"> </td>
                                    <td class="pay3-1"> </td>
                                    <td class="pay3-1"> </td>
                                    <td>
                                        <h3>최종금액</h3>
                                    </td>
                                    <td class="text-right">
                                        <h3>
                                            <strong>￦52,000</strong>
                                        </h3>
                                    </td>
                                </tr>
                                <tr class="pay4">
                                    <td> </td>
                                    <td> </td>
                                    <td> </td>
                                    <td>
                                        <button type="button"
                                            class="btn btn-default"
                                            id="selc1">
                                            <span
                                                class="glyphicon glyphicon-shopping-cart"></span>
                                            쇼핑 계속 하기
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button"
                                            class="btn btn-default"
                                            id="selc2">
                                            장바구니 결제 <span
                                                class="glyphicon glyphicon-play"></span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- 장바구니 row-->
            </div>
            <!-- 장바구니 container-->


        </div>
        <!-- main row-->
    </div>
    <!-- main container-->

</body>
</html>