<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<style>
	th,td{
		text-align: center;
	}
	th{
		background-color: #F4F5F9;
	}
	
	input{
	 margin: 0 auto;
	 }
	 .modalTable{
/* 	 	width: 100%; */
/* 		border-style: hidden; */
/* 		box-shadow: 0 0 0 1px #000; */
		border-collapse: collapse;
  		border-radius: 10px;
  		border-style: hidden;
	    box-shadow: 0 0 0 1px #000;
	


	 }
 	 .modalTable td{
	 	height: 125px;
	 }
	 .modalTable th{
	 	background-color: #486DDB;
	 	color: white;
	 	height: 50px;
	 }
	 .modalTable th:first-child{
	 	border-radius: 10px 0px 0px 0px;
	 }
	 .modalTable th:last-child{
	 	border-radius: 0px 10px 0px 0px;
	 }
	 .modalTable tr:last-child > td:last-child{
	 	border-radius: 0px 0px 10px 0px;
	 }
	 .modalTable tr:last-child > td:nth-last-child(2){
	 	border-radius: 0px 0px 0px 10px;
	 }

	 .modalTable td,.modalTable th{
	 	border: 1px solid gray;  
	 }
	 .modalTable tr:nth-child(even){
	 	background-color: #F7F8FB;
	 }
	 .modalTable tr:nth-child(odd){
	 	background-color: #FFFFFF;
	 }
	 
	 input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
/*  @media print { */
/*  .printDiv{ */
/*   background-color: #F4F5F9; */
/*  } */
/* } */
@media print {
	* {
		-webkit-print-color-adjust: exact;
		print-color-adjust: exact;
    }
}
button.top {
  position: fixed;
  right: 16%;
  bottom : 350px;
  display: none;
}
	td{
		background-color: white;
	}
</style>
<body>
	<div class="card shadow mb-4" style="width: 100%; height: 750px;">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" style="cursor: pointer;" onclick="javascript:location.href='/professor/study/list?pageNo=1'">강의 상세</h6>
		</div>
		<div class="card-body">			
					<div class="row">
						<div class="col-sm-12">
						<br/>
							<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 90%; margin-left: 4%;">
								<tr role="row">
									<th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 12%;">
										교과 번호
									</th>
									<td class="sorting_1" style="width: 10%;">${lectureOpenVO.subjNum}</td>
									<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 10%;">
										강의명
									</th>
									<td style="text-align: left;">${lectureOpenVO.lectName}</td>
									<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 10%;">
										담당교수
									</th>
									<td>${lectureOpenVO.profId}</td>
								</tr>
							</table><br/>
							<form method="get" action="/professor/study/update" name="detailModify" id="detailModify">
								<input type="hidden" value="${lectureOpenVO.lectOpenNum}" name="lectOpenNum">
								<input type="hidden" value="${param.pageNo}" name="pageNo">
							<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 90%; margin-left: 4%;">
								<tr role="row" style="height:55px; ">
									<th style="width: 10%; 	vertical-align: middle;">
										개설 여부
									</th>
									<td style="width: 10%; 	vertical-align: middle;">
										${lectureOpenVO.procStatCode}
									</td>
									<th style="width: 8%; 	vertical-align: middle;">
										강의실
									</th>
									<td style="width: 20%; 	vertical-align: middle; padding:0px 0px 0px 12px; text-align: left;">
										<input type="text" value="${lectureOpenVO.buildName}(${lectureOpenVO.buildCode}) / ${fn:substring(lectureOpenVO.roomNum,2,4) }층 ${fn:substring(lectureOpenVO.roomNum,4,6)}호" id="roomNum" name="" class="form-control modifyLect" style="display: none; float: left; width: 75%; text-align: center; background-color: white; margin-left: 2%;" readonly="readonly" disabled="disabled">
										<input type="hidden" value="${lectureOpenVO.roomNum}" id="roomIdnNum" name="roomIdnNum" class="form-control modifyLect" style="display: none; float: left; width: 75%; text-align: center; background-color: white;" readonly="readonly" disabled="disabled">
										<button type="button" class="btn btn-secondary modifyLect" onclick="fn_room()" style="display: none; border: 1px solid gray; float: left;  margin-left: 1%;" disabled="disabled">추가</button>
<!-- 										<input type="button" value="검색" class="form-control modifyLect" style="display: none; float: left;" disabled="disabled" onclick="fn_room()"> -->
										<span class="currentLect" style="text-align: left;">
											${lectureOpenVO.buildName}(${lectureOpenVO.buildCode}) <br/> ${fn:substring(lectureOpenVO.roomNum,2,4) }층 ${fn:substring(lectureOpenVO.roomNum,4,6)}호
										</span>
									</td>
									<th style="width: 8%; 	vertical-align: middle;">
										학기/년도
									</th>
									<td style="width: 20%; 	vertical-align: middle;">
										${lectureOpenVO.semCode}/${lectureOpenVO.year}
									</td>
									<th style="width: 10%; vertical-align: middle;">
											최대 인원
									</th>
									<td style="vertical-align: middle; padding: 0px;">
										<input type="text" numberOnly value="${lectureOpenVO.maxStdCnt}" id="maxStdCnt" name="maxStdCnt" class="form-control modifyLect" style="width: 94%; display: none; text-align: center;" disabled="disabled" maxlength="3">
										<span class="currentLect">${lectureOpenVO.maxStdCnt}</span>
									</td>
							
								</tr>
								<tr style="height:55px; ">
									<th style="width: 8%; vertical-align: middle;">
										분반
									</th>
									<td style="vertical-align: middle; padding: 0px;">
										<select class="form-control modifyLect" id="divideNum" name="divideNum" style="width:80%; padding: 0px; text-align:center;  padding-left: 0px; margin-left: 10%; display: none;" disabled="disabled">
											<option <c:if test="${lectureOpenVO.divideNum eq 1}">selected</c:if> value="01">01</option>
											<option <c:if test="${lectureOpenVO.divideNum eq 2}">selected</c:if> value="02">02</option>
											<option <c:if test="${lectureOpenVO.divideNum eq 3}">selected</c:if> value="03">03</option>
											<option <c:if test="${lectureOpenVO.divideNum eq 4}">selected</c:if> value="04">04</option>
											<option <c:if test="${lectureOpenVO.divideNum eq 5}">selected</c:if> value="05">05</option>
										</select>
