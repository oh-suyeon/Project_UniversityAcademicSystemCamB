<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="/resources/js/ddit.min.js"></script>
<body>
	<c:if test="${sessionScope.student=='01'}">
	
	<div class="card shadow mb-4" style="width: 100%;">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" id="cardHead">Q&A 등록</h6>
		</div>
		<div class="card-body">
			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">

				<form action="/common/inquiry/inquiryInsert" id="qnaFrm" method="post" enctype="multipart/form-data">
					<!-- form start -->
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="memId">ID</label> 
								<input type="text" class="form-control" name="memId" id="memId" value="${sessionScope.memberVo.memId}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="title">제목</label>
								 <input type="text" maxlength="30" class="form-control" name="title" id="title">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
								<label for="content">내용</label> 
							<div class="form-group">
								<textarea id="contentE" name="content" maxlength="1000"></textarea>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="exampleInputFile">첨부파일</label><span
									style="color: red;">*</span>
								<div class="input-group">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="fileList"
											name="fileList" multiple> <label
											class="custom-file-label" for="fileList"></label>
									</div>
								</div>
								<div id="setFileName">
									<div style="display: none;">
										<input type="checkbox" id="fileCheck" name="fileCheck">
									</div>
								</div>
							</div>
						</div>
					</div>
						<hr>

					<div class="row">
						<div class="col-sm-12 text-right">
							<button type="submit" class="btn btn-primary btn-primary-crud" id="btnSubmit">등록</button>
							<button type="button" class="btn btn-default btn-default-crud"  onclick="javascript:history.go(-1)">취소</button>
						</div>
					</div>
				</form>
				<!-- // form end -->
			</div>
		</div>
	</div>
	</c:if>
	</body>
	<script src="\resources\js\jquery.min.js"></script>
	<script type="text/javascript">
	
	 




 	$(function() {
 		$("#fileList").on("change", function(e) { // 파일 입력 유무 및 파일 확장자 검사 & 파일 이름 하단에 출력
 			$("#fileCheck").prop("checked", true);
 			fileExtnsImgPdf(e); // 확장자 검사 & 파일 이름 출력 공통 함수
 		});
 		
		CKEDITOR.replace("contentE");
		
		$("#btnSubmit").click(function() {

		var text = text.replace(/<br\/>/ig, "\n");
		var text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");

		$("#qnaFrm").submit();
		});
		
		// 자동 값 입력	      
	    $("#cardHead").click(function () {
			$("input[name='title']").val("복수전공을 하고 싶습니다");
			CKEDITOR.instances.contentE.setData('안녕하세요. 복수전공를 준비하는 학생입니다. 복수전공 신청 가능한 기준을 정확히 알려주세요. 감사합니다.')
		});
		
	}); 
 	
	</script>
	</html>