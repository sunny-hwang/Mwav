<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->

<script>
function reCheckuaForm(formname){
	
	var uaTitle = formname.uaTitle;	
	var uaContent = formname.uaContent;
	

	var check_1 = emptyCheck(uaTitle, "답변 제목을 입력해주세요.");
	var check_2 = emptyCheck(uaContent, "답변 내용을 입력해주세요.");
	
	
	var check = false;
	// && check_5 == true 패스워드는 회원인경우 없으니까 
	if(check_1 == true && check_2 == true){
		check = true;
		return true;
		
	}else{
		check = false;
		return false;
	}
	
}

	function insertQnAUaForm() {
		var uaForm = document.getElementById("uaForm");
		var check = reCheckuaForm(uaForm);
			
		if (check == true) {
			$
					.ajax({
						url : "/admin/boardQnA/uaFormAjax.mwav",
						type : "post",
						data : $("#uaForm").serialize(),
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						dataType : "json", // 데이터타입을 JSON형식으로 지정
						success : function(xmlStr) {
							if (xmlStr != null) {
								//http://devbox.tistory.com/entry/%EB%B9%84%EA%B5%90-%EC%99%80-%EC%9D%98-%EC%B0%A8%EC%9D%B4-1
								//alert($("#resultpostseek").height());
								if (xmlStr === true) {
								alert('정상적으로 답변이 등록되었습니다.')
								$('#uadivForm').hide();
							return true;

								} else if (xmlStr === false) {

							    alert('답변이 등록되지 않았습니다.');
							    return false;
								}

							}
						},
						error : function(xhr, status, error) {
							var errorMsg = 'status(code): ' + jqXHR.status
									+ '\n';
							errorMsg += 'statusText: ' + jqXHR.statusText
									+ '\n';
							errorMsg += 'responseText: ' + jqXHR.responseText
									+ '\n';
							errorMsg += 'textStatus: ' + textStatus + '\n';
							errorMsg += 'errorThrown: ' + errorThrown;
							alert(errorMsg);
						}
					});
		} else {
			return false;
		}
	}
</script>
</head>

<body>
	<%--mwav는 container 영역만 쓰기때문에 그랬으나 이건 전체 쓴다. 그러므로 container로 감싸면 안된다.  --%>
	<!--  //////////////////////////////////// -->
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->



	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> Q&AView</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>SiteMgr</li>
					<li class="active">Q&AView</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<%-- 
			- param으로 같은 이름 지정시 위의 named으로 인식
			- getparameter는 param.mm // setattribute는 mm
			- value에 두개다 넣는 경우 비즈니스로직 + 파라미터인경우 문제발생
			- jsp param 안에 choose, when, otherwise 사용 불가
			 --%>
				<c:choose>
					<c:when test="${param.mm eq null}">
						<c:set value="${mm}" var="mm" />
					</c:when>
					<c:otherwise>
						<c:set value="${param.mm}" var="mm" />
					</c:otherwise>
				</c:choose>
				<jsp:include page="/admins/LeftMenu.mwav" flush="false">
					<jsp:param name="mm" value="${mm}" />
				</jsp:include>
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">Q&AView</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<%--================================================시작========================================================== --%>
						<script>
	function check2(obj) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var bbb = obj;
			location.href= "/admin/boardQnA/qnaDelete.mwav?QnA_id="+bbb;
		}else{   //취소
		    return;
		}

	}
</script>
						<!-- Content Column -->
						<div class="table-responsive">
							<form role="form">


								<table class="table table-striped">
									<thead>
										<tr>


										</tr>
										<tr class="active">
											<th>Group</th>
											<th>InsertDate</th>
											<th>Answer</th>
											<th>Status</th>
										</tr>
									</thead>


									<tbody>
										<tr>
											<td>${selectOneQnAView.uqGroup}</td>
											<td>${selectOneQnAView.fmuqInsertDt}</td>
											<td>${selectOneQnAView.uaResponser_id}</td>

											<c:if test="${selectOneQnAView.uqStatus eq '0'}">
												<td><span class="label label-danger">삭제 </span></td>
											</c:if>
											<c:if test="${selectOneQnAView.uqStatus eq '1'}">
												<td><span class="label label-primary">문의접수 </span></td>
											</c:if>
											<c:if test="${selectOneQnAView.uqStatus eq '10'}">
												<td><span class="label label-success">답변처리 </span></td>
											</c:if>
											<c:if test="${selectOneQnAView.uqStatus eq '20'}">
												<td><span class="label label-warning">재답변처리</span></td>
											</c:if>

											<c:if test="${selectOneQnAView.uqStatus eq '100'}">
												<td><span class="label label-default">답변완료</span></td>
											</c:if>


										</tr>
									</tbody>
								</table>

								<table class="table table-bordered ">
									<colgroup>
										<col class="col-md-4">
										<col class="col-md-8">
									</colgroup>

									<tr>
										<th class="active">Title</th>
										<td>${selectOneQnAView.uqTitle}</td>
									</tr>
									<tr>
										<th class="active">Reference</th>
										<td>${selectOneQnAView.uqRelatedLink}</td>
									</tr>
								</table>
								<div class="enter"></div>
								<p>${selectOneQnAView.uqContent}</p>

								<hr class="hr_b">
								<div class="enter"></div>

								<%--
							답변완료 건 
							 <c:if
								test="${selectOneQnAView.uqStatus eq '10' || selectOneQnAView.uqStatus eq '20' || selectOneQAView.uqStatus eq '100'}"> --%>


								<c:if test="${selectOneQnAView.uqStatus ne '1' && selectOneQnAView.uaResponser_id ne null }">
									<div class="span12">
										<div class="well">
											<h6 class="text-danger text-right">
												<strong>처리자 : ${sessionScope.selectStfLogin.stfName }
													| 처리일자 : ${selectOneQnAView.uaInsertDt} </strong>
											</h6>
											<h3 class="text-info">${selectOneQnAView.uaTitle}</h3>

											<p>${selectOneQnAView.uaContent}</p>

										</div>
									</div>
								</c:if>
							</form>



							<%-- 답변 작성 --%>
							<c:if test="${selectOneQnAView.uqStatus eq '1' && selectOneQnAView.uaResponser_id eq null }">
									<div class="span12" id="uadivForm">
								<form method="post" name="uaForm" id="uaForm">
									<input type="hidden" name="uaProfit" value="1" /> <input
										type="hidden" name="QnA_id" value="${selectOneQnAView.QnA_id}" />

										<div class="well">
											<label for="title">Title</label> <input id="uaTitle"
												name="uaTitle" placeholder="Title"
												class="form-control input-md" type="text"> <label
												for="Message">Message*</label>
											<textarea class="form-control" rows="10" id="uaContent"
												name="uaContent" placeholder="Enter Your Message *"></textarea>
											<div class="enter"></div>
											<button type="button" class="btn btn-success btn-block"
												onClick="insertQnAUaForm(this.form);">답변달기</button>
										</div>
								</form>
									</div>
							</c:if>
							<br style="clear: both">
							<p class="pull-right">

								<button type="button" class="btn btn-warning"
									onClick="javascript:history.go(-1)">BACK</button>
								<button type="button" class="btn btn-danger"
									onclick="check2(${selectOneQnAView.QnA_id})">Delete</button>
							</p>

						</div>


						<%--================================================끝========================================================== --%>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