<%-- 										<input type="text" numberOnly maxlength="2" value="${lectureOpenVO.divideNum}" id="divideNum" name="divideNum" class="form-control modifyLect" style="width: 65px; display: none; text-align: center;" disabled="disabled"> --%>
										<span class="currentLect">${lectureOpenVO.divideNum}</span>
									</td>
									<th style="width: 10%; vertical-align: middle;">
										교과 구분
									</th>
									<td style="vertical-align: middle;">
										${lectureOpenVO.subjTypeCode}
									</td>
									<th style="width: 8%; vertical-align: middle;">
										학점
									</th>
									<td style="width: 10%; 	vertical-align: middle;">
										${lectureOpenVO.cred}학점
									</td>
									<th style="width: 10%; vertical-align: middle;">
											현재 인원 
									</th>
									<td style="vertical-align: middle;">
										${lectureOpenVO.stdCnt}
									</td>	
										
								</tr>
								<tr>
									<th style="width: 10%;">
											신청 일자
									</th>
									<td colspan="3" style="text-align: left; padding-left: 38px;">
											${lectureOpenVO.applyDate}
									</td>
									<th style="width: 10%;">
											폐강 여부
									</th>
									<td colspan="3" style="text-align: left; padding-left: 38px;">
										<c:if test="${lectureOpenVO.closeYn =='N'}">폐강되지 않았습니다.</c:if>
										<c:if test="${lectureOpenVO.closeYn =='Y'}">폐강되었습니다.</c:if>
											
									</td>
								</tr>
								<tr style="height:55px; ">
									<th style="width: 10%; vertical-align: middle;">
											강의 시간
									</th>
									<!-- ==================================== 강의시간 ==================================== -->
									<td colspan="7" style="text-align: left; vertical-align: middle; padding: 0px 0px 0px 1%;">&nbsp;&nbsp;&nbsp;&nbsp;
										<span class="currentLect">${lectureOpenVO.lectTime}</span>
										<!-- ==================================== 강의시간1 ==================================== -->
										<div class="modifyLect" style="width: 98%; margin-top: -8px; height: 50px; display: none;" disabled="disabled">
											<span style="float: left; margin-top: 6px;">&nbsp;강의시간(1)&nbsp;</span>
											<select class="form-control" name="day1" id="day1" style="margin-left: 5px; width:8%; padding: 0px;  border-radius: 5px; text-align: center; float: left;" >
												<option value="">--요일--</option>
												<option value="01">월요일</option>
												<option value="02">화요일</option>
												<option value="03">수요일</option>
												<option value="04">목요일</option>
												<option value="05">금요일</option>
												<option value="06">토요일</option>
												<option value="07">일요일</option>
											</select>
											<select class="form-control" style="text-align:center; padding: 0px; width:22%; border-radius: 5px; float: left; margin-left: 1%;" name="startTime1" id="startTime1">
												<option value="">------------교시------------</option>
												<c:forEach var="i" begin="1" end="15">
													<option value="${i}">
														<c:if test="${(i+8)<10}">${i}교시 (0${i+8}:00~0${i+8}:50)</c:if>
														<c:if test="${(i+8)>=10}">${i}교시 (${i+8}:00~${i+8}:50)</c:if>
													</option>
												</c:forEach>
											</select>
											<span style="float: left; margin-top: 5px; margin-left: 1%;">~</span>
											<select class="form-control" style="text-align:center; width:22%; padding: 0px;  border-radius: 5px; float: left; margin-left: 1%;" name="endTime1" id="endTime1">
												<option value="">------------교시------------</option>
											</select>
											<button type="button" class="btn btn-secondary modifyLect" id="timeAdd1" style="border: 1px solid gray; float: left;  margin-left: 1%;">추가</button><span style="float: left;">&nbsp;</span>
											<button type="button" class="btn btn-secondary modifyLect" id="timeDelete1" style="border: 1px solid gray; float: left; margin-right: 1%;">삭제</button>
											<input type="text" value="" id="lectTime1" name="lectTime1" class="form-control modifyLect" style="margin:0px; height:38px; font-weight:bold; width: 15%; padding: 8px; background-color: #F1F2F8; float: left;" readonly="readonly" >
											<input type="hidden" value="" id="dayCode1" name="dayCode1" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
											<input type="hidden" value="" id="period1" name="period1" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
											<input type="hidden" value="" id="period2" name="period2" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
											<input type="hidden" value="" id="period3" name="period3" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
										</div>
										<!-- ==================================== 강의시간2 ==================================== --> 
										<div class="modifyLect" style="width: 98%;  height: 50px; display: none;" disabled="disabled">
											<span style="float: left; margin-top: 6px; ">&nbsp;강의시간(2)&nbsp;</span>
											<select class="form-control" style="margin-left: 5px; width:8%; padding: 0px;  border-radius: 5px; text-align: center; float: left;" id="day2" name="day2">
												<option value="">--요일--</option>
												<option value="01">월요일</option>
												<option value="02">화요일</option>
												<option value="03">수요일</option>
												<option value="04">목요일</option>
												<option value="05">금요일</option>
												<option value="06">토요일</option>
												<option value="07">일요일</option>
											</select>
											<select class="form-control" style="text-align:center; padding: 0px; width:22%; border-radius: 5px; float: left; margin-left: 1%;" id="startTime2">
												<option value="">------------교시------------</option>
												<c:forEach var="i" begin="1" end="15">
													<option value="${i}">
														<c:if test="${(i+8)<10}">${i}교시 (0${i+8}:00~0${i+8}:50)</c:if>
														<c:if test="${(i+8)>=10}">${i}교시 (${i+8}:00~${i+8}:50)</c:if>
													</option>
												</c:forEach>
											</select>
											<span style="float: left; margin-top: 5px; margin-left: 1%;">~</span>
											<select class="form-control" style="text-align:center; width:22%; padding: 0px;  border-radius: 5px; float: left; margin-left: 1%;" id="endTime2">
												<option value="">------------교시------------</option>
											</select>
											<button type="button" class="btn btn-secondary modifyLect" id="timeAdd2" style="border: 1px solid gray; float: left;  margin-left: 1%;">추가</button><span style="float: left;">&nbsp;</span>
											<button type="button" class="btn btn-secondary modifyLect" id="timeDelete2" style="border: 1px solid gray; float: left; margin-right: 1%;">삭제</button>
											<input type="text" value="" id="lectTime2" name="lectTime2" class="form-control modifyLect" style="margin:0px; height:38px; font-weight:bold; width: 15%; padding: 8px; background-color: #F1F2F8; float: left;" readonly="readonly" >
											<input type="hidden" value="" id="dayCode2" name="dayCode2" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
											<input type="hidden" value="" id="period4" name="period4" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
											<input type="hidden" value="" id="period5" name="period5" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
											<input type="hidden" value="" id="period6" name="period6" class="modifyLect" style="font-weight:bold; width: 25%; padding: 8px; background-color: #F1F2F8;" readonly="readonly" >
										</div>
									</td>
									<!-- ==================================== 강의시간 끝 ==================================== -->
								</tr>
								
								<tr>
									<th style="width: 12%; vertical-align: middle; height: 150px;">
											미승인 사유
									</th>
									<td colspan="7" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;
											${lectureOpenVO.disauthRsn}
									</td>
								</tr>
							</table>
							</form>		
						</div>
						
					</div>
					
						<a href="#" class="btn btn-secondary btn-icon-split" id="mdButton" data-toggle="modal" data-target="#myModal" style="margin-left: 4%;">
                            <span class="text">강의계획서
                            </span>
                        </a>
						<div class="row" style=" float: right; margin-right: 7%;">
						
							<div class="row" id="divFooter1" style=" float: right; display:none;">
								<button type="button" class="btn btn-primary" id="btnSubmit" style="width: 120px;" onclick="btnSubmit()">저장</button> 
	                 		    <button type="button" class="btn btn-default" style="background-color: white; border-color: gray; width: 120px;" onclick="location.href='/professor/study/detail?pageNo=1&lectOpenNum=${lectureOpenVO.lectOpenNum}'">취소</button>
							</div>		
							<div class="row" id="divFooter2" style=" float: right; display: block;">
								<button type="button" class="btn btn-primary" id="btnEdit" style="width: 120px;">수정</button>
								<button type="button" class="btn btn-default" style="background-color: white; border-color: gray; width: 120px;" id="btnRemove" onclick="lectRemove()">삭제</button>
								<button type="button" class="btn btn-default" style="background-color: white; border-color: gray; width: 120px;" onclick="location.href='/professor/study/list?pageNo=${param.pageNo}&selectYear=${param.selectYear}&selectSemester=${param.selectSemester}&searchKeyword=${param.searchKeyword}'">목록</button>
							</div>
						</div>	
					<form action="/professor/study/delete" method="post" id="frmDelete" name="frmDelete">
						<input type="hidden" value="${lectureOpenVO.lectOpenNum}" name="lectOpenNum">
						<input type="hidden" value="${param.pageNo}" name="pageNo">
					</form>
			</div>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------- -->
 <!--강의 계획서 Modal -->
