<!-- 20200902 이인주 -->
<!-- FindStu list paging -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
<ul class="pagination">
   
   <!-- 첫 페이지로 가기 -->
<%--    <c:if test="${paging.curPage ne 1 }"> --%>
<%--    <c:if test="${paging.curPage gt paging.pageCount  }"> --%>
<%--    <li><a href="${pageContext.request.contextPath}/student/wishlist?curPage=1">&laquo;</a></li> --%>
<%--    </c:if> --%>
   
   <!-- 이전 페이지로 가기 -->
   <c:if test="${paging.curPage ne 1 }">
   <li><a href="${pageContext.request.contextPath}/student/wishlist?curPage=${paging.curPage - 1 }">&lt;</a>
   </c:if>
  <c:if test="${paging.curPage eq 1 }">
   <li><a href="javascript:void(0);">&lt;</a></li>
   </c:if>
   
   
   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
   
   <!-- 현재 페이지라면 강조(.active) -->
   <c:if test="${paging.curPage eq i }">
   <li class="active"><a href="${pageContext.request.contextPath}/student/wishlist?curPage=${i }">${i }</a></li>
   </c:if>
   
   <!-- 현재 페이지가 아니라면 평소 모습-->
   <c:if test="${paging.curPage ne i }">
   <li><a href="${pageContext.request.contextPath}/student/wishlist?curPage=${i }">${i }</a></li>
   </c:if>

   </c:forEach>


   <!-- 다음 페이지로 가기 -->
   <c:if test="${paging.curPage ne paging.totalPage}">
   <li><a href="${pageContext.request.contextPath}/student/wishlist?curPage=${paging.curPage + 1 }">&gt;</a>
   </c:if>
 <c:if test="${paging.curPage eq paging.totalPage }">
  <li><a href="javascript:void(0);">&gt;</a></li>
  </c:if>


    <!-- 마지막 페이지로 가기 -->
<%--    <c:if test="${paging.curPage ne paging.totalPage }"> --%>
<%--    <li><a href="${pageContext.request.contextPath}/student/wishlist?curPage=${paging.totalPage }">&raquo;</a></li> --%>
<%--    </c:if> --%>
   
</ul>
</div>