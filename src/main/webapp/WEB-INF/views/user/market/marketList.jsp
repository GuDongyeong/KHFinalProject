<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
	
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

<style type="text/css">
@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

.banner h1,.banner h2{
	font-family: 'NanumSquareRound', sans-serif !important;
    font-weight: bolder !important;
}
.banner h1{
margin-top:20px;
}

.banner{
	margin-top:120px;
}

</style>

<style type="text/css">
.menu-item#three ul {
   height: 93px; 
}
#marketlist{
	width: 1000px;
	margin: 0 auto;
	  	color: black;
}
#studentMK{
  background: #eee;
}

#title{
	width: 100%;
	font-weight: bold;
}

#title a {
	color: #17B794; /* 청록색 */
}

#marketContent{
	width: 97%;
	margin: 0 auto;
}

#marketBoard{
	width: 90%;
	margin: 0 auto;
}

#marketComm{
	width: 90%;
	margin: 0 auto;
}
.marketTable{
/* 	height: 360px; */
}

.marketCommTable{
/* 	height: 260px; */
}

.main-box.no-header {
    padding-top: 20px;
}
.main-box {
    background: #FFFFFF;
/*     -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     -moz-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     -o-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     -ms-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     box-shadow: 1px 1px 2px 0 #CCCCCC; */
    margin-bottom: 16px;
    -webikt-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.label {
    border-radius: 3px;
    font-size: 0.875em;
    font-weight: 600;
}
.user-list tbody td .user-subhead {
    font-size: 0.875em;
    font-style: italic;
}
.user-list tbody td .user-link {
    display: block;
    margin-left: 10px;
    margin-top: 20px;
	overflow: hidden;
	width: 450px;
  	text-overflow: ellipsis;
  	white-space: nowrap;
  	float: left;
	  	color: black;
}

a {
    outline: none!important;
}
.user-list tbody td img {
    position: relative;
    max-width: 60px;
    height: 60px;
    float: left;
}
.user-list tbody td .mkThumb{
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 60px;
	height: 60px;
  	float: left;
  	margin: 0 10px; 
}
.table thead tr th {
    text-transform: uppercase;
    font-size: 0.875em;
}
.table thead tr th {
    border-bottom: 2px solid #e7ebee;
}
.table tbody tr td:first-child {
    font-size: 1.125em;
    font-weight: 300;
}
.table tbody tr td {
/*     font-size: 0.875em; */
    vertical-align: middle;
    border-top: 1px solid #e7ebee;
    padding: 4px 8px;
}

.commContent{
	width: 500px;
	overflow: hidden;
  	text-overflow: ellipsis;
  	white-space: nowrap;
  	 display: inline-block;
}

.tableHeader{
	background: #eee;
}

</style>
		
<script>
function marketPaging(curPage){
	
	var url = "<%=request.getContextPath() %>/student/marketpage";
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: {curPage : curPage},
		success : function(result) {
// 			console.log(result);
			$("#marketBoard").html(result);
		},
		error : function(){
			alert("ajax 실패")
		}
	});
	
}

function marketCommPaging(curPage){
	
	var url = "<%=request.getContextPath() %>/student/marketcommpage";
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: {curPage : curPage},
		success : function(result) {
// 			console.log(result);
			$("#marketComm").html(result);
			$("#marketCommTable").focus();
		},
		error : function(){
			alert("ajax 실패")
		}
	});
	
}
</script>
<body>
	
	<!-- 김헌일 : 중고장터 프론트 초안작성중 0817 ~ ing -->

	<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner" role="banner">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-8 animate-box">
										<div class="row padding-horizontal-md pull-left banner">
											<div class="row margin-top-xs text title title-xxl text-bold text-white">
												<p><h1>중고장터</h1></p>
											</div>
											<br>
											<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
												<p><h2>자유롭게 물건들을 팔아보아요</h2></p>
											</div>
										</div>
									</div>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- END #gtco-header -->
	
	<br>

				
<div id="marketlist">
		 <div class>
             <div>
               <input type="text" id="" name="" class="form-control"/>
              <button type="button" class="btn waves-effect waves-light btn-custom"><i class="fa fa-search mr-1"></i> Search</button>
         	</div>
         </div>
<div id="marketBoard">
    <div class="row">
        <div class="col-lg-12 marketTable">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list table-hover">
                            <thead>
                                <tr class="tableHeader">
                                <th class="text-center" style="width: 5%;"><span>No</span></th>
                                <th class="text-center" style="width: 55%;"><span>제목</span></th>
                                <th class="text-center"  style="width: 10%;"><span>작성자</span></th>
                                <th class="text-center"  style="width: 10%;"><span>작성일</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="m">
                                <tr>
                                    <td class="text-center"><span>${m.MK_NO }</span></td>
                                    <td>
                                    	<div class="mkThumb">
                                       <img src="<%= request.getContextPath() %>/resources/upload/${m.MK_THUMB_RENAME }" alt="메인 사진">
                                       </div>
                                       <a href="<%= request.getContextPath() %>/board/market/detail?mkno=${m.MK_NO }" class="user-link">${m.MK_TITLE }</a>
                                    </td>
                                    <td class="text-center"><span>${m.USER_ID }</span></td>
                                    <td  class="text-center">
                                        <span>
                               		    <fmt:parseDate value="${m.MK_DATE }" pattern="yyyyMMdd" var="date"/>
                               		    <fmt:formatDate value="${date }" pattern="yyyy/MM/dd"/>
                                   		</span>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
	</div>
	  <div style="text-align: center;">
<%--    <c:if test="${not empty list}" > --%>
		<c:import url="/WEB-INF/paging/user/market/marketPaging.jsp" />
<%-- 	</c:if> --%>
	</div>
	
</div>
</div>
<br>
<hr>


	<br>
	<br>
	
	<br>
	<br>

	<!-- footer include  -->
	<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<!-- countTo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countTo.js"></script>
	<!-- Carousel -->
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>

