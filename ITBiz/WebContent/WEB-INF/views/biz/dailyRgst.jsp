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
										
										<!-- 요청 제목 -->
										<div class='search_condition'>요청 제목</div>
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
														<th class='table_header' style='width: 60px;'>접수 일자</th>
														<th class='table_header' style='width: 50px;'>요청자</th>
														<th class='table_header' style='width: 120px;'>요청 부서/팀</th>
														<th class='table_header' style='width: 140px;'>요청 사항</th>
														<th class='table_header' style='width: 160px;'>요청 세부 내역</th>
														<th class='table_header' style='width: 160px;'>분석 사항</th>
														<th class='table_header' style='width: 40px;'>난이도</th>
														<th class='table_header' style='width: 80px;'>상태</th>
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
			<div class="modal-content" style='width: 900px'>
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
							<div class="table-responsive">
								<table class="table table-bordered" id="findUserList_Table" width="100%" cellspacing="0">
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
		
		function changeFlag(rowstatus, tablename, rownum) {
			/*
			추가 : fas fa-plus
			일반 : fas fa-caret-right
			삭제 : fas fa-cut
			업데이트 : fas fa-pen
			*/
			var obj;
			switch (tablename) {
				case 'BizDailyMaster' :
					obj = '#bdm_flag_' + rownum;
					break;
				case 'BizDailyDetail' :
					obj = '#bdd_flag_' + rownum;
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
					}
					break;
				case 'I':
					$(obj).attr('class', 'fas fa-plus');
					break;
				
				case 'R':
					$(obj).attr('class', 'fas fa-caret-right');
					break
				
				case 'D':
					$(obj).attr('class', 'fas fa-cut');
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
			$(document).on('keydown', '.data_text', function(e) {
				var rownum = $(this).closest('tr').prevAll().length;
				var tableid = $(this).closest('table').attr('id')
				
				changeFlag('U', tableid, rownum)
			})
			
			// 데이터 변경시 Flag 변경
			$(document).on('change', '.data_text', function(e) {
				var rownum = $(this).closest('tr').prevAll().length;
				var tableid = $(this).closest('table').attr('id')
				
				changeFlag('U', tableid, rownum)
			})
			
			// 업무 마스터 유저 더블 클릭
			/*
			$('#BizDailyMaster').on('dblclick', 'tr', function(e) {
				//alert(JSON.stringify(e))
				var $This = $(this);
			    var col = $This.parent().children().index($(this)) + 1; // row
			    
			    var empname = $This.closest("tr").find("h6[name='userinfo_empname']");
			    var deptname = $This.closest("tr").find("h6[name='userinfo_deptname']");
			    
			    alert(empname.text())
			    alert(deptname.text())
			})
			*/
			$('#BizDailyMaster').on('dblclick', 'td', function(e) {
				//alert(JSON.stringify(e))
				//alert($(e.target).attr('name'))
				var dbl_cell = $(e.target).attr('name')
				//alert(dbl_cell)
				if (dbl_cell == 'userinfo_deptname' || dbl_cell == 'userinfo_empname') {
					$('#findUserList').modal('show')
				}
			})
			
			
			// 업무 마스터 조회
			$('#btn_reset_search').click(function() {
				var rec_user = $('#search_rec_user').val()
				var empname = $('#search_empname').val()
				var req_subject = $('#search_req_subject').val()
				var sdate = $('#search_sdate').val()
				var edate = $('#search_edate').val()
				var work_status = $('#search_work_status').val()
				
				//alert(rec_user)
				
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
						//alert(JSON.stringify(result))
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
							var cell5 = $('<td><input class="table_tr data_text" type="text" value="' + result[i].REQ_SUBJECT + '">')
							var cell6 = $('<td><input class="table_tr data_text" type="text" value="' + result[i].REQ_CONTENT + '">')
							var cell7 = $('<td><input class="table_tr data_text" type="text" value="' + result[i].ANL_CONTENT + '">')
							var cell8 = $('<td><input class="table_tr data_text" type="text" value="' + result[i].WORK_LEV + '">')
							//alert('new7 : ' + result[i].WORK_STATUS)
							
							var cell9 = $('<td><select id="bdm_work_status_' + i + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
							var cell10 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].BD_SEQ + '</h6>')
							var cell11 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + result[i].REQ_USER + '</h6>')
							$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11);
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
			})
			
			// 업무 Master 클릭시 배치자 및 상세 내역 조회
			$("#BizDailyMaster").on('click', 'tr', function(){
				var row = this.rowIndex;
				if (row == 0) return;
				
				var bd_seq = $('#BizDailyMaster tr:eq(' + row + ')>td:eq(10)').text();
				
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
									var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data1[i].EMPNAME + '</h6>')
									var cell2 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data1[i].EXC_WEIGHT + '</h6>')
									var cell3 = $('<td><input class="table_tr data_text" type="text" value="' + data1[i].REMARK + '">')							
									var cell4 = $('<td style="display:none">').text(data1[i].BD_SEQ)
									var cell5 = $('<td style="display:none">').text(data1[i].EMPID)
									
									$(row).append(cell1, cell2, cell3, cell4, cell5);
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
									var cell2 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + data2[i].EMPNAME + '</h6>')
									var cell3 = $('<td><input class="table_tr data_text" type="text" value="' + data2[i].EXC_CONTENT + '">')
									var cell4 = $('<td><input class="table_tr data_text" type="text" value="' + data2[i].WORK_LEV + '">')
									var cell5 = $('<td><select id="bdd_work_status_' + i + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
									var cell6 = $('<td><input type="date" class="table_tr data_text" id="bdd_rec_date_' + i + '" value="' + data2[i].ACT_END_DATE + '">')
									var cell7 = $('<td><input class="table_tr data_text" type="text" value="' + data2[i].REMARK + '">')
									var cell8 = $('<td style="display:none">').text(data2[i].BD_SEQ)
									
									$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8);
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
			
			// 업무 Master 추가
			$('#btn_mst_add').click(function() {
				var i = 0;
				var x = '00004'
				$('#bdm_work_status_' + i).val(x).prop("selected", true);
			})
			
			// 업무 배치자 추가
			$('#btn_exec_add').click(function() {
				var all_rows = $('#BizDailyExecuter tbody tr').length;
				var all_reg_user = []
				
				if (all_rows != 0) {					
					$('#BizDailyExecuter tr').each(function(index, item) {
	                    if (!this.rowIndex) return; // skip first row
	                    var exec_user = $('#BizDailyExecuter tr:eq(' + index + ')>td:eq(4)').text();
	                    //alert(exec_user)
	                    //var eqi_no = $(this).find('#id_eqi_no').val();
	                    var add_user = exec_user.toString()
	                    all_reg_user.push(add_user)
	                });
				}
				//alert(JSON.stringify(all_reg_user))

				$.ajax({
					type:"post",
					url:'${root}biz/getITUserInfoFromCheck',
					traditional:true,
					//data:{'reg_user':JSON.stringify(all_reg_user)},
					data:{'reg_user':all_reg_user},
					success: function(result) {
						alert(JSON.stringify(result))
					}
				})
			})
			
			// 업무 master add 버튼
			$('#btn_mst_add').click(function() {
				
				var rownum = $('#BizDailyMaster >tbody tr').length;
				var tbody = $('#BizDailyMaster >tbody');
				
				var row = $('<tr id="bdm_rowid_' + rownum + '">').addClass('trstyle');
				var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" style="width:100%" id="bdm_flag_' + rownum + '"></i>')
				var cell1 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + login_empname + '</h6>')
				var cell2 = $('<td><input type="date" class="table_tr data_text" id="bdm_rec_date_' + rownum + '" value="">')
				var cell3 = $('<td><h6 class="table_tr data_text" style="margin-top:8px; text-align:center;" name="userinfo_empname"></h6>')
				var cell4 = $('<td><h6 class="table_tr data_text" style="margin-top:8px; text-align:center;" name="userinfo_deptname"></h6>')
				var cell5 = $('<td><input class="table_tr data_text" type="text" value="">')
				var cell6 = $('<td><input class="table_tr data_text" type="text" value="">')
				var cell7 = $('<td><input class="table_tr data_text" type="text" value="">')
				var cell8 = $('<td><input class="table_tr data_text" type="text" value="">')
				var cell9 = $('<td><select id="bdm_work_status_' + rownum + '" class="table_tr data_text"> <c:forEach var="obj" items="${search_work_status_noall }"> <option value="${obj.BASE_CODE}">${obj.BASE_NAME}</option> </c:forEach> </select>')
				var cell10 = $('<td><h6 class="table_tr" style="margin-top:8px; text-align:center;"></h6>')				
				var cell11 = $('<td style="display:none"><h6 class="table_tr" style="margin-top:8px; text-align:center;">' + login_empid + '</h6>')
				$(row).append(cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11);
				$('#BizDailyMaster >tbody:last').append(row);
				
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
		})
	</script>
	
	<!-- Bootstrap core JavaScript-->
    <script src="${mainpath }vendor/jquery/jquery.min.js"></script>
    <script src="${mainpath }vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>

</html>