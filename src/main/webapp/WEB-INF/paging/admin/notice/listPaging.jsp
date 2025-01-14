<!-- 20200819 이인주 -->
<!-- notice list paging -->

<!-- 페이징 복붙 예시  -->
<!-- 1. 본인에게 맞는 url 작성 -->
<!-- 2. url에 쿼리스트링이 들어가야하는 경우 맞게 작성 필요 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
<ul class="pagination">
   
   <!-- 첫 페이지로 가기 -->
   <c:if test="${paging.curPage ne 1 }">
<%--    <c:if test="${paging.curPage gt paging.pageCount  }"> --%>
   <li><a href="/admin/notice/list?curPage=1&&search=${param.search }">&laquo;</a></li>
   </c:if>
   
   
   <!-- 이전 페이징 리스트로 가기 -->
<%--    <c:if test="${paging.startPage gt paging.pageCount }"> --%>
<%--    <li><a href="/userlist?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    </c:if> --%>
   
<%--    <c:if test="${paging.startPage le paging.pageCount }"> --%>
<!--    <li class="disabled"><a>&laquo;</a></li> -->
<%--    </c:if> --%>
   
   
   <!-- 이전 페이지로 가기 -->
   <c:if test="${paging.curPage ne 1 }">
   <li><a href="/admin/notice/list?curPage=${paging.curPage - 1 }&search=${param.search }">&lt;</a>
   </c:if>
   
   
   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
   
   <!-- 현재 페이지라면 강조(.active) -->
   <c:if test="${paging.curPage eq i }">
   <li class="active"><a href="url작성?curPage=${i }&search=${param.search }">${i }</a></li>
   </c:if>
   
   <!-- 현재 페이지가 아니라면 평소 모습-->
   <c:if test="${paging.curPage ne i }">
   <li><a href="/admin/notice/list?curPage=${i }&search=${param.search }">${i }</a></li>
   </c:if>

   </c:forEach>


   <!-- 다음 페이지로 가기 -->
   <c:if test="${paging.curPage ne paging.totalPage}">
   <li><a href="/admin/notice/list?curPage=${paging.curPage + 1 }&search=${param.search }">&gt;</a>
   </c:if>
   

    <!-- 다음 페이징 리스트로 가기 --> 
<%--    <c:if test="${paging.endPage ne paging.totalPage }"> --%>
<%--    <li><a href="/userlist?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li> --%>
<%--    </c:if> --%>

<%--    <c:if test="${paging.endPage eq paging.totalPage }"> --%>
<!--    <li class="disabled"><a>&raquo;</a></li> -->
<%--    </c:if> --%>


    <!-- 마지막 페이지로 가기 -->
   <c:if test="${paging.curPage ne paging.totalPage }">
   <li><a href="/admin/notice/list?curPage=${paging.totalPage }&search=${param.search }">&raquo;</a></li>
   </c:if>
   
</ul>
</div>