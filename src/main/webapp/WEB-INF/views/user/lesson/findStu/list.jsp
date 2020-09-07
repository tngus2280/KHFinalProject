<!-- 이인주 : 사용자 > 학생 찾기 > 목록 jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

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
body{
    margin-top:20px;
    background-color: #edf0f0;    
}
.btn-primary, 
.btn-primary:hover, 
.btn-primary:focus, 
.btn-primary:active, 
.btn-primary.active, 
.btn-primary.focus, 
.btn-primary:active, 
.btn-primary:focus, 
.btn-primary:hover, 
.open>.dropdown-toggle.btn-primary {
    background-color: #3bc0c3;
    border: 1px solid #3bc0c3;
}
.p-t-10 {
/*     padding-top: 10px !important; */
}
.media-main a.pull-left {
    width: 100px;
}
.thumb-lg {
    height: 84px;
    width: 84px;
}
.media-main .info {
    overflow: hidden;
    color: #000;
}
.media-main .info h4 {
    padding-top: 10px;
    margin-bottom: 5px;
}
.social-links li a {
    background: #EFF0F4;
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    display: inline-block;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    color: #7A7676;
}

.panel{
	margin-left : 5px;
	margin-right : 5px;
	border: 1px solid #ccc;
	border-radius: 10px;
	height: 250px;
	width: 520px;
}

#findtitle{
	width: auto;
	text-align: center;
	line-height: 4;
	font-weight: bold;
}

#noneboard{
	color: #17B794;
	font-weight: bold;
	text-align: center;
}

#noneboarder{
	height: 250px;
	border: 2px solid #999;
	border-radius: 10px;
	vertical-align: middle;
	
	color: #17B794;
	font-weight: bold;
	text-align: center;
	font-size: large;
	line-height: 14;
}

.txt_line_content { 
	/* 한 줄 자르기 */
	display: inline-block;
	width: 470px; 
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis;
	  
	/* 여러 줄 자르기 추가 스타일 */
	white-space: normal; 
	line-height: 1.4; 
	height: 3.6em; 
	text-align: left; 
	word-wrap: break-word; 
	display: -webkit-box; 
	-webkit-line-clamp: 3; 
	-webkit-box-orient: vertical;
	
}

.txt_line_title { 
	width:470px; 
	padding:0; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap; 
	font-size: 15px;
	font-weight: bold;
}

.pagingstyle{
 	width: 100%; 
 	padding-left: 15%;
}

#writebtn{
	color: white;
	text-decoration: none;
}

#writebtn:hover{
	color: tomato;
	text-decoration: none;
}
</style>

<script type="text/javascript">
$(function(){
	 $("a[data-toggle='tooltip']").tooltip();
});

</script>

<!-- css 끝------------------------ -->
<!-- ---- ------------------------ -->
<!-- 검색창 시작 ------------------------ -->

