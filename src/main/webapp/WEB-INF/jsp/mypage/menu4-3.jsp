<%@ page import="bitcamp.java110.cms.domain.ClassQna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<script>

//  답변 처리상태
$(document).ready(function() {
    <c:forEach items="${cqlist2}" var="cc" varStatus="i">
  var answer = $('.answer'+${i.index}).text();
  if(!answer){
        $('.answerState'+${i.index}).text("답변대기");
    } 
  else {
        $('.answerState'+${i.index}).text("답변완료");
    } 
    </c:forEach>    
});

</script>    
    
<div class="col-lg-12">
    <div class="panel panel-default">
       
        
            <h2 class="colorlib-heading" style="margin-top:0;">클래스 답변내역</h2>
                        
                        
        <div class="panel-body">
            <table class="table table-condensed" style="border-collapse:collapse;">
                <thead>
                    <tr>
                        <th width="5%">No.</th>
                        <th width="35%">클래스</th>
                        <th width="25%">제목</th>
                        <th width="10%">질문자</th>
                        <th width="15%">문의일자</th>
                        <th width="15%">처리상태</th>
                    </tr>
                </thead>

                <tbody>
<c:forEach items="${cqlist2}" var="c" varStatus="i">

                    <tr data-toggle="collapse" data-target="#demo3-${i.count}" class="accordion-toggle">
                        <td>${i.count}</td>
                        <td><a href="../class/detail?no=${c.cno}">${c.classes.titl}</a></td>
                        <td>${c.titl}</td>
                        <td>${c.mentee2.nick}</td>
                        <td>${c.rgdt}</td>
                        <td class="answerState${i.index}"></td>
                    </tr>
                     
                     <tr>
                        <td colspan="6" class="hiddenRow" style="padding: 0;">
                            <div class="accordian-body collapse" id="demo3-${i.count}">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                           <td class="qcontents">문의내용</td>
                                            <td>${c.conts}
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="qcontents">답변내용</td>
                                            <td class="answer${i.index}">${c.anser}</td>
                                        </tr>
                                    </tbody>
                                </table>
 <div style="width:150px; margin-left:auto; margin-right:0;">
 <button type="button" class="btn btn-primary" >수정</button>
 <!-- 이미 답변한 게시물은 '답변수정' 으로 출력  -->
 <button type="button" class="btn btn-secondary">취소</button> </div>
                            </div>
                        </td>
                    </tr>
 </c:forEach>    
                </tbody>
            </table>
        </div>

    </div>

<!-- Paging 처리 -->

                        <div id="paging">
                            <!--        ${pageCode}-->
                        </div>
                    </div>
                </div>

 <!-- page navigation -->
<nav aria-label="Page navigation"  class="pn-center" >
  <ul class="pagination" style="margin-top:0;" >
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>
            