<form name="classPlanFrm" id="classPlanFrm" >
  <div class="modal fade bd-example-modal-xl" id="myModal" role="dialog"  data-backdrop="static"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog modal-xl">
      <!-- Modal content-->
      <div class="modal-content" style="border-radius:20px 20px 8px 8px !important; border: 0px;">
        <div class="modal-header" style="background-color: #486DDB; border-radius: 8px 8px 0px 0px !important; width: 100%;" >
          <p class="modal-title" style="color: white; font-weight: bold; ">강의 계획서</p> <!-- 사용자 지정 부분② : 타이틀 -->
          <button type="button" class="close" data-dismiss="modal" style="color: white;" onclick="existModal()">×</button>
        </div>
        <div class="modal-body">
        	<button type="button" class="btn btn-secondary" style="float: left;" onclick="fn_print_capture()">인쇄 & 저장</button>
        	<!-- 수정 버튼 -->
          	<div class="row" id="divFooterModal1" style=" float: right; display:none; margin-right: 10px;">
				<button type="button" class="btn btn-secondary" style="width: 120px;" id="sampleData">샘플데이터</button> 
				<button type="button" class="btn btn-primary" style="width: 120px;" id="btnSubmitModal">저장</button> 
      		    <button type="button" class="btn btn-default" style="background-color: white; border-color: gray; width: 120px;" id="btnCancelModal">취소</button>
			</div>		
			<div class="row" id="divFooterModal2" style=" float: right; display: block; margin-right: 10px;">
				<button type="button" class="btn btn-primary" id="btnEditModal" style="width: 120px;" >수정</button>
			</div>
        	<button type="button" class="btn btn-secondary top" style="border:1px solid gray; width: 60px; height: 60px; background-color: white; color: black; font-weight: bold;">Top</button>
        	
        	

        	<br><br>
        	<div id="box_pdf_content">
          	<div class="printDiv" style="border-radius: 10px; border:1px solid gray; padding: 2% 3% 3% 3%; height: 300px; background-color: #F4F5F9;">
          		<input type="hidden" value="${syllabusvo.sylNum}" name="sylNum" id="sylNum"> <!-- 강의계획서 번호 히든 -->
          		 
          		<div style="float: left; width: 22%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">교과 번호</span> <br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${lectureOpenVO.subjNum}" disabled="disabled" > <!-- 학수번호 -->
          			<input type="hidden" name="subjNum" value="${lectureOpenVO.subjNum}" > <!-- 학수번호 -->
          			
          		</div>
          		<div style="float: left; width: 22%; margin-left: 4%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">담당교수</span> <br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;"  value="${lectureOpenVO.profId}" disabled="disabled"> <!--  담당교수 -->
          			<input type="hidden" name="profId" value="${lectureOpenVO.profId}"> <!--  담당교수 -->
          		</div>
          		<div style="float: left; width: 22%; margin-left: 4%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">E-mail</span><br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${syllabusvo.email}" disabled="disabled"> <!--  E-mail --> 
          			<input type="hidden" name="email" value="${syllabusvo.email}"> <!--  E-mail --> 
          		</div>
          		<div style="float: left; width: 22%; margin-left: 4%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">분반</span> <br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${lectureOpenVO.divideNum}" disabled="disabled"> <!--  분반 -->
          			<input type="hidden"  value="${lectureOpenVO.divideNum}"> <!--  분반 -->
          		</div>
          		 
          		<div style="float: left; width: 22%; margin-top: 1%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">전화번호</span><br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${syllabusvo.phNum}" disabled="disabled"> <!--  전화번호 -->
          			<input type="hidden" value="${syllabusvo.phNum}"> <!--  전화번호 -->
          		</div> 
          		<div style="float: left; width: 22%; margin:1% 0% 0% 4%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">강의방법 </span><br/>
          			<input class="okModify" name="lectMethod" id="lectMethod" type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${syllabusvo.lectMethod}" disabled="disabled"> <!--  강의방법 -->
          		</div> 
          		<div style="float: left; width: 22%; margin:1% 0% 0% 4%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">개설학과(부)</span><br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${lectureOpenVO.univDeptNum}" disabled="disabled"> <!--  개설학과 -->
          			<input type="hidden"  value="${lectureOpenVO.univDeptNum}"> <!--  개설학과 -->
          		</div> 
          		<div style="float: left; width: 22%; margin:1% 0% 0% 4%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">교과구분 </span><br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${lectureOpenVO.subjTypeCode}" disabled="disabled"> <!--  교과구분 -->
          			<input type="hidden" value="${lectureOpenVO.subjTypeCode}"> <!--  교과구분 -->
          		</div> 
        
        
        		<div style="float: left; width: 48%; margin-top: 1%;">
          			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">교과목명 </span><br/>
          			<input type="text" style="border-radius:6px; border: 1px solid gray; height: 40px; width: 100%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" value="${lectureOpenVO.lectName}" disabled="disabled"> 
          			<input type="hidden" value="${lectureOpenVO.lectName}"> 
          		</div> 
          	</div>
          	<br/>
          	<div class="printDiv" style="border-radius: 10px; border:1px solid gray; padding: 15px 2% 1% 2%; height: 220px; background-color: #F4F5F9;">
	       			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold; color: black;">강의 개요(Course Description) </span><br/>
	       			<textarea class="okModify" id="lectOvr" name="lectOvr" rows="5" cols="33" style="border-radius:5px; border: 1px solid gray; width: 99%; margin: 6px; resize: none; padding: 12px; background-color: #F1F2F8;" disabled="disabled" >${syllabusvo.lectOvr}</textarea>
          		
          	</div>
          	
          	<br/>
          	<div class="printDiv" style="border-radius: 10px; border:1px solid gray; padding: 15px 2% 1% 2%; height: 220px; background-color: #F4F5F9;">
	       			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold; color: black;">수업 목표 (Course Objective) </span><br/>
	       			<textarea class="okModify" rows="5" cols="33" style="border-radius:5px; border: 1px solid gray; width: 99%; margin: 6px; resize: none; padding: 12px; background-color: #F1F2F8;" disabled="disabled" name="lectGoal" id="lectGoal">${syllabusvo.lectGoal}</textarea>
          	</div>
          	<br/>
	        <div class="printDiv" style="border-radius: 10px; border:1px solid gray; padding: 15px 2% 2% 2%; height: 190px; background-color: #F4F5F9;">
	        		<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold; color: black;">평가 방법 (Grading Policy) </span><br/>
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 6%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">중간고사 </span>
			   		    <input class="okModify" type="text" numberOnly plusResult maxlength="3" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px; background-color: #F1F2F8;" id="midReflectPer" name="midReflectPer" value="${syllabusvo.midReflectPer}" disabled="disabled"> 
		  		    </div> 
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 0%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">기말고사 </span>
			   		    <input class="okModify" type="text" numberOnly plusResult maxlength="3" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px; background-color: #F1F2F8;" id="finalReflectPer" name="finalReflectPer" value="${syllabusvo.finalReflectPer}" disabled="disabled"> 
		  		    </div> 
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 0%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">출석 </span>
			   		    <input class="okModify" type="text" numberOnly plusResult maxlength="3" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px; background-color: #F1F2F8;" id="attendReflectPer" name="attendReflectPer" value="${syllabusvo.attendReflectPer}" disabled="disabled">  
		  		    </div> 
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 0%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">과제 </span>
			   		    <input class="okModify" type="text" numberOnly plusResult maxlength="2" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px; background-color: #F1F2F8;" id="assignRelectPer" name="assignRelectPer" value="${syllabusvo.assignRelectPer}" disabled="disabled"> 
		  		    </div> 
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 0%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">퀴즈 </span>
			   		    <input class="okModify" type="text" numberOnly plusResult maxlength="2" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px; background-color: #F1F2F8;" id="quizReflectPer" name="quizReflectPer" value="${syllabusvo.quizReflectPer}" disabled="disabled"> 
		  		    </div> 
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 0%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">토론 </span>
			   		    <input class="okModify" type="text" numberOnly plusResult maxlength="2" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px; background-color: #F1F2F8;" name="debateReflectPer" id="debateReflectPer" value="${syllabusvo.debateReflectPer}" disabled="disabled"> 
		  		    </div> 
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 6%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">기타 </span>
			   		    <input class="okModify" type="text" numberOnly plusResult maxlength="2" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px; background-color: #F1F2F8;" id="otherReflectPer" name="otherReflectPer" value="${syllabusvo.otherReflectPer}" disabled="disabled"> 
		  		    </div> 
	        		<div style="float: left; width: 15%; margin:1% 0% 0% 0%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">합계 </span>
			   		    <input type="text" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 30%; margin: 6px; padding-left: 8px;" value="" disabled="disabled" id="resultPlus"><span style="font-weight: bold;">%</span> 
		  		    </div> 
	        </div>
	        <br/>
	        <div class="printDiv" style="border-radius: 10px; border:1px solid gray; padding: 15px 2% 2% 2%; height: 120px; background-color: #F4F5F9;">
	        		<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold; color: black;">교재 및 참고서 </span><br/>
	        		<div style="float: left; width: 40%; margin:1% 0% 0% 6%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">주교재 </span>
			   		    <input class="okModify" type="text" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 80%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" disabled="disabled" id="mainTxtb" name="mainTxtb" value="${syllabusvo.mainTxtb}"> 
		  		    </div> 		
	        		<div style="float: left; width: 40%; margin:1% 0% 0% 6%;">
			   		    <img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold;">부교재 </span>
			   		    <input class="okModify" type="text" style="border-radius:6px; border: 1px solid gray; height: 35px; width: 80%; margin: 6px; padding-left: 12px; background-color: #F1F2F8;" disabled="disabled" id="secTxtb" name="secTxtb" value="${syllabusvo.secTxtb}"> 
		  		    </div> 		
        	</div>
        	<br/>
        	<div class="printDiv" style="border-radius: 10px; border:1px solid gray; padding: 15px 2% 2% 2%; height: 100%; background-color: #F4F5F9;">
        		<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold; color: black;">수업 내용</span><br/>
        		<br/>
	        		<table class="modalTable" style="width: 99%; margin: 6px;">
			          	<tr>
			          		<th>주</th>
			          		<th>수업 주제</th>
			          	</tr>
			          	
			          	<tr>
			          		<td>1</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w1LectPlan" name="w1LectPlan">${syllabusvo.w1LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>2</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w2LectPlan" name="w2LectPlan">${syllabusvo.w2LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>3</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w3LectPlan" name="w3LectPlan">${syllabusvo.w3LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>4</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w4LectPlan" name="w4LectPlan">${syllabusvo.w4LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>5</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w5LectPlan" name="w5LectPlan">${syllabusvo.w5LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>6</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w6LectPlan" name="w6LectPlan">${syllabusvo.w6LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>7</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w7LectPlan" name="w7LectPlan">${syllabusvo.w7LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>8</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w8LectPlan" name="w8LectPlan">${syllabusvo.w8LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>9</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w9LectPlan" name="w9LectPlan">${syllabusvo.w9LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>10</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w10LectPlan" name="w10LectPlan">${syllabusvo.w10LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>11</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w11LectPlan" name="w11LectPlan">${syllabusvo.w11LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>12</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w12LectPlan" name="w12LectPlan">${syllabusvo.w12LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>13</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w13LectPlan" name="w13LectPlan">${syllabusvo.w13LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>14</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w14LectPlan" name="w14LectPlan">${syllabusvo.w14LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>15</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w15LectPlan" name="w15LectPlan">${syllabusvo.w15LectPlan}</textarea></td>
			          	</tr>
			          	<tr>
			          		<td>16</td>
			          		<td style="width: 90%;"><textarea class="okModify" rows="3" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 92%; margin: 20px 15px 15px 15px; resize: none; padding: 12px;" id="w16LectPlan" name="w16LectPlan">${syllabusvo.w16LectPlan}</textarea></td>
			          	</tr>
			          
	          		</table>
        	</div>
        	<br/>
        	<div class="printDiv" style="border-radius: 10px; border:1px solid gray; padding: 15px 2% 1% 2%; height: 220px; background-color: #F4F5F9;">
	       			<img alt="mainlogo" src="/resources/img/buttonImg.PNG" ><span style="font-weight: bold; color: black;">기타 사항</span><br/>
	       			<textarea class="okModify" rows="5" cols="33" disabled="disabled" style="background-color: #F1F2F8; border-radius:5px; border: 1px solid gray; width: 99%; margin: 6px 6px 6px 6px; resize: none; padding: 12px;" id="otherthings" name="otherthings">${syllabusvo.otherthings}</textarea>
          	</div>
          	</div>
          	<br/>
          	
				<button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right; width: 120px;">나가기</button>
          	
      
    </div>
  </div>
 </div>
 </div>
 </form>
<br/><br/>

<!--강의 계획서 Modal 끝 -->
<!-- ------------------------------------------------------------------------------------------------------------- -->
<!-- 아래에서 data-toggle과 data-target 속성에서 data-toggle에는 modal 값을 data-target속성에는 모달 창 전체를 
&nbsp;&nbsp;<button type="button" data-toggle="modal" data-target="#myModal">모달 창 열기</button>
&nbsp;&nbsp;<a data-toggle="modal" href="#myModal">모달 창 열기</a>
감싸는 div의 id 이름을 지정하면 된다. -->






</body>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
function objectifyForm(formArray) {//serializeArray data function 
	var returnArray = {}; 
		for (var i = 0; i < formArray.length; i++) { 
			returnArray[formArray[i]['name']] = formArray[i]['value']; 
		} 
	return returnArray;
}

	$(function () {
		var midReflectPer = parseInt($("#midReflectPer").val());
		var finalReflectPer = parseInt($("#finalReflectPer").val());
		var attendReflectPer = parseInt($("#attendReflectPer").val());
		var assignRelectPer = parseInt($("#assignRelectPer").val());
		var quizReflectPer = parseInt($("#quizReflectPer").val());
		var debateReflectPer = parseInt($("#debateReflectPer").val());
		var otherReflectPer = parseInt($("#otherReflectPer").val());
		
		var result = midReflectPer + finalReflectPer + attendReflectPer + assignRelectPer + quizReflectPer
		 			+ debateReflectPer + otherReflectPer;
		
		$("#resultPlus").val(result);	
		
		if("${lectureOpenVO.procStatCode}" != '접수'){
			$("#btnEdit").css('display',"none");
			$("#btnRemove").css('display',"none");
		}
	
		$("#btnEdit").on("click",function(){
			//입력란의 읽기전용을 해제
			//버튼 영역 처리
			$(".modifyLect").css("display","block");	//확인 취소
			$(".currentLect").css("display","none");		//수정 삭제 목록
			$(".modifyLect").prop("disabled",false);
			
			//버튼 영역 처리
			$("#divFooter1").css("display","block");	//확인 취소
			$("#divFooter2").css("display","none");		//수정 삭제 목록
			
		});
		
		$("#btnSubmit").click(function() {
// 			$(".selectOption").prop("disabled",true);
			$(".modifyLect").prop("disabled",true);
			//버튼 영역 처리
			$(".modifyLect").css("display","none");	//확인 취소
			$(".currentLect").css("display","block");		//수정 삭제 목록
			
			$("#divFooter1").css("display","none");	//확인 취소
			$("#divFooter2").css("display","block");		//수정 삭제 목록
			

		});
		
		//모달 수정 버튼
		$("#btnEditModal").on("click",function(){
			//입력란의 읽기전용을 해제
			//버튼 영역 처리
			$(".okModify").prop("disabled",false);
			$(".okModify").css("background-color","white");
			
			//버튼 영역 처리
			$("#divFooterModal1").css("display","block");	//확인 취소
			$("#divFooterModal2").css("display","none");		//수정 삭제 목록
			
		});
		//샘플데이터 넣기
		$("#sampleData").on("click",function(){
			$("#lectMethod").val('면대면');
			$("#lectOvr").val('강의 개요 샘플입니다.');
			$("#lectGoal").val('강의 목표 샘플입니다.');
			//평가방법
			$("#midReflectPer").val('30');
			$("#finalReflectPer").val('40');
			$("#attendReflectPer").val('10');
			$("#assignRelectPer").val('5');
			$("#quizReflectPer").val('5');
			$("#debateReflectPer").val('5');
			$("#otherReflectPer").val('5');
			$("#resultPlus").val('100');
			$("#mainTxtb").val('자바의 정석');
			$("#secTxtb").val('쉽게 배우는 자바');
			$("#otherthings").val('기타 내용 입니다.');
			
			//주차
			$("#w1LectPlan").val('1주차 강의 내용');
			$("#w2LectPlan").val('2주차 강의 내용');
			$("#w3LectPlan").val('3주차 강의 내용');
			$("#w4LectPlan").val('4주차 강의 내용');
			$("#w5LectPlan").val('5주차 강의 내용');
			$("#w6LectPlan").val('6주차 강의 내용');
			$("#w7LectPlan").val('7주차 강의 내용');
			$("#w8LectPlan").val('8주차 강의 내용');
			$("#w9LectPlan").val('9주차 강의 내용');
			$("#w10LectPlan").val('10주차 강의 내용');
			$("#w11LectPlan").val('11주차 강의 내용');
			$("#w12LectPlan").val('12주차 강의 내용');
			$("#w13LectPlan").val('13주차 강의 내용');
			$("#w14LectPlan").val('14주차 강의 내용');
			$("#w15LectPlan").val('15주차 강의 내용');
			$("#w16LectPlan").val('16주차 강의 내용');
		});
		//모달 수정 취소 버튼	
		$("#btnCancelModal").on("click",function(){
			//원래 값으로 바꾸기
			$("#lectMethod").val('${syllabusvo.lectMethod}');
			$("#lectOvr").val('${syllabusvo.lectOvr}');
			$("#lectGoal").val('${syllabusvo.lectGoal}');
			//평가방법
			$("#midReflectPer").val('${syllabusvo.midReflectPer}');
			$("#finalReflectPer").val('${syllabusvo.finalReflectPer}');
			$("#attendReflectPer").val('${syllabusvo.attendReflectPer}');
			$("#assignRelectPer").val('${syllabusvo.assignRelectPer}');
			$("#quizReflectPer").val('${syllabusvo.quizReflectPer}');
			$("#debateReflectPer").val('${syllabusvo.debateReflectPer}');
			$("#otherReflectPer").val('${syllabusvo.otherReflectPer}');
			$("#mainTxtb").val('${syllabusvo.mainTxtb}');
			$("#secTxtb").val('${syllabusvo.secTxtb}');
			$("#otherthings").val('${syllabusvo.otherthings}');
			
			//주차
			$("#w1LectPlan").val('${syllabusvo.w1LectPlan}');
			$("#w2LectPlan").val('${syllabusvo.w2LectPlan}');
			$("#w3LectPlan").val('${syllabusvo.w3LectPlan}');
			$("#w4LectPlan").val('${syllabusvo.w4LectPlan}');
			$("#w5LectPlan").val('${syllabusvo.w5LectPlan}');
			$("#w6LectPlan").val('${syllabusvo.w6LectPlan}');
			$("#w7LectPlan").val('${syllabusvo.w7LectPlan}');
			$("#w8LectPlan").val('${syllabusvo.w8LectPlan}');
			$("#w9LectPlan").val('${syllabusvo.w9LectPlan}');
			$("#w10LectPlan").val('${syllabusvo.w10LectPlan}');
			$("#w11LectPlan").val('${syllabusvo.w11LectPlan}');
			$("#w12LectPlan").val('${syllabusvo.w12LectPlan}');
			$("#w13LectPlan").val('${syllabusvo.w13LectPlan}');
			$("#w14LectPlan").val('${syllabusvo.w14LectPlan}');
			$("#w15LectPlan").val('${syllabusvo.w15LectPlan}');
			$("#w16LectPlan").val('${syllabusvo.w16LectPlan}');
			
			//입력란의 읽기전용을 해제
			//버튼 영역 처리
			$(".okModify").prop("disabled",true);
			$(".okModify").css("background-color","#F1F2F8");
			
			//버튼 영역 처리
			$("#divFooterModal1").css("display","none");	//확인 취소
			$("#divFooterModal2").css("display","block");		//수정 삭제 목록
			
				
		});//모달 수정 취소 버튼	끝
		
		$("#btnSubmitModal").on("click",function(){
			var classPlanFrmSerialArray = $('#classPlanFrm').serialize() ;
// 			console.log(queryString);
			var classPlanFrmSerialArray = $("#classPlanFrm").serializeArray(); 
			var classPlanFrm = JSON.stringify(objectifyForm(classPlanFrmSerialArray));	
			
			
			$.ajax({
				type:"post"
				,url:"/professor/classPlan/classPlanUpdate"
				,data:classPlanFrm	//보낼 데이터
				,contentType:"application/json"
				,cache:false
				,success:function(data){
					if(data == 1){
						$(".okModify").prop("disabled",true);
						$(".okModify").css("background-color","#F1F2F8");
						
						//버튼 영역 처리
						$("#divFooterModal1").css("display","none");	//확인 취소
						$("#divFooterModal2").css("display","block");		//수정 삭제 목록
					}else{
						alert("입력 실패했습니다.");
					}
				}
			});
		});
		
		//최대인원, 분반 숫자만 입력받도록
		$("input:text[numberOnly]").on("keyup", function() {
			var regExp =RegExp(/[^0-9]/g);
			if(regExp.test($(this).val())){
				alert("숫자만 입력해주세요");
			}
		      $(this).val($(this).val().replace(/[^0-9]/g,""));
		   });
		//최대인원, 분반 숫자만 입력받도록
		$("input:text[plusResult]").on("keyup", function() {	
			var midReflectPer = parseInt($("#midReflectPer").val());
			var finalReflectPer = parseInt($("#finalReflectPer").val());
			var attendReflectPer = parseInt($("#attendReflectPer").val());
			var assignRelectPer = parseInt($("#assignRelectPer").val());
			var quizReflectPer = parseInt($("#quizReflectPer").val());
			var debateReflectPer = parseInt($("#debateReflectPer").val());
			var otherReflectPer = parseInt($("#otherReflectPer").val());
			
			var result = midReflectPer + finalReflectPer + attendReflectPer + assignRelectPer + quizReflectPer
			 			+ debateReflectPer + otherReflectPer;
			if(result > 100){
				alert("총 합이 100이 넘었습니다");
				
				var minus = parseInt($(this).val());
				result = result - minus;
				
				$(this).val("0");
				$("#resultPlus").val(result);		 
				return;
			}else{
				$("#resultPlus").val(result);		 
			}
			
			
		   });
		// 모달창 Top으로 이동하기 버튼
		 $('#myModal' ).scroll( function() {
	          if ( $( this ).scrollTop() > 200 ) {
	        	  $( '.top' ).fadeIn();
	          } else {
	            $( '.top' ).fadeOut();
	          }
	        } );
	        $( '.top' ).click( function() {
	          $( '#myModal' ).animate( { scrollTop : 0 }, 400 );
	          return false;
	        } );

			//========================== 시간 수정 시작 ====================================
	        $("#timeAdd1").on("click",function(){
	    		var day1Text = ($("select[name=day1] option:selected").text()).substr(0,1);
	    		var day1Val = $("select[name=day1] option:selected").val();
	    		var startTime1 = $("#startTime1").val();
	    		var intStartTime1 = parseInt($("#startTime1").val());
	    		var endTime1 =$("#endTime1").val();
	    		var intEndTime1 =parseInt($("#endTime1").val());
	    		var oneDayTime = day1Text;
	    		
	    		$('#lectTime1').val("");
	    		$('#dayCode1').val("");
	    		$('#period1').val("");
	    		$('#period2').val("");
	    		$('#period3').val("");
	    		
	    		if(day1Text == "-"){
	    			alert("요일을 선택해주세요");
	    		}else if(startTime1 == ""){
	    			alert("시간을 선택해주세요");
	    		}else{
	    			
	    			if((endTime1 - startTime1)+1 > 3){
	    				alert("하나의 강의는 하루 3시간을 넘을 수 없습니다");
	    			}else{
	    				for(var i = intStartTime1; i<=intEndTime1; i++){
	    					if(i == endTime1){
	    						oneDayTime += i + "교시";
	    					}else{
	    						oneDayTime += i+","; 			
	    					}
	    				}
	    				$('#lectTime1').val(oneDayTime);
	    				$('#dayCode1').val(day1Val);
	    				
	    				var count = 1;
	    				for(var i = intStartTime1; i<=intEndTime1; i++){
	    					$('#period'+count).val(i);	
	    					count++;
	    				}
	    			}
	    		}
	    		
	    	});
	    	 $('#startTime1').on('change', function() {
	    		 var startTime1 = isNaN(parseInt($('#startTime1').val())) ? 0 : parseInt($('#startTime1').val()); 
	    		 var endTime1 = parseInt($("#startTime1").val());
	    		 var optionLength = $("#startTime1 option").length-1;
	    		 $('#endTime1').empty();
	    		 for(var count = startTime1; count <= startTime1+2; count++){ 
//	     			 <option value=""></option> ${i}교시 (0${i+8}:00~0${i+8}:50)
	    			 if(count==0){
	    				 var option = $("<option value=''>----------교시----------</option>");
	    				 $('#endTime1').append(option);
	    				 return;
	    			 }else if((count+8)<10){
	    				 var option = $("<option value='"+count+"'>"+count+"교시 (0"+(count+8)+":00~0"+(count+8)+":50)</option>");	 
	    			 }else if(count>15){
	    				 break;
	    			 }else{
	    			 	var option = $("<option value='"+count+"'>"+count+"교시 ("+(count+8)+":00~"+(count+8)+":50)</option>"); 
	    			 }			
	                 $('#endTime1').append(option);
	             }	 
	    	 });
	    	
	    	 $("#timeDelete1").on("click",function(){
	    		 $('#lectTime1').val("");
	    		$('#dayCode1').val("");
	    		$('#period1').val("");
	    		$('#period2').val("");
	    		$('#period3').val("");
	    	 });
	    	 
	    	 $("#timeDelete2").on("click",function(){
	    		 $('#lectTime2').val("");
	    		$('#dayCode2').val("");
	    		$('#period4').val("");
	    		$('#period5').val("");
	    		$('#period6').val("");
	    	 });
	    	 
	    	 $("#timeAdd2").on("click",function(){
	    			var day2Text = ($("select[name=day2] option:selected").text()).substr(0,1);
	    			var day2Val = $("select[name=day2] option:selected").val();
	    			var startTime2 = $("#startTime2").val();
	    			var intStartTime2 = parseInt($("#startTime2").val());
	    			var endTime2 =$("#endTime2").val();
	    			var intEndTime2 =parseInt($("#endTime2").val());
	    			var oneDayTime = day2Text;
	    			
	    			$('#lectTime2').val("");
	    			$('#dayCode2').val("");
	    			$('#period4').val("");
	    			$('#period5').val("");
	    			$('#period6').val("");
	    			
	    			if(day2Text == "-"){
	    				alert("요일을 선택해주세요");
	    			}else if(startTime2 == ""){
	    				alert("시간을 선택해주세요");
	    			}else{
	    				
	    				if((endTime2 - startTime2)+1 > 3){
	    					alert("하나의 강의는 하루 3시간을 넘을 수 없습니다");
	    				}else{
	    					for(var i = intStartTime2; i<=intEndTime2; i++){
	    						if(i == endTime2){
	    							oneDayTime += i + "교시";
	    						}else{
	    							oneDayTime += i+","; 			
	    						}
	    					}
	    					
	    					//12 ~ 14
	    					
	    					var startPeriod = $("#period1").val();
	    					var endPeriod = "";
	    					if($("#period2").val() == ""){
	    						endPeriod = $("#period1").val();
	    					}else if($("#period3").val() != ""){
	    						endPeriod = $("#period3").val();
	    					}else if($("#period3").val() == "" && $("#period2").val() != ""){
	    						endPeriod = $("#period2").val();
	    					}
	    					
	    					var count = 4;
	    					for(var i = intStartTime2; i<=intEndTime2; i++){
	    						if($("#day1").val()==day2Val && (i >=parseInt(startPeriod) && i <=parseInt(endPeriod))){  //위에 강의시간과 겹치는지
	    							alert("강의시간(1)과 겹치는 시간이 있습니다.");
	    							return;
	    						}else{
	    							$('#period'+count).val(i);	
	    						}
	    						count++;
	    					}
	    					$('#lectTime2').val(oneDayTime);
	    					$('#dayCode2').val(day2Val);
	    				}
	    			}
	    			
	    		});
	    	 
	    	 $('#startTime2').on('change', function() {
	    		 var startTime2 = isNaN(parseInt($('#startTime2').val())) ? 0 : parseInt($('#startTime2').val()); 
	    		 var endTime2 = parseInt($("#startTime2").val());
	    		 var optionLength = $("#startTime2 option").length-1;
	    		 $('#endTime2').empty();
	    		 for(var count = startTime2; count <= startTime2+2; count++){ 
//	     			 <option value=""></option> ${i}교시 (0${i+8}:00~0${i+8}:50)
	    			 if(count==0){
	    				 var option = $("<option value=''>----------교시----------</option>");
	    				 $('#endTime2').append(option);
	    				 return;
	    			 }else if((count+8)<10){
	    				 var option = $("<option value='"+count+"'>"+count+"교시 (0"+(count+8)+":00~0"+(count+8)+":50)</option>");	 
	    			 }else if(count>15){
	    				 break;
	    			 }else{
	    			 	var option = $("<option value='"+count+"'>"+count+"교시 ("+(count+8)+":00~"+(count+8)+":50)</option>"); 
	    			 }			
	                 $('#endTime2').append(option);
	             }	 
	    	 });
	    	//========================== 시간 수정 끝 ====================================
	});
	

	
	
	
	function fn_room() {
		window.open("/professor/study/popup/lectureRoomList","owin","top=150,left=450,width=950,height=700");
	}
	
	function btnSubmit() {
		$("#detailModify").submit();
	}
	

	
	function lectRemove() {
		var result = confirm('삭제하시겠습니까?');

		if(result){
			$("#frmDelete").submit();
			alert("삭제되었습니다.");
		}else{//false
			return;
		}
	}
	function existModal() {
		//입력란의 읽기전용을 해제
		//버튼 영역 처리
		$(".okModify").prop("disabled",true);
		$(".okModify").css("background-color","#F1F2F8");
		
		//버튼 영역 처리
		$("#divFooterModal1").css("display","none");	//확인 취소
		$("#divFooterModal2").css("display","block");		//수정 삭제 목록
	}
	function fn_print() {
		const html = document.querySelector('html');
		const printSection = document.querySelector('#box_pdf_content').innerHTML; //프린트 영역
		const printDiv = document.createElement("DIV");
		html.appendChild(printDiv);
		printDiv.innerHTML = printSection; //printDiv에 프린트 영역 내용을 담아줌
		document.body.style.display = 'none'; //전체 hide
		window.print(); //printDiv를 프린트
		document.body.style.display = 'block'; //프린트 후 전체 show
		printDiv.style.display = 'none'; // printDiv hide

		}

		//창 닫기
		function fn_close() {
		   window.close();
		}
		
		
		
		
		
</script>
</html>