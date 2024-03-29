<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<c:set var='mainpath' value='${pageContext.request.contextPath }/static/main/' />
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>IT Working List</title>
	
	<!-- Custom fonts for this template-->
	<link href="${mainpath}vendor/fontawesome-free/css/all.min.css"
		rel="stylesheet" type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="${mainpath}css/sb-admin-2.min.css" rel="stylesheet">
	
	<script src="${mainpath}vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${mainpath}js/jquery.tablesorter.min.js"></script>
	
	<!-- Bootstrap core JavaScript-->
	<script src="${mainpath}vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${mainpath}vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${mainpath}js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${mainpath}vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<%-- <script src="${mainpath}js/demo/chart-area-demo.js"></script> --%>
	<script src="${mainpath}js/demo/chart-pie-demo.js"></script>

	<style>
		th {
			position: sticky;
			top: 0px;
			box-shadow: 0 1px 1px -1px rgba(0, 0, 0, 0.4);
			background-color: #F6F6F6;
		}
		
		tbody tr td {
			padding: 0.3rem !important;
			z-index: 1;
		}
		
		tbody tr {
			height:30px;
		}
		
		tbody tr:hover {
			background-color: #CCF6F6;
		}
		
		tbody tr.active {
			background-color: #E8F6F6;
		}
		
		.clicked {
			background-color: #E8F6F6;
		}
		
		.trstyle {
			padding: 0.3rem !important;
		}
		
		.search_condition {
			margin-top: 8px; 
			font-size: 12px; 
			width:60px; 
			text-align:right; 
			margin-left:10px;
		}
		
		.table_header {
			padding: 0.5rem !important; 
			text-align: center
		}
		
		.table_tr {
			font-size:12px;
			width:100%;
			border:none;
		}
		
		.search_data {
			font-size:12px;
			margin-left:4px;
			margin-top:2px;
		}
	</style>
</head>



