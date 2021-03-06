<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%> 
<c:set var='root' value='${pageContext.request.contextPath }/' />
<c:set var='mainpath'
	value='${pageContext.request.contextPath }/static/main/' />
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


				<!-- ?????? ?????? ????????? & ?????? -->
				<div class="col-auto" style="margin-left: 20px">
					<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
					<h1 class="h4 mb-0 text-gray-800"
						style="display: inline; margin-left: 10px">?????? ?????? ?????? ??????</h1>
				</div>

				<div
					style='margin-top: 20px; width: 100%; height: calc(100% - 169px);'>
					<div class="row" style='height: 100%;'>
						<!-- ?????? (?????????) -->
						<div class="col-xl-4 col-lg-5"
							style='margin-left: 10px; height: 100%;'>
							<div class="card border-left-primary shadow h-0 py-0"
								style='height: 60px;'>
								<div class="card-body" style='height: 100%;'>
									<div class="row no-gutters align-items-center"
										style="margin-left: -20px; margin-top: -20px;">
										<div class="col-auto"
											style='margin-left: 20px; margin-top: 12px'>
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>

										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-0"
												style='margin-left: 15px; margin-top: 14px; font-size: 14px; width: 100%'
												id='div_left_search_header'>
												?????? ??????/??????</div>
										</div>

										<div style="margin-top: 10px;">
											<select id="search_year">
												<c:forEach var='obj' items='${search_year }'>
													<option value="${obj.year_value }">${obj.year_string }</option>
												</c:forEach>

											</select> <select id="search_week" style='margin-left: 4px'>
												<c:forEach var='obj' items='${search_week }'>
													<c:if test="${obj.week_value == this_week_num }">
														<option value="${obj.week_value }" selected>${obj.week_value }</option>
													</c:if>
													<c:if test="${obj.week_value != this_week_num }">
														<option value="${obj.week_value }">${obj.week_value }</option>
													</c:if>

												</c:forEach>

											</select> <a id="btn_reset_search"> <i
												class="fas fa-search fa-1x text-gray-800"
												style='margin-left: 8px'></i>
											</a>
										</div>
									</div>
								</div>
							</div>


							<div class="card shadow mb-4"
								style='height: calc(100% - 70px); margin-top: 10px;'>
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary" id="div_left_header">?????? ?????? ?????? ?????? ??????</h6>
									<div class="dropdown no-arrow"></div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<textarea class="form-control"
										style='width: 100%; height: 100%' readonly='true'
										id='beforePlan'></textarea>
								</div>
							</div>
						</div>

						<!-- ????????? (??????) -->
						<div class="col-xl-4 col-lg-5"
							style='margin-left: -10px; height: 100%;'>
							<!-- Project Card Example -->
							<div class="card shadow mb-4" style='height: 100%;'>
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary" id="div_center_header">????????? ?????? ??????</h6>
								</div>

								<div class="card-body" style="height: calc(100% - 500px)">
									<div class="card border-left-primary shadow h-0 py-0"
										style='height: 40px;'>
										<div class="card-body" style='height: 100%;'>
											<div class="row no-gutters align-items-center"
												style="margin-left: -20px; margin-top: -20px;">
												<div class="col-auto"
													style='margin-left: 20px; margin-top: 8px'>
													<i class="fas fa-calendar fa-1x text-gray-300"></i>
												</div>

												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1"
														style='margin-left: 15px; margin-top: 10px'>a)
														Category</div>
												</div>
											</div>
										</div>
									</div>

									<div class="card shadow mb-4" style='margin-top: 5px;'>
										<div class="card-body">
											<div class="table-responsive" style='margin-top: -20px; margin-left: -20px; width: calc(100% + 40px); height: 180px'>
												<table class="table table-bordered" id="twcategoryDataTable" width="100%" cellspacing="0">
													<thead>
														<tr>
															<th style='width: 40px; padding: 0.5rem !important'>No.</th>
															<th style='padding: 0.5rem !important'>Subject</th>
														</tr>
													</thead>

													<tbody>

													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div style='margin-top: -15px;'>
										<a href="#" class="btn btn-primary btn-circle"
											id="btn_twsuj_plus"> <i class="fas fa-plus"></i>
										</a> <a href="#" class="btn btn-danger btn-circle"
											id="btn_twsuj_minus"> <i class="fas fa-minus"></i>
										</a>
									</div>

									<!-- B) ?????? ?????? ?????? -->
									<div class="card border-left-primary shadow h-0 py-0"
										style='height: 40px; margin-top: 20px'>
										<div class="card-body" style='height: 100%;'>
											<div class="row no-gutters align-items-center"
												style="margin-left: -20px; margin-top: -20px;">
												<div class="col-auto"
													style='margin-left: 20px; margin-top: 8px'>
													<i class="fas fa-calendar fa-1x text-gray-300"></i>
												</div>

												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1"
														id = "testButton"
														style='margin-left: 15px; margin-top: 10px'>b) ?????? ??????</div>
												</div>
											</div>
										</div>
									</div>

									<textarea id="ta_this_week_contents" class="form-control"
										style='margin-top: 10px; width: 100%; height: calc(100% - 400px);'></textarea>

									<div style="margin-top: 7px;">
										<a href="#" class="btn btn-success btn-icon-split"
											id="btn_tw_save"> <span class="icon text-white-50">
												<i class="fas fa-check"></i>
										</span> <span class="text">Save</span>
										</a> 
										<a href="#" class="btn btn-info btn-icon-split"
											id="btn_tw_copy_from_lw"> <span class="icon text-white-50">
												<i class="fas fa-info-circle"></i>
										</span> <span class="text">Copy</span>
										</a>
									</div>
								</div>
							</div>
						</div>

						<!-- ????????? (??????) -->
						<div class="col-xl-4 col-lg-5"
							style='margin-left: -10px; height: 100%;'>
							<!-- Project Card Example -->
							<div class="card shadow mb-4" style='height: 100%;'>
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary" id="div_right_header">????????? ?????? ??????</h6>
								</div>

								<div class="card-body" style="height: calc(100% - 500px)">
									<div class="card border-left-primary shadow h-0 py-0"
										style='height: 40px;'>
										<div class="card-body" style='height: 100%;'>
											<div class="row no-gutters align-items-center"
												style="margin-left: -20px; margin-top: -20px;">
												<div class="col-auto"
													style='margin-left: 20px; margin-top: 8px'>
													<i class="fas fa-calendar fa-1x text-gray-300"></i>
												</div>

												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1"
														style='margin-left: 15px; margin-top: 10px'>a)
														Category</div>
												</div>
											</div>
										</div>
									</div>

									<div class="card shadow mb-4" style='margin-top: 5px;'>
										<div class="card-body">
											<div class="table-responsive"
												style='margin-top: -20px; margin-left: -20px; width: calc(100% + 40px); height: 180px'>
												<table class="table table-bordered" id="nwcategoryDataTable"
													width="100%" cellspacing="0">
													<thead>
														<tr>
															<th style='width: 40px; padding: 0.5rem !important'>No.</th>
															<th style='padding: 0.5rem !important'>Subject</th>
														</tr>
													</thead>

													<tbody>

													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div style='margin-top: -15px;'>
										<a href="#" class="btn btn-primary btn-circle" id='btn_nwsuj_plus'> <i
											class="fas fa-plus"></i>
										</a> <a href="#" class="btn btn-danger btn-circle" id='btn_nwsuj_minus'> <i
											class="fas fa-minus"></i>
										</a>
									</div>

									<!-- B) ?????? ?????? ?????? -->
									<div class="card border-left-primary shadow h-0 py-0"
										style='height: 40px; margin-top: 20px'>
										<div class="card-body" style='height: 100%;'>
											<div class="row no-gutters align-items-center"
												style="margin-left: -20px; margin-top: -20px;">
												<div class="col-auto"
													style='margin-left: 20px; margin-top: 8px'>
													<i class="fas fa-calendar fa-1x text-gray-300"></i>
												</div>

												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1"
														style='margin-left: 15px; margin-top: 10px'>b) ?????? ??????</div>
												</div>
											</div>
										</div>
									</div>

									<textarea id="ta_next_week_contents" class="form-control"
										style='margin-top: 10px; width: 100%; height: calc(100% - 400px);'></textarea>

									<div style="margin-top: 7px;">
										<a href="#" class="btn btn-primary btn-icon-split"
											id="btn_all_preview"> <span class="icon text-white-50">
												<i class="fas fa-flag"></i>
										</span> <span class="text">Preview</span>
										</a> <a href="#" class="btn btn-success btn-icon-split"
											id="btn_nw_save"> <span class="icon text-white-50">
												<i class="fas fa-check"></i>
										</span> <span class="text">Save</span>
										</a>
										<a href="#" class="btn btn-info btn-icon-split"
											id="btn_nw_copy_from_tw"> <span class="icon text-white-50">
											<i class="fas fa-info-circle"></i>
											</span> <span class="text">Copy</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white" id="pageBasicFooter">
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<div class="modal fade" id="BizDailyModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 900px'>
				<div class="modal-header">
					<h5 class="modal-title" id="bdModalTitle"></h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">??</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- ?????? ?????? ????????? -->
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"></h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="modalDataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>?????? ??????</th>
											<th>?????????</th>
											<th>?????? ??????</th>
											<th>?????? ??????</th>
											<th>?????? ?????????</th>
											<th>?????????(%)</th>
											<th>?????? ?????????</th>
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
		var subject_modal = 0;
		var main_year_num = 0;
		var main_week_num = 0;
		
		$(document).ready(function(){
			// Preview ??????
			var child;
			var timer;
			timer = setInterval(checkChild, 500);
			
			$('#btn_reset_search').click(function() {
				var search_year = $('#search_year').val();
				var search_week = $('#search_week').val();
				
				main_year_num = search_year;
				main_week_num = search_week;
				
				searchBeforeWeekContent(search_year, search_week);
				searchThisWeekSubject(search_year, search_week);
				searchNextWeekSubject(search_year, search_week);
				searchBaseDateScope(search_year, search_week);
				
				//div_left_search_header
				//$('#div_center_header').text('????????? ?????? ??????')
			})
			
			// ?????? ?????? ?????? ?????? ??????
			function searchBaseDateScope(search_year, search_week) {
				$.ajax({
					type:"post",
					dataType:'text',
					url:'${root}biz/searchBaseDateScope',
					data:{'search_year':search_year, 'search_week':search_week},
					success: function(result) {
						var num_len = result.length
						
						if (num_len == 0 ) {
							$('#div_left_search_header').text('?????? ??????/??????')
							return
						}
						//string text = URLDecoder.decode(result, "UTF-8") ;
						//alert(result)
						$('#div_left_search_header').text('?????? ??????/?????? ' + result)
						
					},
					error: function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			}
			// ????????? ?????? ?????? ?????? ?????????
			function searchBeforeWeekContent(search_year, search_week) {
				$.ajax({
					type:"get",
					dataType:'text',
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					url:'${root}biz/getLastWeekPlaner?search_year=' + search_year + '&search_week=' + search_week + '&search_type=1',
					success: function(result) {
						var num_len = result.length
						
						if (num_len == 0 ) {
							$('#beforePlan').val('')
							return
						}
						//string text = URLDecoder.decode(result, "UTF-8") ;
						//alert(result)
						$('#beforePlan').val(result)
						
					},
					error: function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			}
			
			// ????????? ?????? Subject ?????????
			function searchThisWeekSubject(search_year, search_week) {
				$("#twcategoryDataTable > tbody").empty();
				$.ajax({
					type:"get",
					dataType:'json',
					url:'${root}biz/getThisWeekSubject?search_year=' + search_year + '&search_week=' + search_week,
					success: function(result) {
						resetTableSubject(result, 1)
					},
					error: function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			}
			
			// ?????? ?????? ?????? ?????? Subject??? ??????????????? ????????? ??????
			function resetTableSubject(result, table_target) {
				//alert(result)
				//alert(table_target)
				var bws_seq_id_name = '';
				var rowid = ''
				
				if (table_target == 1) {
					$("#twcategoryDataTable > tbody").empty();
					bws_seq_id_name = 'twct_bws_seq'
					rowid = 'twct_row' 
					$('#ta_this_week_contents').val('')
				} else if (table_target == 2){
					$("#nwcategoryDataTable > tbody").empty();
					bws_seq_id_name = 'nwct_bws_seq'
					rowid = 'nwct_row'
					$('#ta_next_week_contents').val('')
				}
				
				if (result.length != 0) {
					var tbody = $('<tbody>');
	                for (i=0; i<result.length; i++){
	                	var row = $('<tr id="' + rowid + (i + 1) + '">').addClass('trstyle');
	                	//var cell1 = $('<td>').text(result[i].sort_no);
	                	//var cell1 = $('<td>').append($('<input style="width:30px" type="text" pattern="[0-9]*" maxlength=1>').val(result[i].sort_no))
	                	var cell1 = $('<td style="text-align:center">').text(result[i].sort_no)
	                    var cell2 = $('<td>').text(result[i].bws_content);
	                    var cell3 = $('<td id="' + bws_seq_id_name + (i + 1) + '" style="display:none">').text(result[i].bws_seq);
	                    var cell4 = $('<td style="display:none">').text(result[i].year_num);
	                    var cell5 = $('<td style="display:none">').text(result[i].week_num);
	                    var cell6 = $('<td style="display:none">').text(result[i].work_user);
	                    // original sort no
	                    var cell7 = $('<td style="display:none">').text(result[i].sort_no);
						//alert(row)
	                    $(row).append(cell1, cell2, cell3, cell4, cell5, cell6, cell7);
	                    //$(row).append(cell1, cell2);
	                    $(tbody).append(row);
	                	
	                }
	                //alert(tbody)
	                if (table_target == 1) {
	                	 $("#twcategoryDataTable").append(tbody);
					} else if (table_target == 2){
						 $("#nwcategoryDataTable").append(tbody);
					}
				}
			}
			
			// ????????? ?????? Subject
			function searchNextWeekSubject(search_year, search_week) {
				$("#nwcategoryDataTable > tbody").empty();
				$.ajax({
					type:"get",
					dataType:'json',
					url:'${root}biz/getNextWeekSubject?search_year=' + search_year + '&search_week=' + search_week,
					success: function(result) {
						resetTableSubject(result, 2)
					},
					error: function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			}
			
			// ?????? ?????? Subject ??????
	        $("#twcategoryDataTable").on("click", "tr", function(){
	        	// ????????? row ?????? ??????
	        	var tr = $(this);
	            var td = tr.children();
	        	var getClickedRow = $(this).index()+1;
	            var bws_seq = $('#twct_bws_seq' + getClickedRow).text();
	            
	            //??????.
	            //$('tr.clicked').removeClass('clicked'); 
	            //tr.addClass('clicked')
	            
	            $(this).addClass('clicked').siblings().removeClass('clicked');
	            //$(this).addClass('highlight').siblings().removeClass('highlight');
				
				if (!bws_seq) { return }
	            getUsrBizWeeklyContent(bws_seq, 1)
	        });
			
	     	// ?????? ?????? Subject ??????
	        $("#nwcategoryDataTable").on("click", "tr", function(){
	        	// ????????? row ?????? ??????
	        	var tr = $(this);
	            var td = tr.children();
	        	var getClickedRow = $(this).index()+1;
	            var bws_seq = $('#nwct_bws_seq' + getClickedRow).text();
	            
	            //$('tr.clicked').removeClass('clicked'); 
	            //tr.addClass('clicked')
	            $(this).addClass('clicked').siblings().removeClass('clicked');
	            if (!bws_seq) { return }
	            getUsrBizWeeklyContent(bws_seq, 2)
	        });
			
			// ?????? ?????? ?????? ?????? ????????????
			function getUsrBizWeeklyContent(bws_seq, search_type) {
				$.ajax({
					type:"post",
					dataType:'text',
					url:'${root}biz/getUsrBizWeeklyContent',
					data:{'year_num':main_year_num, 'week_num':main_week_num, 'bws_seq':bws_seq, 'search_type':search_type},
					success: function(result) {
						if (search_type == 1) {
							$('#ta_this_week_contents').val(result)
						} else if (search_type == 2) {
							$('#ta_next_week_contents').val(result)
						}
						
					},
					error: function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			}
			
			
			// ?????? ?????? ??????(basic) Subject ?????????
			function setWeeklyBasicSubject() {
				//getJustWeekBasicSubject
				$("#FindSubjectModalTable > tbody").empty();
				var inerted_bws = []
				if (subject_modal == 1) {
					// ??????
					var all_row = $('#twcategoryDataTable >tbody tr').length
					
					if (all_row > 0) {
						for (i=1; i<=all_row;i++) {
							var bws_seq = $('#twct_bws_seq' + i).text()
							inerted_bws.push(bws_seq)
						}
					}
	            //alert(getClickedRow)
				} else {
					// ??????
					var all_row = $('#nwcategoryDataTable >tbody tr').length
					
					if (all_row > 0) {
						for (i=1; i<=all_row;i++) {
							var bws_seq = $('#nwct_bws_seq' + i).text()
							inerted_bws.push(bws_seq)
						}
					}
				}
				
				$.ajax({
					type:"get",
					dataType:'json',
					url:'${root}biz/getJustWeekBasicSubject',
					success: function(result) {
						var num_len = result.length
						if (num_len == 0 ) {
							return
						}
						
						var tbody = $('<tbody>');
						var index_id = 0;
		                for (i=0; i<num_len; i++){
		                	var double_chk = 0;
		                	
		                	
		                	for (j=0; j < inerted_bws.length; j++) {
		                		//alert(inerted_bws[j])
		                		if (inerted_bws[j] == result[i].bws_seq) {
		                			double_chk++;
		                		}
		                	}
		                	
		                	if (double_chk == 0) {
		                		index_id++;
			                	var row = $('<tr>').addClass('chk');
			                    //var cell1 = $('<td>').text(result[i].sort_no);
			                    //var test = '<td id="fsm_bws_seq' + (i+1) + '">'
			                    //alert(test)
			                    var cell1 = $('<td id="fsm_bws_seq' + index_id + '">').text(result[i].bws_seq); //1
			                    var cell2 = $('<td id="fsm_bws_content' + index_id + '">').text(result[i].bws_content);
	
			                    $(row).append(cell1, cell2)
			                    $(tbody).append(row);
		                	}
		                }
		                //alert(tbody)
		                $("#FindSubjectModalTable").append(tbody);
		                
						//$('#bdModalTitle').text(work_status_name + ' List');
						$('#fsm_bdModalTitle').text("?????? ?????? ?????? Subject ??????")
						$('#FindSubjectModal').modal('show');
		                
					},
					error: function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			}
			
			// ??????????????????????????????????????????????????????????????? ?????? ????????? ???????????????????????????????????????????????????????????????????????????????????????
			// ?????? ?????? subject ??????
			$('#btn_twsuj_plus').click(function() {
				if (main_year_num == 0) {
					alert("?????? ????????? ?????? ??? ???????????? ????????????!")
					return
				}
				subject_modal = 1;
				setWeeklyBasicSubject()
			});
			
			// ?????? ?????? subject ??????
			$('#btn_nwsuj_plus').click(function() {
				if (main_year_num == 0) {
					alert("?????? ????????? ?????? ??? ???????????? ????????????!")
					return
				}
				subject_modal = 2;
				setWeeklyBasicSubject()
			});
			
			// ????????? ?????? subject ??????
			$('#btn_twsuj_minus').click(function() {
				if (main_year_num == 0) {
					alert("?????? ????????? ?????? ??? ???????????? ????????????!")
					return
				}
				subject_modal = 1;
				
	            // ?????? ????????? ?????? ?????????. ????????? css class ????????? ?????????
	            var rows = $('#twcategoryDataTable > tbody > tr.clicked');
	            var td = rows.children();
	        	var getClickedRow = rows.index()+1;
	            var bws_seq = $('#twct_bws_seq' + getClickedRow).text();
	            var bws_content = td.eq(1).text();	           
	            
	            deleteSubject(bws_seq, bws_content)
			});
			
			// ????????? ?????? subject ??????
			$('#btn_nwsuj_minus').click(function() {
				if (main_year_num == 0) {
					alert("?????? ????????? ?????? ??? ???????????? ????????????!")
					return
				}
				subject_modal = 2;
				
	            // ?????? ????????? ?????? ?????????. ????????? css class ????????? ?????????
	            var rows = $('#nwcategoryDataTable > tbody > tr.clicked');
	            var td = rows.children();
	        	var getClickedRow = rows.index()+1;
	            var bws_seq = $('#nwct_bws_seq' + getClickedRow).text();
	            var bws_content = td.eq(1).text();	           
	            
	            deleteSubject(bws_seq, bws_content)
			});
			
			// ????????? Subject ?????? ?????? ??????
			function deleteSubject(bws_seq, bws_content) {
				var title;
				var body;
				if (subject_modal == 1) {
					title = '?????? ?????? ?????? Subject ??????'
				} else if (subject_modal == 2) {
					title = '?????? ?????? ?????? Subject ??????'
				}
				
				//DeleteCheckModal
	            $('#dcm_Title').text(title)
	            $('#dcm_Body').html('?????? ????????? ?????????????????????????<br/>&nbsp;<br/>&nbsp; - Subject : ' + bws_content)
	            $('#DeleteCheckModal').modal('show')
			}

			// ?????? ???/?????? Subject ??????
			$('#btn_delete_ubw').click(function() {
	            var bws_seq;
	            
				if (subject_modal == 1) {
					var rows = $('#twcategoryDataTable > tbody > tr.clicked');
		            var td = rows.children();
		        	var getClickedRow = rows.index()+1;
		        	bws_seq = $('#twct_bws_seq' + getClickedRow).text();
				} else if (subject_modal == 2) {
					var rows = $('#nwcategoryDataTable > tbody > tr.clicked');
		            var td = rows.children();
		        	var getClickedRow = rows.index()+1;
		        	bws_seq = $('#nwct_bws_seq' + getClickedRow).text();
				}
				
				$.ajax({
					type:'post',
					dataType:'json',
					url:'${root}biz/deleteUsrBizWeeklyDetail',
					data:{'year_num':main_year_num, 'week_num':main_week_num, 'bws_seq':bws_seq, 'delete_type':subject_modal},
					success: function(result) {
						alert('????????? ?????????????????????.')
						
						if (subject_modal == 1) {
							$('#ta_this_week_contents').text('');	
						} else if (subject_modal ==2) {
							$('#ta_next_week_contents').text('');	
						}
						
						resetTableSubject(result, subject_modal)
					}
				
				})
			})
			
			// ?????? ?????? Context ??????
			$('#btn_tw_save').click(function() {
				subject_modal = 1
				if (main_year_num == 0) {
					alert("?????? ????????? ?????? ??? ???????????? ????????????!")
					return
				}
				
				var rows = $('#twcategoryDataTable > tbody > tr.clicked');
	            var td = rows.children();
	        	var getClickedRow = rows.index()+1;
	            var bws_seq = $('#twct_bws_seq' + getClickedRow).text();
	            
	            if (!bws_seq) {
	            	alert('?????? ????????? ?????? ?????? Subject??? ????????? ????????????!')
	            	return
	            }
	            
				var context = $('textarea#ta_this_week_contents').val();
				
				saveContent(bws_seq, context)
			})
			
			// ?????? ?????? Context ??????
			$('#btn_nw_save').click(function() {
				subject_modal = 2
				if (main_year_num == 0) {
					alert("?????? ????????? ?????? ??? ???????????? ????????????!")
					return
				}
				
				var rows = $('#nwcategoryDataTable > tbody > tr.clicked');
	            var td = rows.children();
	        	var getClickedRow = rows.index()+1;
	            var bws_seq = $('#nwct_bws_seq' + getClickedRow).text();
	            
	            if (!bws_seq) {
	            	alert('?????? ????????? ?????? ?????? Subject??? ????????? ????????????!')
	            	return
	            }
	            
				var context = $('textarea#ta_next_week_contents').val();
				
				saveContent(bws_seq, context)
			})
			
			// ?????? Content ?????? Function
			function saveContent(bws_seq, content) {
				$.ajax({
					type:"post",
					dataType:'text',
					url:'${root}biz/saveUsrBizWeeklyContentData',
					data:{'year_num':main_year_num, 'week_num':main_week_num, 'bws_seq':bws_seq, 'content':content, 'insert_type':subject_modal},
					success: function(result) {
						alert('????????? ?????????????????????.')					
					}
				})
			}
			
			// ?????? ?????? ?????? ????????? ?????? ?????? ????????? ?????? ??????(?????? ?????? ?????? ?????? ??? ??????)
			$('#btn_tw_copy_from_lw').click(function() {
				subject_modal = 1
				copyShowModal()
			})
			
			//  ?????? ?????? ????????? ?????? ????????? ?????? ??????(?????? ?????? ?????? ?????? ??? ??????)
			$('#btn_nw_copy_from_tw').click(function() {
				subject_modal = 2
				copyShowModal()
			})
			
			function copyShowModal() {
				var title;
				var body;
				if (subject_modal == 1) {
					title = '?????? ?????? ?????? ?????? ??????'
					body = '?????? ?????? ?????? ?????? ?????? ???????????? ?????????????????????????<br/>&nbsp;<br/>&nbsp;??? ????????? ????????? ?????? ?????? ????????? ?????? ?????? ??? ??????????????????!'
				} else if (subject_modal == 2) {
					title = '?????? ?????? ?????? ?????? ??????'
					body = '?????? ?????? ?????? ???????????? ?????????????????????????<br/>&nbsp;<br/>&nbsp;??? ????????? ????????? ?????? ?????? ????????? ?????? ?????? ??? ??????????????????!'
				}
				
				$('#ccm_Title').text(title)
				$('#ccm_Body').html(body)
				$('#CopyCheckModal').modal('show')
			}
			
			// ?????? ?????? ??????
			$('#btn_ccm_copy').click(function() {
				$.ajax({
					type:"post",
					dataType:'json',
					url:'${root}biz/copyUsrBizWeekData',
					data:{'year_num':main_year_num, 'week_num':main_week_num, 'copy_type':subject_modal},
					success: function(result) {
						alert('????????? ?????????????????????!');
						resetTableSubject(result, subject_modal)						
					}
				})
			})
			
			
			
			$('#btn_all_preview').click(function() {
				if (main_year_num == 0) {
					alert("?????? ????????? ?????? ??? ???????????? ????????????!")
					return
				}
				
				var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
			    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
			    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
			    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
			    
			    var left = ((width / 2) - (700 / 2)) + dualScreenLeft;
			    var top = ((height / 2) - (700 / 2)) + dualScreenTop;
			    
			    $('#windowblock').modal({backdrop: 'static', keyboard: false}) 
			    $('#windowblock').modal("show");
			    
			    var myForm = document.sendPOP;
			    var url = "${root}biz/weeklyReportPOP";
			    
			    myForm.action =url;
			    myForm.method ="post";
			    myForm.target ="popForm";
			    // id??? ?????? ?????? name?????? ?????????. ?????? ??????
			    //$('#fm_year_num').val(main_year_num)
			    //$('#fm_week_num').val(main_week_num)
			    $('input[name=form_year_num]').val(main_year_num)
			    $('input[name=form_week_num]').val(main_week_num)
			    
			    child = window.open("", "popForm", "toolbar=no,menubar=no,width=960,height=820,top=" + top + ",left=" + left)
			   	myForm.submit();
			})
			
			function checkChild() {
			    if (child != undefined && child.closed) {
			    	$('#windowblock').modal('hide');
			    	child = null;
		        }
		    }
			
			$('#testButton').click(function() {
				
			})
			
			
			
			// ?????? ?????? subject ?????? ????????? ?????? ??????
			$('#FindSubjectModalTable').on('dblclick', 'tr', function() {
				
				var getClickedRow = $(this).index()+1;
				var bws_seq = $('#fsm_bws_seq' + getClickedRow).text()
				$('#FindSubjectModal').modal('hide');
				
				$.ajax({
					type:"post",
					dataType:'json',
					url:'${root}biz/insertUsrBizWeeklyData',
					data:{'year_num':main_year_num, 'week_num':main_week_num, 'bws_seq':bws_seq, 'insert_type':subject_modal},
					success: function(result) {
						resetTableSubject(result, subject_modal)						
					}
				})
			})
			
		})
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="${mainpath }vendor/jquery/jquery.min.js"></script>
	<script src="${mainpath }vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<div class="modal fade" id="FindSubjectModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 900px'>
				<div class="modal-header">
					<h5 class="modal-title" id="fsm_bdModalTitle"></h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">??</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- ?????? ?????? ????????? -->
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"></h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="FindSubjectModalTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>SEQ</th>
											<th>Subject</th>
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
	
	<div class="modal fade" id="DeleteCheckModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 900px'>
				<div class="modal-header">
					<h5 class="modal-title" id="dcm_Title"></h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">??</span>
					</button>
				</div>
				<div class="modal-body" id="dcm_Body">
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger" type="button"
						data-dismiss="modal" id="btn_delete_ubw">Delete</button>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="CopyCheckModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style='width: 900px'>
				<div class="modal-header">
					<h5 class="modal-title" id="ccm_Title"></h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">??</span>
					</button>
				</div>
				<div class="modal-body" id="ccm_Body">
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button"
						data-dismiss="modal" id="btn_ccm_copy">Copy</button>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class='modal fade' id='windowblock' role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" >
		</div>
	</div>
	
	<form name='sendPOP' id='sendPOP' style='display:none'>
		<input name='form_year_num' id='fm_year_num'>
		<input name='form_week_num' id='fm_week_num'>
	</form>
</body>

</html>