<body>

	<div class="gtco-loader"></div>

	<div id="page">
	<!-- nav include  -->
		<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner"
			role="banner">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-8 animate-box">
										<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
											
										<div class="row padding-horizontal-md pull-left banner">
											<div class="row margin-top-xs text title title-xxl text-bold text-white">
												<p><h1>학생 찾기</h1></p>
											</div>
											<br>
											<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
												<p><h2>과외 조건에 맞는 학생을 검색할 수 있습니다.</h2></p><br>
											</div>
											
										
										</div>	
										<div class="container bootstrap snippets bootdey banner">
											<div class="lc-block col-md-4  toggled pull-right" id="l-login">
												<div class="lcb-float">
													<i class="fa fa-users"></i>
												</div>
												<div class="form-group">
													<form action="${pageContext.request.contextPath}/lesson/findStu/search" method="post">
													
														        <select class="form-control" name="findStuLoc" id="findStuLoc">
																		<option selected value="무관">- 지역 선택 -</option>
																		<option value="서울">서울</option>
																		<option value="경기">경기</option>
																		<option value="부산">부산</option>
																		<option value="대구">대구</option>
																		<option value="인천">인천</option>
																		<option value="대전">대전</option>
																		<option value="울산">울산</option>
																		<option value="광주">광주</option>
																		<option value="세종">세종</option>
																		<option value="경남">강원</option>
																		<option value="경북">경북</option>
																		<option value="전남">경남</option>
																		<option value="전북">충북</option>
																		<option value="광주">충남</option>
																		<option value="부산">전북</option>
																		<option value="제주">전남</option>
																		<option value="제주">제주</option>
														        </select>
													
													       <select class="form-control" name="findStuSubject" id="findStuSubject">
																<option selected value="무관" >- 과목 선택 -</option>
																<option value="수학">수학</option>
																<option value="국어">국어</option>
																<option value="영어">영어</option>
																<option value="과학">과학</option>
																<option value="논술">논술</option>
																<option value="사회">사회</option>
																<option value="예체능">예체능</option>
																<option value="제2외국어">제2외국어</option>
																<option value="컴퓨터(IT)">컴퓨터(IT)</option>
																<option value="자격증">자격증</option>
																<option value="대학전공">대학전공</option>
																<option value="기타">기타</option>
													       	</select>
													
															<input type="text" class="form-control" id="keyword" name="keyword" placeholder="키워드를 작성해주세요">
														</form>
													</div>
															<div class="clearfix"></div>
															
														<button type="button" class="btn btn-block btn-primary btn-float m-t-25" style="color: white;">검색</button>
													
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
		
		<!-- 검색창 끝------------------------ -->
		<!-- ---- ------------------------ -->
		<!-- 결과 list 시작 ------------------------ -->

		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

		<h4 id="findtitle">FIND STUDENT BOARD</h4>
		
		
		<div class="container bootstrap snippets bootdey">
		
			<!-- 게시글이 없을 때  -->
			<c:if  var="findstu" test="${empty userFindStuList }">
				<div id="noneboarder">게시글이 없습니다</div>
			</c:if>
		
		    <div class="row">
		    <!--게시글이 있을 때 -->
			<c:if  var="findstu" test="${!empty userFindStuList }">
			<!-- 값 출력 -->
			<c:forEach items="${userFindStuList }" var="findstu" >
		    
		        <div class="col-sm-6">
		            <div class="panel">
		                <div class="panel-body p-t-10">
		                    <div class="media-main">
		                       
		                            <h4><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="#" data-original-title="Message"><i class="fa fa-envelope-o"></i></a>&nbsp;ID.${findstu.USER_ID }</h4>
		                            <p class="text-muted txt_line_title"><a href="${pageContext.request.contextPath}/lesson/findStu/detail?findStuNo=${findstu.FIND_STU_NO}">${findstu.FIND_STU_TITLE }</a></p>
		                            <p class="text-muted">${findstu.FIND_STU_LOC } | ${findstu.FIND_STU_SUBJECT }</p>
		                            
		                            <c:if test="${findstu.FIND_STU_STATE eq 0}">
		                           		<p class="text-muted">모집</p>
		                            </c:if>
		                            
		                            <c:if test="${findstu.FIND_STU_STATE eq 1}">
		                           		<p class="text-muted">마감</p>
		                            </c:if>
		                            
		                            <div class="text-muted txt_line_content">${findstu.FIND_STU_CONTENT }</div>
		                            <p class="text-muted">${findstu.FIND_STU_DATE } </p>
		                    </div>
		                    
		                </div>
		            </div>
		        </div>
			
		</c:forEach>
		</c:if>
		<div class="clearfix"></div>
        <!-- 페이징 -->
		<div class="pagingstyle">
			<c:import url="/WEB-INF/paging/user/lesson/findStu/listPaging.jsp"></c:import>
		</div>
	
	
	</div>
	</div>
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

<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>