<body id="page-top">
	
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="/WEB-INF/views/include/main_sidebar.jsp"></c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <c:import url="/WEB-INF/views/include/top_bar.jsp"></c:import>

                <!-- 화면 이름 아이콘 & 이름 -->
				<div class="col-auto" style="margin-left: 20px">
					<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
					<h1 class="h4 mb-0 text-gray-800" style="display: inline; margin-left: 10px">개별 항목 등록</h1>
				</div>
				
                <!-- /.container-fluid -->
				<div style='height:calc(100% - 420px); width:calc(100% - 4px);'>
					<div class="col-xl-12 col-lg-5" style='margin-left: 10px; margin-top:10px; width:calc(100% - 14px);'>
						<div class="card border-left-primary shadow h-0 py-0" style='height: 60px;'>
							<div class="card-body" style='height: 100%; width:100%; '>
								<div class="row no-gutters align-items-center" style="margin-left: -20px; margin-top: -20px;">
									<div class="col-auto"
										style='margin-left: 20px; margin-top: 12px; '>
										<i class="fas fa-calendar fa-2x text-gray-300"></i>
									</div>

									<div class="col mr-2">
										<div class="text-xs font-weight-bold text-primary text-uppercase mb-0" 
											style='margin-left: 15px; margin-top: 14px; font-size: 14px; width: 100%' id='div_left_search_header'>조회 조건</div>
									</div>

									<div class='row' style="margin-top: 10px; width:1250px;">
										<!-- 접수자 -->
										<div class='search_condition'>접수자</div>
										<select id="search_rec_user" class='search_data' style='width:120px;'>
											<c:forEach var='obj' items='${search_rec_user }'>
												<option value="${obj.BASE_CODE }">${obj.BASE_NAME }</option>
											</c:forEach>
										</select>
										
										<!-- 요청자 -->
										<div class='search_condition'>요청자</div>
										<input type='text' class='search_data' style='width:100px;' id='search_empname'>
										
										<!-- 요청 사항 -->
										<div class='search_condition'>요청 사항</div>
										<input type='text' class='search_data' id='search_req_subject'>
										
										<!-- 접수 일자 -->
										<div class='search_condition'>접수 일자</div>
										<input id='search_sdate' type="date" style="margin-left:4px;font-size:12px; width:124px; margin-top:4px" value=${getBeforeday}></td>
																            
										<div style="margin-top:2px; margin-left:2px;">~</div>
							            <input id='search_edate' type="date" style='font-size:12px;width:124px; margin-left:2px; margin-top:4px' value=${getToday}></td>
										
										<!-- 업무 상태 -->
										<div class='search_condition'>업무 상태</div>
										<select id="search_work_status" class='search_data' style='width:120px;'>
											<c:forEach var='obj' items='${search_work_status }'>
												<option value="${obj.BASE_CODE }">${obj.BASE_NAME }</option>
											</c:forEach>

										</select>
										
										<!-- 검색 버튼 -->
										<a id="btn_reset_search"> <i
											class="fas fa-search fa-1x text-gray-800"
											style='margin-left: 18px; margin-top:6px;'></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row" style='height: 100%; margin-left:5px'>
						<div class="card shadow mb-4" style='height: calc(100% - 100px); margin-top: 10px; width:70%; margin-left: 10px; '>
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style='height:52px;'>
								<h6 class="m-0 font-weight-bold text-primary" id="div_left_header">업무 Master</h6>
								<div>
									<a href="#" class="btn btn-primary btn-icon-split" id="btn_mst_add">
										<span class="icon text-white-50">
											<i class="fas fa-bolt rotate-15"></i>
										</span>
										<span class="text">Add</span>
									</a>
									<a href="#" class="btn btn-success btn-icon-split" id="btn_mst_save" style='margin-left: 5px'> 
										<span class="icon text-white-50">
											<i class="fas fa-check"></i>
										</span> 
										<span class="text">Save</span>
									</a> 
									<a href="#" class="btn btn-danger btn-icon-split" id="btn_mst_delete" style='margin-left: 5px'>
										<span class="icon text-white-50">
											<i class="fas fa-trash"></i>
										</span>
										<span class="text">Delete</span>
									</a>
								</div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<!-- Category Table List 부 -->
								<div class="card shadow mb-4" style='width: 100%; height: 100%;'>
									<div class="card-body">
										<div class="table-responsive" style='margin-left:-10px;margin-top:-10px;width: calc(100% + 20px); height:222px; border: 1px solid #DEDEDE'>
											<table class="tablesorter table table-bordered" id="BizDailyMaster" cellspacing="0" style='width:2000px; table-layout: fixed;'>
												<thead>
													<tr>
														<th style='width: 20px; padding: 0.5rem !important; text-align: center'>
															<i style='width:10px' class="fas fa-flag"></i>
														</th>
														<th class='table_header' style='width: 50px;'>접수자</th>
														<th class='table_header' style='width: 80px;'>접수 일자</th>
														<th class='table_header' style='width: 50px;'>요청자</th>
														<th class='table_header' style='width: 120px;'>요청 부서/팀</th>
														<th class='table_header' style='width: 100px;'>Subject</th>
														<th class='table_header' style='width: 135px;'>요청 사항</th>
														<th class='table_header' style='width: 160px;'>요청 세부 내역</th>
														<th class='table_header' style='width: 160px;'>분석 사항</th>
														<th class='table_header' style='width: 40px;'>난이도</th>
														<th class='table_header' style='width: 45px;'>진행률</th>
														<th class='table_header' style='width: 80px;'>상태</th>
														<th class='table_header' style='width: 80px;'>예상 종료일</th>
														<th class='table_header' style='width: 80px;'>실제 종료일</th>
														<th class='table_header' style='width: 40px;'>#</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card shadow mb-4" style='height: calc(100% - 100px); margin-top: 10px; width:calc(30% - 40px); margin-left: 10px; '>
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style='height:52px;'>
								<h6 class="m-0 font-weight-bold text-primary" id="div_left_header">업무 배치</h6>
								<div style='margin-left:40px;'>
									<a href="#" class="btn btn-primary btn-icon-split" id="btn_exec_add">
										<span class="icon text-white-50">
											<i class="fas fa-bolt rotate-15"></i>
										</span>
										<span class="text">Add</span>
									</a>
									<a href="#" class="btn btn-success btn-icon-split" id="btn_exec_save" style='margin-left: 2px'> 
										<span class="icon text-white-50">
											<i class="fas fa-check"></i>
										</span> 
										<span class="text">Save</span>
									</a> 
									<a href="#" class="btn btn-danger btn-icon-split" id="btn_exec_delete" style='margin-left: 2px'>
										<span class="icon text-white-50">
											<i class="fas fa-trash"></i>
										</span>
										<span class="text">Delete</span>
									</a>
								</div>
								<div class="dropdown no-arrow"></div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<!-- Category Table List 부 -->
								<div class="card shadow mb-4"
									style='width: 100%; height: 100%;'>
									<div class="card-body">
										<div class="table-responsive" style='margin-left:-10px;margin-top:-10px;width: calc(100% + 20px); height:calc(100% + 20px); border: 1px solid #DEDEDE'>
											<table class="tablesorter table table-bordered" id="BizDailyExecuter" cellspacing="0" style='width:400px;table-layout: fixed;'>
												<thead>
													<tr>
														<th style='width: 20px; padding: 0.5rem !important; text-align: center'>
															<i style='width:10px' class="fas fa-flag"></i>
														</th>
														<th class='table_header' style='width: 50px;'>작업자</th>
														<th class='table_header' style='width: 50px;'>비중</th>
														<th class='table_header' style='width: 150px;'>비고</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style='height:calc(100% - 574px); width:calc(100% - 16px);margin-left:10px; '>
					<div class="card shadow mb-4" style='height: calc(100% - 10px); margin-top: 2px; width:calc(100% - 10px); margin-left:5px;'>
						<!-- Card Header - Dropdown -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style='height:52px;'>
							<h6 class="m-0 font-weight-bold text-primary" id="div_left_header">업무 상세 (Detail)</h6>
							<div>
								<a href="#" class="btn btn-primary btn-icon-split" id="btn_dtl_add">
									<span class="icon text-white-50">
										<i class="fas fa-bolt rotate-15"></i>
									</span>
									<span class="text">Add</span>
								</a>
								<a href="#" class="btn btn-success btn-icon-split" id="btn_dtl_save" style='margin-left: 2px'> 
									<span class="icon text-white-50">
										<i class="fas fa-check"></i>
									</span> 
									<span class="text">Save</span>
								</a> 
								<a href="#" class="btn btn-danger btn-icon-split" id="btn_dtl_delete" style='margin-left: 2px'>
									<span class="icon text-white-50">
										<i class="fas fa-trash"></i>
									</span>
									<span class="text">Delete</span>
								</a>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body" style='height:100px;'>
							<div class="card shadow mb-4" style='width: 100%; height: 200px; margin-top:-10px;'>
									<div class="card-body">
										<div class="table-responsive" style='margin-left:-10px;margin-top:-10px;width: calc(100% + 20px); height:180px; border: 1px solid #DEDEDE'>
											<table class="tablesorter table table-bordered" id="BizDailyDetail" cellspacing="0" style='width:1570px;table-layout: fixed;'>
												<thead>
													<tr>
														<th style='width: 20px; padding: 0.5rem !important; text-align: center'>
															<i style='width:10px' class="fas fa-flag"></i>
														</th>
														<th class='table_header' style='width: 20px;'>No.</th>
														<th class='table_header' style='width: 20px;'>처리자</th>
														<th class='table_header' style='width: 100px;'>처리 사항</th>
														<th class='table_header' style='width: 20px;'>난이도</th>
														<th class='table_header' style='width: 20px;'>진행률</th>
														<th class='table_header' style='width: 40px;'>상태</th>
														<th class='table_header' style='width: 40px;'>처리 일자</th>
														<th class='table_header' style='width: 100px;'>비고</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>
								</div>
						</div>
					</div>
				</div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; IT Team Biz work 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
	<div class="modal fade" id="SaveCheckModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 600px'>
				<div class="modal-header">
					<h5 class="modal-title" id="save_check_Title"></h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" id="save_check_Body">
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button"
						data-dismiss="modal" id="btn_savecheck_yes">Yes</button>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="JustInfoModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 600px'>
				<div class="modal-header">
					<h5 class="modal-title" id="JustInfoModal_Title"></h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" id="JustInfoModal_Body">
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button"
						data-dismiss="modal" id="btn_savecheck_yes">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="findUserList" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 900px'>
				<div class="modal-header">
					<h5 class="modal-title" id="findUserList_Title">유저 검색</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 여기 직접 넣은것 -->
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<h6 style='display:none' id='findUserList_setrow'></h6>
						<!-- <div class="card-header py-3"> -->
						<div class="card-header py-3 d-flex flex-row align-items-center" style='height:52px;'>
							<h6  style='width:60px; margin-top:10px;'>부서명</h6>
							<input id="findUserList_ip_deptname" style="margin-left:4px"/>
							
							<h6  style='width:60px; margin-top:10px; margin-left:20px;'>유저명</h6>
							<input id="findUserList_ip_empname" style="margin-left:4px"/>
							
							<a id="btn_findUserList_search"> 
								<i class="fas fa-search fa-1x text-gray-800" style='margin-left: 28px; margin-top:10px;'></i>
							</a>
						</div>
						<div class="card-body">
							<div class="table-responsive" style='height:400px'>
								<table class="table table-bordered" id="findUserList_Table" width="100%" cellspacing="0" style="table-layout: fixed;">
									<thead>
										<tr>
											<th>부서/팀</th>
											<th>사원 번호</th>
											<th>성명</th>
											<th>E-MAIL</th>
											<th>ID</th>
											<th>직급</th>
											<th>직책</th>
										</tr>
									</thead>

									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="findITUserList" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 350px'>
				<div class="modal-header">
					<h5 class="modal-title" id="findITUserList_Title">유저 검색</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 여기 직접 넣은것 -->
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<h6 style='display:none' id='findITUserList_bd_seq'></h6>
						<h6 style='display:none' id='findITUserList_setrow'></h6>
						<h6 style='display:none' id='findITUserList_type'></h6>
						<!-- <div class="card-header py-3"> -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="findITUserList_Table" width="100%" cellspacing="0" style="table-layout: fixed;">
									<thead>
										<tr>
											<th class='table_header' style="width:120px">사원 번호</th>
											<th class='table_header' style="width:80px">성명</th>
										</tr>
									</thead>

									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="findSubjectList" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 900px'>
				<div class="modal-header">
					<h5 class="modal-title" id="findSujectList_Title">Subject 검색</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 여기 직접 넣은것 -->
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<h6 style='display:none' id='findSubjectList_rowindex'></h6>
						<!-- <div class="card-header py-3"> -->
						<div class="card-header py-3 d-flex flex-row align-items-center" style='height:52px;'>
							<!-- <h6  style='width:60px; margin-top:10px;'>부서명</h6>
							<input id="findUserList_ip_deptname" style="margin-left:4px"/>
							
							<h6  style='width:60px; margin-top:10px; margin-left:20px;'>유저명</h6>
							<input id="findUserList_ip_empname" style="margin-left:4px"/>
							
							<a id="btn_findUserList_search"> 
								<i class="fas fa-search fa-1x text-gray-800" style='margin-left: 28px; margin-top:10px;'></i>
							</a> -->
						</div>
						<div class="card-body">
							<div class="table-responsive" style='height:400px'>
								<table class="table table-bordered" id="findSubjectList_Table" width="100%" cellspacing="0" style="table-layout: fixed;">
									<thead>
										<tr>
											<th class='table_header' style="width:60px">SEQ</th>
											<th class='table_header' style="width:200px">Subject</th>
										</tr>
									</thead>
										
									<tbody>
										<c:forEach var="obj_subject" items="${search_subjects}">
											<tr>
				                    			<td style="text-align:center">${obj_subject.bws_seq}</td>
				                    			<td>${obj_subject.bws_content}</td>
				                    		</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

    <!-- Bootstrap core JavaScript-->
    <script src="${mainpath}vendor/jquery/jquery.min.js"></script>
    <script src="${mainpath}vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${mainpath}vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${mainpath}js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${mainpath}vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <%-- <script src="${mainpath}js/demo/chart-area-demo.js"></script> --%>
    <script src="${mainpath}js/demo/chart-pie-demo.js"></script>
	
	<script type="text/javascript">
		var login_empid = "${lub.empid}";
		var login_empname = "${lub.empname}";
		var login_userid = "${lub.userid}";
		var login_jpname = "${lub.jpname}";
		var today = "${getToday}"; 
		
		function changeFlag(rowstatus, tablename, row_index) {
			/*
			추가 : fas fa-plus
			일반 : fas fa-caret-right
			삭제 : fas fa-cut
			업데이트 : fas fa-pen
			*/
			var obj;
			var flag;
			switch (tablename) {
				case 'BizDailyMaster' :
					obj = '#bdm_flag_' + row_index;
					flag = '#BizDailyMaster tr:eq(' + (row_index+1) + ')>td:eq(16)>h6'
					break;
				case 'BizDailyDetail' :
					obj = '#BizDailyDetail tr:eq(' + (row_index+1) + ')>td:eq(0)>i'
					flag = '#BizDailyDetail tr:eq(' + (row_index+1) + ')>td:eq(10)>h6'
					break;
				case 'BizDailyExecuter' :
					obj = '#BizDailyExecuter tr:eq(' + (row_index+1) + ')>td:eq(0)>i'
					flag = '#BizDailyExecuter tr:eq(' + (row_index+1) + ')>td:eq(6)'
					break;
				default:
					return;
					break;
			}
			
			switch (rowstatus) {
				case 'U':
					//var now_status = $('#table_font_' + target_row).attr('class');
					var now_status = $(obj).attr('class');
					if (now_status != 'fas fa-plus') {
						$(obj).attr('class', 'fas fa-pen');
						$(flag).text('U');
					}
					break;
				case 'I':
					$(obj).attr('class', 'fas fa-plus');
					$(flag).text('I');
					break;
				
				case 'R':
					$(obj).attr('class', 'fas fa-caret-right');
					$(flag).text('R');
					break;
				
				case 'D':
					$(obj).attr('class', 'fas fa-cut');
					$(flag).text('D');
					break;
				default:
					break;
			}
		}
		
		$(document).ready(function(){
			
			$("#BizDailyMaster").on("click", "tr",	function() {addClickClass(this);});
			$("#BizDailyExecuter").on("click", "tr",	function() {addClickClass(this);});
			$("#BizDailyDetail").on("click", "tr",	function() {addClickClass(this);});
			
			// 클릭시 로우 색깔 설정
			function addClickClass(obj) {
				$(obj).addClass('clicked').siblings().removeClass('clicked');
			}
			
			// 데이터 변경시 Flag 변경
			/*
			$(document).on('keydown', '.data_text', function(e) {
				var rownum = $(this).closest('tr').prevAll().length;
				var tableid = $(this).closest('table').attr('id')
				alert('f-1')
				changeFlag('U', tableid, rownum)
			})
			*/
			
			// 데이터 변경시 Flag 변경
			$(document).on('change', '.data_text', function(e) {
				var rownum = $(this).closest('tr').prevAll().length;
				var tableid = $(this).closest('table').attr('id')
				changeFlag('U', tableid, rownum)
			})
			
			// 업무 Master 더블클릭시 현업 유저 List 조회
			$('#BizDailyMaster').on('dblclick', 'td', function(e) {
			    var col = $(this).index();
			    var row = $(this).parent().index();
			    
			    $('#findUserList_setrow').text(row)
				var dbl_cell = $(e.target).attr('name')
				
				if (dbl_cell == 'userinfo_deptname' || dbl_cell == 'userinfo_empname') {
					$('#findUserList_Table tbody').remove();
					$('#findUserList_ip_empname').val('');
					$('#findUserList_ip_deptname').val('');
					$('#findUserList').modal('show')
				} else if (dbl_cell == 'bws_content') {
					//$('#findSujectList_Table tbody').remove();
					$('#findSubjectList_rowindex').text(row)
					$('#findSubjectList').modal('show')
				}
			})
			
			// 업무 Master Subject DoubleClick
			$('#findSubjectList_Table').on('dblclick', 'td', function(e) {
				$('#findSubjectList').modal('hide')
				var col = $(this).index();
			    var row = $(this).parent().index();
			    //alert(row)
			    //alert($('#findSubjectList_rowindex').text())
			    
			    var table_row = Number($('#findSubjectList_rowindex').text())
			    var bws_seq = $('#findSubjectList_Table tr:eq(' + (row + 1) + ')>td:eq(0)').text();
			    var bws_content = $('#findSubjectList_Table tr:eq(' + (row + 1) + ')>td:eq(1)').text();
			    
			    //alert(bws_seq + " : " + bws_content)
			    var bws_seq_chk = $('#BizDailyMaster tr:eq(' + (table_row + 1) + ')>td:eq(18)').text();
			    
			    if (bws_seq != bws_seq_chk) {
			    	$('#BizDailyMaster tr:eq(' + (table_row + 1) + ')>td:eq(18)>h6').text(bws_seq)
			    	$('#BizDailyMaster tr:eq(' + (table_row + 1) + ')>td:eq(5)>h6').text(bws_content)
			    	
			    	changeFlag("U", 'BizDailyMaster', table_row)
			    }
			})
			
			//업무 Master 건별 삭제
			$('#btn_mst_delete').click(function() {
				/*
				var rowCount = $('#BizDailyMaster tbody tr').length;
				alert(rowCount)
				for (i=0; i < rowCount; i++) {
					var a = $('#BizDailyMaster tr:eq(' + (i + 1) + ')>td:eq(17)').text();
					alert(i + " : " + a)
				}
				*/
				
				var getobject = $('#BizDailyMaster > tbody > tr.trstyle.clicked');
				var clicked = getobject.attr('id');
				//alert(JSON.stringify(getobject))
				//alert(clicked)
				
				if (!clicked) {
					$('#JustInfoModal_Title').text('삭제 확인')
					$('#JustInfoModal_Body').text('먼저 삭제할 업무 Master 데이터를 선택해 주십시오!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var index = clicked.substring(6)
				
				changeFlag('D', 'BizDailyMaster', Number(index))
				
			})
			
			// 업무 배치 조회
			function execSearch(bd_seq) {
				$('#BizDailyExecuter tbody').remove();
				
				$.ajax({
					type:"post",
					url:'${root}biz/getBizDailySubExec',
					data:{'bd_seq':bd_seq},
					success: function(result) {
						//alert(JSON.stringify(result))
						var data1 = result;
						
						if (data1.length != 0) {
							var tbody = $('<tbody>');

							for (i = 0; i < data1.length; i++) {
								var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
								var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%"></i>')
								var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data1[i].EMPNAME + '</h6>')
								var cell2 = $('<td><input class="table_tr data_text" style="text-align:center;" type="number" value="' + data1[i].EXC_WEIGHT + '"</h6>')
								var cell3 = $('<td><input class="table_tr data_text" type="text" value="' + data1[i].REMARK + '">')							
								var cell4 = $('<td style="display:none">').text(data1[i].BD_SEQ)
								var cell5 = $('<td style="display:none">').text(data1[i].EMPID)
								var cell6 = $('<td style="display:none">').text(data1[i].FLAG)
								
								$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6);
								$(tbody).append(row);
							}
							
							$("#BizDailyExecuter").append(tbody);
							$("#BizDailyExecuter").trigger('update')
						}
					}
				})
			}
			
			// 업무 Detail 조회
			function detailSearch(bd_seq) {
				$('#BizDailyDetail tbody').remove();
				
				$.ajax({
					type:"post",
					url:'${root}biz/getBizDailySubDetail',
					data:{'bd_seq':bd_seq},
					success: function(result) {
						//alert(JSON.stringify(result))
						var data2 = result;
						
						if (data2.length != 0) {
							var tbody = $('<tbody>');

							for (i = 0; i < data2.length; i++) {
								var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
								var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdd_flag_' + i + '"></i>')
								var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data2[i].EXC_SEQ + '</h6>')
								var cell2 = $('<td><h6 class="table_tr" name="userinfo_empname" style="margin-top:8px; text-align:center;">' + data2[i].EMPNAME + '</h6>')
								var cell3 = $('<td><input class="table_tr data_text" type="text" value="' + data2[i].EXC_CONTENT + '">')
								var cell4 = $('<td><input class="table_tr data_text" type="number" value="' + data2[i].WORK_LEV + '" min="0" max="10">')
								var cell5 = $('<td><input class="table_tr data_text" type="number" value="' + data2[i].WORK_PRC_PER + '" min="0" max="100">')
								var cell6 = $('<td><select id="bdd_work_status_' + i + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
								var cell7 = $('<td><input type="date" class="table_tr data_text" value="' + data2[i].ACT_END_DATE + '">')
								var cell8 = $('<td><input class="table_tr data_text" type="text" value="' + data2[i].REMARK + '">')
								var cell9 = $('<td style="display:none">').text(data2[i].BD_SEQ)
								var cell10 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data2[i].FLAG + '</h6>')
								var cell11 = $('<td style="display:none">' + data2[i].EXC_USER + '</td>')
								$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11);
								$(tbody).append(row);
							}
							
							$("#BizDailyDetail").append(tbody);
							$("#BizDailyDetail").trigger('update')
							
							// c:if로 selected가 안먹음 ㅜㅜ...
							for (i = 0; i < data2.length; i++) {
								$('#bdd_work_status_' + i).val(data2[i].WORK_STATUS).prop("selected", true);							
							}
						}
					}
				})
			}
			
			// 전제 조회
			allSearch = function() {
				
				var rec_user = $('#search_rec_user').val()
				var empname = $('#search_empname').val()
				var req_subject = $('#search_req_subject').val()
				var sdate = $('#search_sdate').val()
				var edate = $('#search_edate').val()
				var work_status = $('#search_work_status').val()
				
				if (!empname) {
					empname = '%'
				} else {
					empname = '%' + empname + '%'
				}
				
				if (!req_subject) {
					req_subject = '%'
				} else {
					req_subject = '%' + req_subject + '%'
				}
				
				if (!sdate || !edate) {
					alert('접수일자를 올바르게 기입해 주세요!')
					
					if (!sdate) {
						$('#search_sdate').focus()
					} else {
						$('#search_edate').focus()
					}
					
					return;
				}
				
				$('#BizDailyMaster tbody').remove();
				$('#BizDailyExecuter tbody').remove();
				$('#BizDailyDetail tbody').remove();
				
				$.ajax({
					type:'post',
					url:'${root}biz/getBizDailyList',
					data:{'rec_user':rec_user, 'empname':empname, 'req_subject':req_subject, 'sdate':sdate, 'edate':edate, 'work_status': work_status},
					success: function(result) {
						if (result.length == 0) {
							return;
						}

						var tbody = $('<tbody>');

						for (i = 0; i < result.length; i++) {
							var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
							var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdm_flag_' + i + '"></i>')
							//var cell1 = $('<td><div class="table_tr" style="margin-top:8px; text-align:center;" id="bdm_rec_name_' + i + '">').text(result[i].REC_NAME)
							//var cell1 = $('<td><input class="table_tr" style="border:none" id="bdm_rec_name_' + i + '" value="' + result[i].REC_NAME + '" readonly>')
							var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].REC_NAME + '</h6>')
							var cell2 = $('<td><input type="date" class="table_tr data_text" id="bdm_rec_date_' + i + '" value="' + result[i].REC_DATE + '">')
							//var cell3 = $('<td><input class="table_tr data_text" style="width:100%" type="text" id="bdm_rec_name_' + i + '" value="' + result[i].REQ_NAME + '">')
							//var cell4 = $('<td class="table_tr" style="text-align:center; margin-top:10px" id="bdm_rec_name_' + i + '">').text(result[i].DEPTNAME)
							var cell3 = $('<td><h6 class="table_tr data_text" style="margin-top:8px; text-align:center;" name="userinfo_empname">' + result[i].REQ_NAME + '</h6>')
							var cell4 = $('<td><h6 class="table_tr data_text" style="margin-top:8px; text-align:center;" name="userinfo_deptname">' + result[i].DEPTNAME + '</h6>')
							var cell5 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;" name="bws_content">' + result[i].BWS_CONTENT + '</h6>')
							//var cell5 = $('<td><textarea class="table_tr data_text" type="text" value="' + result[i].REQ_SUBJECT + '">')
							//alert(result[i].REQ_CONTENT)
							var cell6 = $('<td><textarea class="table_tr data_text" rows="3">' + result[i].REQ_SUBJECT + '</textarea>')
							var cell7 = $('<td><textarea class="table_tr data_text" rows="3">' + result[i].REQ_CONTENT + '</textarea>')
							var cell8 = $('<td><textarea class="table_tr data_text" rows="3">' + result[i].ANL_CONTENT + '</textarea>')
							var cell9 = $('<td><input class="table_tr data_text" type="number" value="' + result[i].WORK_LEV + '" min="0" max="10">')
							//alert('new7 : ' + result[i].WORK_STATUS)
							var cell10 = $('<td><input class="table_tr data_text" type="number" value="' + result[i].WORK_PRC_PER + '" min="0" max="100">')
							var cell11 = $('<td><select id="bdm_work_status_' + i + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
							var cell12 = $('<td><input type="date" class="table_tr data_text" value="' + result[i].EXP_END_DATE + '">')
							var cell13 = $('<td><input type="date" class="table_tr data_text" value="' + result[i].ACT_END_DATE + '">')
							var cell14 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].BD_SEQ + '</h6>')
							var cell15 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].REQ_USER + '</h6>')
							var cell16 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].FLAG + '</h6>')
							var cell17 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].REC_USER + '</h6>')
							var cell18 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].BWS_SEQ + '</h6>')
							
							$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11, cell12, cell13, cell14, cell15, cell16, cell17, cell18);
							$(tbody).append(row);
							//$("#categoryDataTable > tbody").append(row);
							//$('#bdm_work_status_' + i).val(result[i].WORK_STATUS).prop("selected", true);
						}
						$("#BizDailyMaster").append(tbody);
						$("#BizDailyMaster").trigger('update')
						
						// c:if로 selected가 안먹음 ㅜㅜ...
						for (i = 0; i < result.length; i++) {
							$('#bdm_work_status_' + i).val(result[i].WORK_STATUS).prop("selected", true);							
						}
					},
					error: function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
			
			// 업무 마스터 조회
			$('#btn_reset_search').click(function() {
				allSearch();
			})
			
			// 업무 Master 클릭시 배치자 및 상세 내역 조회
			$("#BizDailyMaster").on('click', 'tr', function(){
				var row = this.rowIndex;
				if (row == 0) return;
				
				var bd_seq = $('#BizDailyMaster tr:eq(' + row + ')>td:eq(14)').text();
				
				$('#BizDailyExecuter tbody').remove();
				$('#BizDailyDetail tbody').remove();
				
				if (!bd_seq) {
					
					
				} else {
					
					$.ajax({
						type:"post",
						url:'${root}biz/getBizDailySubAll',
						data:{'bd_seq':bd_seq},
						success: function(result) {
							//alert(JSON.stringify(result))
							var data1 = result.data1;
							var data2 = result.data2;
							
							if (data1.length != 0) {
								var tbody = $('<tbody>');

								for (i = 0; i < data1.length; i++) {
									var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
									var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%"></i>')
									var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data1[i].EMPNAME + '</h6>')
									var cell2 = $('<td><input class="table_tr data_text" style="text-align:center;" type="number" value="' + data1[i].EXC_WEIGHT + '"</h6>')
									var cell3 = $('<td><input class="table_tr data_text" type="text" value="' + data1[i].REMARK + '">')							
									var cell4 = $('<td style="display:none">').text(data1[i].BD_SEQ)
									var cell5 = $('<td style="display:none">').text(data1[i].EMPID)
									var cell6 = $('<td style="display:none">').text(data1[i].FLAG)
									
									$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6);
									$(tbody).append(row);
								}
								
								$("#BizDailyExecuter").append(tbody);
								$("#BizDailyExecuter").trigger('update')
							}
							
							if (data2.length != 0) {
								var tbody = $('<tbody>');

								for (i = 0; i < data2.length; i++) {
									var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
									var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdd_flag_' + i + '"></i>')
									var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data2[i].EXC_SEQ + '</h6>')
									var cell2 = $('<td><h6 class="table_tr" name="userinfo_empname" style="margin-top:8px; text-align:center;">' + data2[i].EMPNAME + '</h6>')
									var cell3 = $('<td><input class="table_tr data_text" type="text" value="' + data2[i].EXC_CONTENT + '">')
									var cell4 = $('<td><input class="table_tr data_text" type="number" value="' + data2[i].WORK_LEV + '" min="0" max="10">')
									var cell5 = $('<td><input class="table_tr data_text" type="number" value="' + data2[i].WORK_PRC_PER + '" min="0" max="100">')
									var cell6 = $('<td><select id="bdd_work_status_' + i + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
									var cell7 = $('<td><input type="date" class="table_tr data_text" value="' + data2[i].ACT_END_DATE + '">')
									var cell8 = $('<td><input class="table_tr data_text" type="text" value="' + data2[i].REMARK + '">')
									var cell9 = $('<td style="display:none">').text(data2[i].BD_SEQ)
									var cell10 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data2[i].FLAG + '</h6>')
									var cell11 = $('<td style="display:none">' + data2[i].EXC_USER + '</td>')
									$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11);
									$(tbody).append(row);
								}
								
								$("#BizDailyDetail").append(tbody);
								$("#BizDailyDetail").trigger('update')
								
								// c:if로 selected가 안먹음 ㅜㅜ...
								for (i = 0; i < data2.length; i++) {
									$('#bdd_work_status_' + i).val(data2[i].WORK_STATUS).prop("selected", true);							
								}
							}

							
						},
						error: function(request, status, error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					})
				}
			})
			
			// 업무 Master 저장
			$('#btn_mst_save').click(function() {
				var rowCount = $('#BizDailyMaster tbody tr').length;
				
				if (rowCount == 0) {
					$('#JustInfoModal_Title').text('저장 실패')
					$('#JustInfoModal_Body').text('조회된 내역이 없습니다!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var savearry = new Array();
				
				for (i = 0; i < rowCount; i++) {
					var rowdata = new Object();
					var flag = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(16)>h6').text()
					//alert(i + " : " + flag)
					if (flag == 'U' || flag == 'I' || flag == 'D') {
						var req_date = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(2)>input').val()
						var req_name = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(3)>h6').text()
						var req_subject = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(6)>textarea').val()
						var req_content = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(7)>textarea').val()
						var anl_content = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(8)>textarea').val()
						var work_lev = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(9)>input').val()
						var work_prc_per =$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(10)>input').val()
						var work_status = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(11)>select').val()
						
						if (flag != 'D') {
							if (!req_name || req_name == '요청자 선택') {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('요청자를 선택해 주세요!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(2)>input').focus();
								
								return;
							}
							
							if (!req_subject) {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('요청 사항(제목)을 입력하여 주십시오!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(6)>input').focus();
								return;
							}
								
							if (!req_content) {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('요청 세부 내역을 입력하여 주십시오!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(7)>input').focus();
								return;
							}
							
							if (!work_lev) {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('업무 레벨을 정의하여 주십시오!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(9)>input').focus();
								return;
							} else {
								if (work_lev < 0 || work_lev > 10) {
									$('#JustInfoModal_Title').text('저장 실패')
									$('#JustInfoModal_Body').text('업무 레벨은 0~10까지의 데이터만 입력 가능합니다!')
									$('#JustInfoModal').modal('show')
									
									$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(9)>input').focus();
									return;
								}
							}
							
							if (!work_prc_per) {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('진행률을 입력하여 주십시오!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(10)>input').focus();
							}
							
							if (work_status !== '00001') {
								// requested (단순 접수 상태) 가 아닌 경우 분석 사항 무조껀 기입
								if (!anl_content) {
									$('#JustInfoModal_Title').text('저장 실패')
									$('#JustInfoModal_Body').text('접수 상태 이상의 경우 반드시 분석 사항을 입력하십시오!')
									$('#JustInfoModal').modal('show')
									
									$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(8)>input').focus();
									return;
								}
								
								if (work_status == '00004') {
									var act_end_date = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(12)>input').val()
									
									if (!act_end_date) {
										$('#JustInfoModal_Title').text('저장 실패')
										$('#JustInfoModal_Body').text('처리 완료의 경우 실제 종료일일 입력해 주십시오!')
										$('#JustInfoModal').modal('show')
										
										$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(12)>input').focus();
										return;
									}
									
									if (work_prc_per != 100) {
										$('#JustInfoModal_Title').text('저장 실패')
										$('#JustInfoModal_Body').text('완료 상태시 진행률은 100% 이여야합니다!')
										$('#JustInfoModal').modal('show')
										
										$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(10)>input').focus();
										return;
									}
								} else {
									if (work_prc_per == 100) {
										$('#JustInfoModal_Title').text('저장 실패')
										$('#JustInfoModal_Body').text('완료 상태가 아닌 경우 진행률은 100% 일 수 없습니다!')
										$('#JustInfoModal').modal('show')
										
										$('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(10)>input').focus();
										return;
									}
								}
							}
						}
						
						rowdata.REC_DATE = req_date
						rowdata.REQ_SUBJECT = req_subject
						rowdata.REQ_CONTENT = req_content
						rowdata.ANL_CONTENT = anl_content
						rowdata.WORK_LEV = work_lev
						rowdata.WORK_STATUS = work_status
						rowdata.BD_SEQ = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(14)>h6').text()
						rowdata.REQ_USER = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(15)>h6').text()
						rowdata.FLAG = flag 
						rowdata.REC_USER = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(17)>h6').text()
						rowdata.EXP_END_DATE = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(12)>input').val()
						rowdata.ACT_END_DATE = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(13)>input').val()
						rowdata.BWS_SEQ = $('#BizDailyMaster tr:eq(' + (i+1) + ')>td:eq(18)>h6').text()
						rowdata.WORK_PRC_PER = work_prc_per
						savearry.push(rowdata);
					}
				}
				
				if (!savearry || savearry.length == 0) { 
					$('#JustInfoModal_Title').text('저장 실패')
					$('#JustInfoModal_Body').text('변경 혹은 추가된 내역이 없습니다!')
					$('#JustInfoModal').modal('show')
					return;
				} else {
					// 저장 Action 시작
					//alert(JSON.stringify(savearry))
					$.ajax({
						type:"post",
						dataType:'json',
						url:'${root}biz/saveDailyMasterData',
						contentType:'application/json',
						//traditional:true, // 배열 및 리스트로 값을 넘기기 위해서는 꼭 선언되어야함.
						data:JSON.stringify(savearry),
						//data: {'action_data':sendarry},
						success: function(result) {
							//alert('success')
							//alert(result);
							allSearch();
						}
					})
				}
			})
						
			// 업무 Master 작업 배치자 추가
			$('#btn_exec_add').click(function() {
				var all_rows = $('#BizDailyExecuter tbody tr').length;
				var all_reg_user = []
				
				var getobject = $('#BizDailyMaster > tbody > tr.trstyle.clicked');
				var clicked = getobject.attr('id');
				//alert(JSON.stringify(getobject))
				
				
				if (!clicked) {
					$('#JustInfoModal_Title').text('배치자 추가 확인')
					$('#JustInfoModal_Body').text('먼저 업무 Master 데이터를 선택해 주십시오!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var index = Number(clicked.substring(6))
				
				bd_seq = $('#BizDailyMaster tr:eq(' + (index + 1) + ')>td:eq(13)').text()
				
				$('#findITUserList_bd_seq').text(bd_seq)
				$('#findITUserList_setrow').text(index)
				$('findITUserList_type').text('E')
				
				if (all_rows != 0) {					
					$('#BizDailyExecuter tr').each(function(index, item) {
	                    if (!this.rowIndex) return; // skip first row
	                    var exec_user = $('#BizDailyExecuter tr:eq(' + index + ')>td:eq(5)').text();
	                    //alert(exec_user)
	                    //var eqi_no = $(this).find('#id_eqi_no').val();
	                    var add_user = exec_user.toString()
	                    all_reg_user.push(add_user)
	                });
				} else {
					
				}
				//alert(JSON.stringify(all_reg_user))
				$('#findITUserList_Table tbody').remove();
				
				$.ajax({
					type:"post",
					url:'${root}biz/getITUserInfoFromCheck',
					traditional:true,
					//data:{'reg_user':JSON.stringify(all_reg_user)},
					data:{'reg_user':all_reg_user},
					success: function(result) {
						//alert(JSON.stringify(result))
						if (result.length > 0) {
							var tbody = $('<tbody>');
							for (i = 0; i < result.length; i++) {
								var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
								//var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdd_flag_' + i + '"></i>')
								var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].BASE_CODE + '</h6>')
								var cell2 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].BASE_NAME + '</h6>')
								$(row).append(cell1, cell2);
								$(tbody).append(row);
							}
							$("#findITUserList_Table").append(tbody);
							$("#findITUserList_Table").trigger('update');
							$('#findITUserList').modal('show')
						} else {
							$('#JustInfoModal_Title').text('IT 작업 배치')
							$('#JustInfoModal_Body').text('현재 모든 IT 팀원이 추가되어 있습니다!')
							$('#JustInfoModal').modal('show')
						}
					}
				})
			})
			
			// 업무 Master IT 작업 배치자 리스트 더블클릭
			$('#findITUserList_Table').on('dblclick', 'tr', function(e) {
				// 업무 배치 작업자 추가
				//alert('findITUserList_Table dblclick')
				//var rownum = $('#BizDailyExecuter >tbody tr').length;
				var $This = $(this);
				var rows = Number($This.parent().children().index($(this)) + 1)
				
				var emp_id = $('#findITUserList_Table tr:eq(' + rows + ')>td:eq(0)').text()
				var emp_name = $('#findITUserList_Table tr:eq(' + rows + ')>td:eq(1)').text()
				var bd_seq = $('#findITUserList_bd_seq').text()
				var ttype = $('#findITUserList_type').text()
				
				if (ttype == 'E') {
					// 업무 배치에 추가
					var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
					//var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdd_flag_' + i + '"></i>')
					var cell0 = $('<td style="text-align:center"><i class="fas fa-plus" style="width:100%"></i>')
					var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + emp_name + '</h6>')
					var cell2 = $('<td><input class="table_tr data_text" style="text-align:center;" type="number" value="0"/>')
					var cell3 = $('<td><input class="table_tr data_text" type="text" value="">')	
					var cell4 = $('<td style="display:none">').text(bd_seq)
					var cell5 = $('<td style="display:none">').text(emp_id)
					var cell6 = $('<td style="display:none">').text('I')
					
					var rownum = $('#BizDailyExecuter >tbody tr').length;
					
					$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6);
					
					if (rownum == 0) {
						var tbody = $('<tbody>');
						$(tbody).append(row);
						$("#BizDailyExecuter").append(tbody);
					} else {
						var tbody = $('#BizDailyExecuter >tbody');
						$(tbody).append(row);
					}
				} else if (ttype == 'D') {
					// Detail에 추가
					var getrow = Number($('#findITUserList_setrow').text())
					//alert(getrow)
					$('#BizDailyDetail tr:eq(' + (getrow + 1) + ')>td:eq(11)').text(emp_id)
					$('#BizDailyDetail tr:eq(' + (getrow + 1) + ')>td:eq(2)>h6').text(emp_name)
				}
				
				$('#findITUserList').modal('hide')
			})
			
			// 업무 master add 버튼
			$('#btn_mst_add').click(function() {
				var rownum = $('#BizDailyMaster >tbody tr').length;
				var tbody = $('#BizDailyMaster >tbody');
				
				var row = $('<tr id="bdm_rowid_' + rownum + '">').addClass('trstyle');
				var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdm_flag_' + rownum + '"></i>')
				var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + login_empname + '</h6>')
				var cell2 = $('<td><input type="date" class="table_tr data_text" id="bdm_rec_date_' + rownum + '" value="${getToday}">')
				var cell3 = $('<td><h6 class="table_tr data_text" style="margin-top:8px; text-align:center;" name="userinfo_empname">요청자 선택</h6>')
				var cell4 = $('<td><h6 class="table_tr data_text" style="margin-top:8px; text-align:center;" name="userinfo_deptname">요청자 선택</h6>')
				var cell5 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;" name="bws_content">Subject 선택</h6>')
				var cell6 = $('<td><textarea class="table_tr data_text" rows="3"></textarea>')
				var cell7 = $('<td><textarea class="table_tr data_text" rows="3"></textarea>')
				var cell8 = $('<td><textarea class="table_tr data_text" rows="3"></textarea>')
				//var cell5 = $('<td><input class="table_tr data_text" type="text" value="">')
				//var cell6 = $('<td><input class="table_tr data_text" type="text" value="">')
				//var cell7 = $('<td><input class="table_tr data_text" type="text" value="">')
				var cell9 = $('<td><input class="table_tr data_text" type="text" value="" min="0" max="10">')
				var cell10 = $('<td><input class="table_tr data_text" type="text" value="" min="0" max="100">')
				var cell11 = $('<td><select id="bdm_work_status_' + rownum + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
				var cell12 = $('<td><input type="date" class="table_tr data_text" value="${getToday}">')
				var cell13 = $('<td><input type="date" class="table_tr data_text" value="">')
				var cell14 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;"></h6>')				
				var cell15 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;"></h6>')
				var cell16 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">R</h6>')
				var cell17 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + login_empid + '</h6>')
				var cell18 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;"></h6>')
				
				$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11, cell12, cell13, cell14, cell15, cell16, cell17, cell18);
				//alert(rownum)
				if (rownum == 0) {
					//alert('rownum 0')
					//$('#BizDailyMaster >tbody').append(row);
					var tbody = $('<tbody>');
					$(tbody).append(row);
					$("#BizDailyMaster").append(tbody);
					
				} else {
					$('#BizDailyMaster >tbody:last').append(row);
				}			
				
				target_row = rownum;
				changeFlag("I", 'BizDailyMaster', rownum)
				$('#bdm_rec_date_' + rownum).focus();
			})
			
			
			// 업무 마스터 유저 검색 버튼
			$('#btn_findUserList_search').click(function() {
				var deptname = $('#findUserList_ip_deptname').val()
				var empname = $('#findUserList_ip_empname').val()
				
				if (!deptname) {
					deptname = '%'
				} else {
					deptname = '%' + deptname + '%'
				}
				
				if (!empname) {
					empname = '%'
				} else {
					empname = '%' + empname + '%'
				}
				
				
				$.ajax({
					type:"post",
					url:'${root}user/getUserListByDeptEmp',
					data:{'deptname':deptname, 'empname':empname},
					success: function(result) {
						$('#findUserList_Table tbody').remove();
						//alert(JSON.stringify(result))
						if (result.length == 0) {
							return;
						}

						var tbody = $('<tbody>');
						
						/*
						<th>부서/팀</th>
						<th>사원 번호</th>
						<th>성명</th>
						<th>E-MAIL</th>
						<th>ID</th>
						<th>직급</th>
						<th>직책</th>
						*/
						
						for (i = 0; i < result.length; i++) {
							var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
							//var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdd_flag_' + i + '"></i>')
							var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].DEPTNAME + '</h6>')
							var cell2 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].EMPID + '</h6>')
							var cell3 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].EMPNAME + '</h6>')
							var cell4 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].EMAIL + '</h6>')
							var cell5 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].USERID + '</h6>')
							var cell6 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].JPNAME + '</h6>')
							var cell7 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].JDNAME + '</h6>')
							
							$(row).append(cell1, cell2, cell3, cell4, cell5, cell6, cell7);
							$(tbody).append(row);
						}
						
						$("#findUserList_Table").append(tbody);
						$("#findUserList_Table").trigger('update')
					}
				})
			})
			
			// 현업 리스트 더블 클릭
			//$('#findUserList_Table').dblclick(function() {
			$('#findUserList_Table').on('dblclick', 'tr', function() {
				
				var $This = $(this);
			    var row = $This.parent().children().index($(this)) + 1; // row
			    //alert(col)
			    
			    var data = $('#findUserList_Table tr:eq(' + row + ')>td:eq(1)').text();
			    
			    var empname = $('#findUserList_Table tr:eq(' + row + ')>td:eq(2)').text();
			    var deptname = $('#findUserList_Table tr:eq(' + row + ')>td:eq(0)').text();
			    var empid = $('#findUserList_Table tr:eq(' + row + ')>td:eq(1)').text();
			    
			    //alert($('#findUserList_setrow').text())
			    var mst_index = Number($('#findUserList_setrow').text());
			    var mst_row = mst_index + 1
			    
			    var org_emp_id = $('#BizDailyMaster tr:eq(' + mst_row + ')>td:eq(14)').text()
			    
			    if (org_emp_id != empid) {
				    $('#BizDailyMaster tr:eq(' + mst_row + ')>td:eq(3)>h6').text(empname)
				    $('#BizDailyMaster tr:eq(' + mst_row + ')>td:eq(4)>h6').text(deptname)
				    $('#BizDailyMaster tr:eq(' + mst_row + ')>td:eq(14)>h6').text(empid)
				    
				    changeFlag("U", 'BizDailyMaster', mst_index)
			    }
			    
			    $('#findUserList').modal('hide')
			})
			
			// 업무 배치자 저장
			$('#btn_exec_save').click(function() {
				var rowCount = $('#BizDailyExecuter tbody tr').length;
				
				if (rowCount == 0) {
					$('#JustInfoModal_Title').text('IT 작업 배치 확인')
					$('#JustInfoModal_Body').text('저장될 내역이 없습니다!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var all_weight = 0;
				// 전체 비중 계산
				for (i = 0; i < rowCount; i++) {
					var weight = Number($('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(2)>input').val())
					var flag = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(6)').text()
					
					if (flag != 'D') {					
						all_weight = all_weight + weight
					}
				}
				
				if (all_weight != 100) {
					$('#JustInfoModal_Title').text('IT 작업자 배치 실패')
					$('#JustInfoModal_Body').text('각 배치자의 비중 총 합은 반드시 100이 되어야합니다!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				
				var savearry = new Array();
				
				for (i = 0; i < rowCount; i++) {
					var flag = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(6)').text()
					
					if (flag == 'U' || flag == 'I' || flag == 'D') {
						
						/*
						var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
						var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%"></i>')
						var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data1[i].EMPNAME + '</h6>')
						var cell2 = $('<td><input class="table_tr data_text" style="text-align:center;" type="number" value="' + data1[i].EXC_WEIGHT + '"</h6>')
						var cell3 = $('<td><input class="table_tr data_text" type="text" value="' + data1[i].REMARK + '">')							
						var cell4 = $('<td style="display:none">').text(data1[i].BD_SEQ)
						var cell5 = $('<td style="display:none">').text(data1[i].EMPID)
						var cell6 = $('<td style="display:none">').text(data1[i].FLAG)
						*/
						var rowdata = new Object();
						var bd_seq = Number($('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(4)').text())
						rowdata.BD_SEQ = bd_seq
						rowdata.EXC_USER = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(5)').text()
						rowdata.EXC_WEIGHT = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(2)>input').val()
						rowdata.REMARK = $('#BizDailyExecuter tr:eq(' + (i + 1) + ')>td:eq(3)>input').val()
						rowdata.FLAG = flag;
						savearry.push(rowdata);
					}
				}
				
				if (!savearry || savearry.length == 0) { 
					$('#JustInfoModal_Title').text('저장 실패')
					$('#JustInfoModal_Body').text('저장될 내역이 없습니다!')
					$('#JustInfoModal').modal('show')
					return;
				} else {
					// 저장 Action 시작
					//alert(JSON.stringify(savearry))
					$.ajax({
						type:"post",
						dataType:'json',
						url:'${root}biz/saveDailyExecData',
						contentType:'application/json',
						//traditional:true, // 배열 및 리스트로 값을 넘기기 위해서는 꼭 선언되어야함.
						data:JSON.stringify(savearry),
						//data: {'action_data':sendarry},
						success: function(result) {
							//alert('success')
							//alert(result);
							execSearch(bd_seq);
						}
					})
				}
			})
			
			// 업무 배치자 삭제
			$('#btn_exec_delete').click(function() {
				var getobject = $('#BizDailyExecuter > tbody > tr.trstyle.clicked');
				var rowidx = getobject.index()
				
				changeFlag('D', 'BizDailyExecuter', rowidx)
			})
			
			// 업무 상세 Detail 신규 추가
			$('#btn_dtl_add').click(function() {
				
				var getobject = $('#BizDailyMaster > tbody > tr.trstyle.clicked');
				var clicked = getobject.attr('id');
				
				if (!clicked) {
					$('#JustInfoModal_Title').text('업무 상세 추가 실패')
					$('#JustInfoModal_Body').text('먼저 업무 Master 데이터를 선택해 주십시오!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var rownum = $('#BizDailyDetail >tbody tr').length;
				var tbody = $('#BizDailyDetail >tbody');
				var index = Number(clicked.substring(6))
				
				bd_seq = $('#BizDailyMaster tr:eq(' + (index + 1) + ')>td:eq(14)').text()
				
				if (!bd_seq || bd_seq == 0) {
					$('#JustInfoModal_Title').text('업무 상세 추가 실패')
					$('#JustInfoModal_Body').text('먼저 업무 Master 데이터를 저장 후 사용해 주십시오!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
				var cell0 = $('<td style="text-align:center"><i class="fas fa-plus" style="width:100%"></i>')
				var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;"></h6>')
				var cell2 = $('<td><h6 class="table_tr" name="userinfo_empname" style="margin-top:8px; text-align:center;">선택</h6>')
				var cell3 = $('<td><input class="table_tr data_text" type="text" value="">')
				var cell4 = $('<td><input class="table_tr data_text" type="number" value="0" min="0" max="10">')
				var cell5 = $('<td><input class="table_tr data_text" type="number" value="0" min="0" max="100">')
				var cell6 = $('<td><select id="bdd_work_status_' + i + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
				//var cell7 = $('<td><input type="date" class="table_tr data_text" id="bdd_rec_date_' + i + '" value="' + today + '">')
				var cell7 = $('<td><input type="date" class="table_tr data_text" id="bdd_rec_date_' + i + '" value="">')
				var cell8 = $('<td><input class="table_tr data_text" type="text" value="">')
				var cell9 = $('<td style="display:none">').text(bd_seq)
				var cell10 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">I</h6>')
				var cell11 = $('<td style="display:none"></td>')
				
				$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11);
				//alert(rownum)
				if (rownum == 0) {
					//alert('rownum 0')
					//$('#BizDailyMaster >tbody').append(row);
					var tbody = $('<tbody>');
					$(tbody).append(row);
					$("#BizDailyDetail").append(tbody);
					
				} else {
					$('#BizDailyDetail >tbody:last').append(row);
				}
			})
			
			// 업무 상세 작업자 더블 클릭
			$('#BizDailyDetail').on('dblclick', 'td', function(e) {
			    var col = $(this).index();
			    var row = $(this).parent().index();
			    var dbl_cell = $(e.target).attr('name')
			    
				$('#findITUserList_setrow').text(row)
				$('#findITUserList_type').text('D')
				
				if (dbl_cell == 'userinfo_empname') {				
					var all_reg_user = []				
					var rowCount = $('#BizDailyDetail tbody tr').length;
					
					$('#BizDailyDetail tr').each(function(index, item) {
	                    if (!this.rowIndex) return; // skip first row
	                    var exec_user = $('#BizDailyDetail tr:eq(' + index + ')>td:eq(11)').text();
	                    //alert(exec_user)
	                    //var eqi_no = $(this).find('#id_eqi_no').val();
	                    if (!exec_user) {
	                    	exec_user = 'X'
	                    }
	                    
	                    var add_user = exec_user.toString()
	                    all_reg_user.push(add_user)
	                });					
					
					$.ajax({
						type:"post",
						url:'${root}biz/getITUserInfoFromCheck',
						traditional:true,
						//data:{'reg_user':JSON.stringify(all_reg_user)},
						data:{'reg_user':all_reg_user},
						success: function(result) {
							if (result.length > 0) {
								$('#findITUserList_Table tbody').remove();
								var tbody = $('<tbody>');
								for (i = 0; i < result.length; i++) {
									var row = $('<tr id="rowid_' + i + '">').addClass('trstyle');
									//var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdd_flag_' + i + '"></i>')
									var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].BASE_CODE + '</h6>')
									var cell2 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].BASE_NAME + '</h6>')
									$(row).append(cell1, cell2);
									$(tbody).append(row);
								}
								$("#findITUserList_Table").append(tbody);
								$("#findITUserList_Table").trigger('update');
								$('#findITUserList').modal('show')
							} else {
								$('#JustInfoModal_Title').text('IT 작업 배치')
								$('#JustInfoModal_Body').text('현재 모든 IT 팀원이 추가되어 있습니다!')
								$('#JustInfoModal').modal('show')
							}
						}
					})
				}
			})
			
			// 업무 Detail Save
			$('#btn_dtl_save').click(function() {
				var rowCount = $('#BizDailyDetail tbody tr').length;
				
				if (rowCount == 0) {
					$('#JustInfoModal_Title').text('저장 실패')
					$('#JustInfoModal_Body').text('조회된 내역이 없습니다!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var savearry = new Array();
				
				for (i = 0; i < rowCount; i++) {
					var rowdata = new Object();
					var flag = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(10)>h6').text()
					//alert(i + " : " + flag)
					if (flag == 'U' || flag == 'I' || flag == 'D') {
						
						var bd_seq = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(9)').text()
						var exc_seq = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(1)>h6').text()
						var exc_user = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(11)').text()
						var exc_content = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(3)>input').val()
						var work_lev = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(4)>input').val()
						var work_prc_per = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(5)>input').val()
						var work_status = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(6)>select').val()
						var act_end_date = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(7)>input').val()
						var remark = $('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(8)>input').val()
						
						if (flag != 'D') {
							if (!exc_user) {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('처리자를 선택해 주세요!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(2)>input').focus();
								
								return;
							}
							
							if (!exc_content) {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('처리 사항을 입력하여 주십시오!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(3)>input').focus();
								return;
							}
							
							if (!work_lev) {
								$('#JustInfoModal_Title').text('저장 실패')
								$('#JustInfoModal_Body').text('업무 레벨을 정의하여 주십시오!')
								$('#JustInfoModal').modal('show')
								
								$('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(4)>input').focus();
								return;
							} else {
								if (work_lev < 0 || work_lev > 10) {
									$('#JustInfoModal_Title').text('저장 실패')
									$('#JustInfoModal_Body').text('업무 레벨은 0~10까지의 데이터만 입력 가능합니다!')
									$('#JustInfoModal').modal('show')
									
									$('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(4)>input').focus();
									return;
								}
							}
							
							if (work_status !== '00001') {
								// requested (단순 접수 상태) 가 아닌 경우 분석 사항 무조껀 기입
								if (work_status == '00004') {									
									if (!act_end_date) {
										$('#JustInfoModal_Title').text('저장 실패')
										$('#JustInfoModal_Body').text('처리 완료의 경우 실제 종료일을 입력해 주십시오!')
										$('#JustInfoModal').modal('show')
										
										$('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(7)>input').focus();
										return;
									}
									
									if (work_prc_per != 100) {
										$('#JustInfoModal_Title').text('저장 실패')
										$('#JustInfoModal_Body').text('완료 상태의 경우 진행률은 100% 이여야합니다!')
										$('#JustInfoModal').modal('show')
										
										$('#BizDailyDetail tr:eq(' + (i+1) + ')>td:eq(5)>input').focus();
										return;
									}
								}
							}
						}
						
						rowdata.BD_SEQ = Number(bd_seq)
						rowdata.EXC_SEQ = Number(exc_seq)
						rowdata.EXC_USER = exc_user
						rowdata.EXC_CONTENT = exc_content
						rowdata.WORK_LEV = Number(work_lev)
						rowdata.WORK_PRC_PER = Number(work_prc_per)
						rowdata.WORK_STATUS = work_status
						rowdata.ACT_END_DATE = act_end_date
						rowdata.REMARK = remark
						rowdata.FLAG = flag
						
						savearry.push(rowdata);
					}
				}
				
				if (!savearry || savearry.length == 0) { 
					$('#JustInfoModal_Title').text('저장 실패')
					$('#JustInfoModal_Body').text('변경 혹은 추가된 내역이 없습니다!')
					$('#JustInfoModal').modal('show')
					return;
				} else {
					// 저장 Action 시작
					//alert(JSON.stringify(savearry))
					$.ajax({
						type:"post",
						dataType:'json',
						url:'${root}biz/saveDailyDetailData',
						contentType:'application/json',
						//traditional:true, // 배열 및 리스트로 값을 넘기기 위해서는 꼭 선언되어야함.
						data:JSON.stringify(savearry),
						//data: {'action_data':sendarry},
						success: function(result) {
							//alert('success')
							//alert(result);
							detailSearch(bd_seq);
						}
					})
				}
			})
			
			// 업무 Detail 삭제
			$('#btn_dtl_delete').click(function() {
				var getobject = $('#BizDailyDetail > tbody > tr.trstyle.clicked');
				var clicked = getobject.attr('id');
				//alert(JSON.stringify(getobject))
				
				if (!clicked) {
					$('#JustInfoModal_Title').text('삭제 확인')
					$('#JustInfoModal_Body').text('먼저 삭제할 업무 Master 데이터를 선택해 주십시오!')
					$('#JustInfoModal').modal('show')
					return;
				}
				
				var index = clicked.substring(6)
				
				changeFlag('D', 'BizDailyDetail', Number(index))
			})
		})
	</script>
	
	<!-- Bootstrap core JavaScript-->
    <script src="${mainpath }vendor/jquery/jquery.min.js"></script>
    <script src="${mainpath }vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>

</html>