<!-- 200819 이서연 -->
<!-- /admin/lesson/view -->
<!-- 관리자 페이지 > 과외 > 과외 조회 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

<style type="text/css">

	#dataTable_length { float: left; }
	#dataTable_info { float: left; }
	#dataTable a:hover  { text-decoration: none; color: black; }
	#dataTable tr:hover { background: #f3f3f3cc; }

</style>

<style type="text/css">

#okay { background: #fff; }

#notyet { background: #95e0ff6b; }

#denied { background: #ffb3c047; }

</style>




	<div id="title">과외 
		<i class="fas fa-angle-right"></i>
		<a href="">과외 조회</a>
	</div>
	
	
	<main>
	    <div id="content">
	    

			<c:if test="${empty lessonList }">
				<div>과외가 없습니다</div>
			</c:if>


			<c:if test="${!empty lessonList }">

	            <div class="container-fluid">
	            
	                <h5 style="font-weight: bold;">전체 과외 조회</h5><br>
	                
                	<div class="card mb-4">
	                    <div class="card-body">
	                        <div class="table-responsive">
	                        	
	                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                <thead>
	                                    <tr>
	                           				<th style="width: 10%">번호</th>
											<th style="width: 46%">과외명</th>
											<th style="width: 10%">작성자</th>
											<th style="width: 10%">작성일</th>
											<th style="width: 8%">검토</th>
											<th style="width: 8%">결제</th>
											<th style="width: 8%">게시</th>
	                                    </tr>
	                                </thead>
	                                
	                                  <!-- ** 추후 구현 : 제목 클릭 시 과외 상세 페이지로 연결 -->
	                                
	                                <tbody>
					                	<c:forEach items="${lessonList }" var="lessonList" >
											<tr>
												<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">${lessonList.LESSON_NO}</td>
												<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">
													<a href="${pageContext.request.contextPath}/lesson/detaillesson?lessonNo=${lessonList.LESSON_NO}&userNo=${lessonList.USER_NO}" target="_blank">${lessonList.LESSON_TITLE}</a>
												</td>
												<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">${lessonList.USER_ID}</td>
												<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">${lessonList.LESSON_DATE}</td>
												<c:if test="${lessonList.LESSON_CHK eq 0}">
													<td id="notyet">미검토</td>
												</c:if>
												<c:if test="${lessonList.LESSON_CHK eq 1}">
													<td id="okay">승인</td>
												</c:if>
												<c:if test="${lessonList.LESSON_CHK eq 2}">
													<td id="denied">반려</td>
												</c:if>
												<c:if test="${lessonList.PAY_STATE eq 0}">
													<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">N</td>
												</c:if>
												<c:if test="${lessonList.PAY_STATE eq 1}">
													<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">Y</td>
												</c:if>
												<c:if test="${lessonList.LESSON_STATE eq 0}">
													<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">N</td>
												</c:if>
												<c:if test="${lessonList.LESSON_STATE eq 1}">
													<td id="${lessonList.LESSON_CHK eq 0 ? 'notyet' : lessonList.LESSON_CHK eq 2 ? 'denied' : 'okay'}">Y</td>
												</c:if>
											</tr>
										</c:forEach>
	                                </tbody>
	                            </table>
	                            
	                        </div>
	                    </div>
	                </div>
                </div>  
                
            </c:if>
            
             
	    </div>
	</main>
       
       
       
       
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  