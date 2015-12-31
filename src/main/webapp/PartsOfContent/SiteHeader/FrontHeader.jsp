<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인 페이지에서만 타겟팅 나머지는 URL 물고가기
이놈이 슬라이드쇼 없는 놈 그러나 아직 반영 x 각 페이지별로 따로 있다.
 -->
<div class="row">
	<nav id="BackToTop" class="menu navbar navbar-fixed-top "
		role="navigation">
		<div class="container">
			<%-- Container를 nav 밖에 놓으면 전체 영역 / 안에놓으면 1170px --%>
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<%--border 칼라 테두리는 style=border || 안의 icon-bar로 구성 --%>

				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					style="border: 2px solid white">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar" style="background-color: white;"></span> <span
						class="icon-bar" style="background-color: white;"></span> <span
						class="icon-bar" style="background-color: white;"></span>
				</button>
				<%-- 크기 줄었을 때 우측에 navbar 역할 --%>
				<a class="navbar-brand active logo_800_m" href="/"> <img
					src="/Images/CompanyLogos/CompanyLogo.gif"
					class="img-thumbnail img-responsive logo_800_h"
					alt="Responsive image"> <!-- <font color="#E5E5E5">Mwav</font> --></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="mgt2 collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="mgl5 nav navbar-nav">
					<li><a href="/CompanyItem/IT Products/OpenSRS/OpenSRS.jsp">IT
							Solutions</a></li>
					<li><a href="/CompanyItem/IT Products/Aervision/Aervision.jsp">IT
							Products</a></li>
					<li><a
						href="/CompanyItem/WebSite Building/WebSite Building.jsp">WebSite
							Building</a></li>
					<li><a
						href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital
							Marketing</a></li>
					<li><a href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT
							Consulting</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.mbrLoginId ne null }">
						<li><a
							href="/CustomerService/CS-MasterPage.jsp?mode=SDMyPage"
							data-toggle="tooltip" data-placement="bottom"
							data-original-title="${mbrLoginId}님
								반갑습니다."> MyPage</a></li>
						<li><a href="/member/LogOut.do">LogOut</a></li>
					</c:if>
					<c:if test="${sessionScope.mbrLoginId eq null }">
						<li><a href="/MasterPage.jsp?mode=SMbrLogin"><i
								class="fa fa-user fa-lg"></i></a></li>
						<li><a href="/MasterPage_1.jsp?mode=Default"><i
								class="fa fa-user-plus fa-lg"></i></a></li>
					</c:if>
				</ul>
			</div>
			<!-- /.container -->
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</div>


<!--  //////////////////////////////////// -->

<%-- Header Carousel (슬라이드 쇼 부분- 헤더 포함 가능성있음.) 
     클래스명에 container 추가시 조정가능하나 더 이상한듯 ~!! 조정 요망
     
     중간으로 보내기 위해서 container 추가 (left 메뉴 안의 페이지와 크기 동일) // => 다시 빼고 영역 조절
--%>
<header id="myCarousel" class="mgt1_8 carousel slide"
	style="height: 65% !important;">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides 슬라이드쇼 내용 -->
	<div class="carousel-inner">
		<div class="item active">
			<div class="fill"
				style="background-image: url('/Company/zImage/Company_Main(height_300).jpg');"></div>
			<div class="carousel-caption" style="color: #BCE8F1;">

				<div class="row pull-right">
					<div class="col-sm-12 col-md-offset-1 ">
						<a href="#" class="btn btn-danger btn-lg" role="button"><span
							class="glyphicon glyphicon-list-alt"></span> <br />Apps</a> <a
							href="#" class="btn btn-warning btn-lg" role="button"><span
							class="glyphicon glyphicon-bookmark"></span> <br />Bookmarks</a> <a
							href="#" class="btn btn-success btn-lg" role="button"><span
							class="glyphicon glyphicon-user"></span> <br />Users</a> <a href="#"
							class="btn btn-info btn-lg" role="button"><span
							class="glyphicon glyphicon-file"></span> <br />Notes</a>
					</div>
				</div>
			</div>
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/CompanyItem/zImage/CompanyItem_Main(height_300).jpg');"></div>
			<div class="carousel-caption" style="color: #000;">

				<div class="row pull-left">
					<h1>Contact Address</h1>
					<br>
					<div class="row text-center">
						<div class="col-sm-3 col-xs-6 first-box" style="padding:10px;background:#9C0;">
							<h1>
								<span class="glyphicon glyphicon-earphone"></span>
							</h1>
							<h3>Phone</h3>
							<p>+880-1700-987654</p>
							<br>
						</div>
						<div class="col-sm-3 col-xs-6 second-box" style="padding:10px; background:#39F;">
							<h1>
								<span class="glyphicon glyphicon-home"></span>
							</h1>
							<h3>Location</h3>
							<p>1036 Gulshan Road</p>
							<br>
						</div>
						<div class="col-sm-3 col-xs-6 third-box" style="padding:10px;background:#F66;">
							<h1>
								<span class="glyphicon glyphicon-send"></span>
							</h1>
							<h3>E-mail</h3>
							<p>info@yourdomain.com</p>
							<br>
						</div>
						<div class="col-sm-3 col-xs-6 fourth-box" style="padding:10px;background:#6CC;">
							<h1>
								<span class="glyphicon glyphicon-leaf"></span>
							</h1>
							<h3>Web</h3>
							<p>www.yourdomain.com</p>
							<br>
						</div>
					</div>
				</div>
				<!-- <h2>Company Item</h2> -->
				<!-- <a href="/CompanyItem/IT%20Solutions/Aervision/Aervision.jsp"
					class="btn btn-info btn-lg">Learn More</a> -->
			</div>
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/CustomerService/zImage/CustomerService_Main(height_300).jpg');"></div>
			<div class="carousel-caption" style="color: #317eac">

				<div class="col-xs-3 pull-right">
					<div class="text">
						<div class="content-text">
							<h3 class="lead">Project label</h3>
							<p>
								And a little description. <br> and so one
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- Controls (왼, 오른쪽 화살표 버튼)--%>

	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
</header>

<%--  
이미지 태그 사용시 
단 background 와 다르게 height 에 대해서 그대로 잡아버린다. 
<div class="container">

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active">
          <img src="/Company/zImage/CompanyInfo_2(width1000).jpg" alt="...">
          <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
        </div>
        <div class="item">
          <img src="/CompanyItem/zImage/CompanyItem_Main(height_300).jpg" alt="...">
          <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
        </div>
        <div class="item">
          <img src="/CustomerService/zImage/CustomerService_Main(height_300).jpg" alt="...">
          <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
        </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>

  </div>

--%>