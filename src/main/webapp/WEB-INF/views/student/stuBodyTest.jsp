<!-- 이인주 20200818 : 학생 마이페이지 body test  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>


<a href="" class="anone"><h5>클릭한 큰 제목</h5></a>
<hr>
<a href="" class="anone"><h6>클릭한 작은 제목</h6></a>

<h6>내용</h6>


<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>

<!-- 메인 푸터 --> 
<%-- <c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>  --%>