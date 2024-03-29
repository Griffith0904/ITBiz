<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<c:set var='mainpath'
	value='${pageContext.request.contextPath }/static/main/' />
<!DOCTYPE html>

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
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<c:import url="/WEB-INF/views/include/top_bar.jsp"></c:import>
				
				<!-- 화면 이름 아이콘 & 이름 -->
				<div class="col-auto" style="margin-left: 20px">
					<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
					<h1 class="h4 mb-0 text-gray-800"
						style="display: inline; margin-left: 10px">Category 관리</h1>
				</div>
				
				<div
					style='margin-top: 20px; width: 100%; height: calc(100% - 149px);'>
					<!-- 타이틀 및 버튼부 -->
					<div class="card border-left-primary shadow h-0 py-0"
						style='height: 60px; width: calc(100% - 20px); margin-left: 10px;'>
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
										id='div_left_search_header'>Category List</div>
								</div>

								<div style='margin-top: 8px;'>
									<a href="#" class="btn btn-primary btn-icon-split" id="btn_add">
										<span class="icon text-white-50"> <i
											class="fas fa-bolt rotate-15"></i>
									</span> <span class="text">Add</span>
									</a> <a href="#" class="btn btn-success btn-icon-split"
										id="btn_save" style='margin-left: 5px'> <span
										class="icon text-white-50"> <i class="fas fa-check"></i>
									</span> <span class="text">Save</span>
									</a> <a href="#" class="btn btn-danger btn-icon-split"
										id="btn_delete" style='margin-left: 5px'> <span
										class="icon text-white-50"> <i class="fas fa-trash"></i>
									</span> <span class="text">Delete</span>
									</a>
								</div>
							</div>
						</div>
					</div>

					<!-- Category Table List 부 -->
					<div class="card shadow mb-4"
						style='margin-top: 10px; margin-left: 10px; width: calc(100% - 20px); height: calc(100% - 80px)'>
						<div class="card-body">
							<div class="table-responsive"
								style='height: 570px; border: 1px solid #DEDEDE'>
								<table class="tablesorter table table-bordered" id="categoryDataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th
												style='width: 60px; padding: 0.5rem !important; text-align: center'>
												<i class="fas fa-flag"></i>
											</th>
											<th
												style='width: 80px; padding: 0.5rem !important; text-align: center'>Seq.</th>
											<th
												style='width: 450px; padding: 0.5rem !important; text-align: center'>Subject</th>
											<th
												style='width: 600px; padding: 0.5rem !important; text-align: center'>비
												고</th>
											<th
												style='width: 100px; padding: 0.5rem !important; text-align: center'>사용
												유무</th>
											<th style='padding: 0.5rem !important; text-align: center'>정렬
												순서</th>
										</tr>
									</thead>
								</table>
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
		
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>
		
		<div class="modal fade" id="InfoModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style='width: 900px'>
					<div class="modal-header">
						<h5 class="modal-title" id="info_Title"></h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body" id="info_Body">
						
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="button"
							data-dismiss="modal" id="btn_info_yes" onclick="changeFlag('D')">Yes</button>
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">No</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="SaveInfoModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style='width: 900px'>
					<div class="modal-header">
						<h5 class="modal-title" id="save_info_Title"></h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body" id="save_info_Body">
						
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">OK</button>
					</div>
				</div>
			</div>
		</div>
		
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
	</div>
	
	
	<script type='text/javascript'>
		// Flag Icon 변경
		var target_row;
		
		
		function changeFlag(rowstatus) {
			/*
			추가 : fas fa-plus
			일반 : fas fa-caret-right
			삭제 : fas fa-cut
			업데이트 : fas fa-pen
			*/
			if (!target_row) {return;}
			switch (rowstatus) {
				case 'U':
					var now_status = $('#table_font_' + target_row).attr('class');
					if (now_status != 'fas fa-plus') {
						$('#table_font_' + target_row).attr('class', 'fas fa-pen');
					}
					break;
				case 'I':
					$('#table_font_' + target_row).attr('class', 'fas fa-plus');
					break;
				
				case 'R':
					$('#table_font_' + target_row).attr('class', 'fas fa-caret-right');
					break
				
				case 'D':
					$('#table_font_' + target_row).attr('class', 'fas fa-cut');
					break;
				default:
					break;
			}
		}
	
		$(document).ready(function() {
			// Category 불러오기
			//$("#categoryDataTable").tablesorter();
			$.tablesorter.addParser({
				id:"input_text",
				is:function() {
					return false;
				},
				format: function( s, table, cell) {
			        return $("input", cell).val();
			    },
			    type: 'text'
			})
			
			$.tablesorter.addParser({
				id:"checkbox",
				is:function() {
					return false;
				},
				format: function( s, table, cell) {
			        return $("input", cell).val();
			    },
			    type: 'text'
			})
			
			searchAllSubject();
	
			function searchAllSubject() {
				
				//$("#categoryDataTable").empty();
				//$("#categoryDataTable > tbody").html("");
				// 원래 하던거 $("#categoryDataTable").find("tr:gt(0)").remove();
				//$('#categoryDataTable').find('tbody').empty();
				//$('#categoryDataTable tbody').empty();
				//$('#categoryDataTable tbody').remove();
				//$('#categoryDataTable tr').eq(1).remove();
				
				$('#categoryDataTable tbody').remove();
				$.ajax({
							type : "get",
							dataType : 'json',
							url : '${root}biz/searchAllSubjectList',
							success : function(result) {
								//alert(JSON.stringify(result))
								if (result.length == 0) {
									return;
								}
	
								var tbody = $('<tbody>');
	
								for (i = 0; i < result.length; i++) {
									var row = $(
											'<tr id="rowid_' + i + '">')
											.addClass('trstyle');
									var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" id="table_font_' + i + '"></i>')
									var cell1 = $('<td style="text-align:center" id="bws_seq_' + i + '">').text(result[i].bws_seq)
									var cell2 = $('<td><input type="text" class="data_text" id="bws_content_'
											+ i
											+ '" value="'
											+ result[i].bws_content
											+ '" style="width:100%; border:none">')
									var cell3 = $('<td><input class="data_text" type="text" id="bws_remark_'
											+ i
											+ '" value="'
											+ result[i].remark
											+ '" style="width:100%;border:none">')
									var cell4;
									//잘됨
									/* if (result[i].use_yn == 'Y') {
										cell4 = $('<td><input type="checkbox" id="use_yn_' + i + '" value="' + result[i].use_yn + '" checked>')
									} else {
										cell4 = $('<td><input type="checkbox" id="use_yn_' + i + '" value="' + result[i].use_yn + '">')	
									} */
	
									/* <p class="onoff"><input type="checkbox" value="1" id="checkboxID"><label for="checkboxID"></label></p> */
	
									/* cell4 = $('<p class="onoff" style="margin-left:18px;margin-top:6px"><input type="checkbox" value="1" id="use_yn_' + i + '"><label for="checkboxID"></label></p>') */
									// 여러개는 나오는데 체크하면 최 상단 하나만 정상 작동함. 그리고 input의 id 변경(checkboxID)하면 작동 자체가 안됨
									if (result[i].use_yn == 'Y') {
										//cell4 = $('<p class="onoff" style="margin-left:18px;margin-top:2px;height:20px ;"><input type="checkbox" value="Y" id="checkboxID_' + i + '" checked><label for="checkboxID_' + i + '" style="height:30px"></label></p>')
										//cell4 = $('<td><p class="onoff" style="margin-left:18px;margin-top:2px;height:20px ;"><input type="checkbox" value="Y" id="checkboxID_' + i + '" checked><label for="checkboxID_' + i + '" style="height:30px"></label></p></td>')
										cell4 = $('<td class="data_text" style="text-align:center"><input type="checkbox" value="Y" class="data_checkbox" id="checkboxID_' + i + '" checked></td>')
									} else {
										//cell4 = $('<td><p class="onoff" style="margin-left:18px;margin-top:2px;height:20px ;"><input type="checkbox" value="N" id="checkboxID_' + i + '"><label for="checkboxID_' + i + '" style="height:30px"></label></p></td>')
										cell4 = $('<td style="text-align:center"><input type="checkbox" class="data_checkbox" value="N" id="checkboxID_' + i + '"></td>')
									}
	
									//var cell5 = $('<td class="data_text">').text(result[i].sort_no);
									var cell5 = $('<td><input type="text" class="data_text" id="sort_no_' + i + '" value="'	+ result[i].sort_no + '" style="width:100%; border:none">')
									
									//alert(row)
									$(row).append(cell0, cell1,
											cell2, cell3,
											cell4, cell5);
									$(tbody).append(row);
									//$("#categoryDataTable > tbody").append(row);
									
								}
								$("#categoryDataTable").append(tbody);
								$("#categoryDataTable").trigger('update')
								categorytablesort();
							}
						})
				
			}
			
			categorytablesort = function() {
				$('#categoryDataTable').tablesorter({
					headers: {
						2 : {sorter : 'input_text'},
						3 : {sorter : 'input_text'},
						4 : {sorter : 'input_text'},
						5 : {sorter : 'input_text'}
					}
					
				});
			}
	
			$("#categoryDataTable").on(	"click", "tr",	function() {
				// 클릭시 row 컬러 변경
				var tr = $(this);
				var td = tr.children();
				var getClickedRow = $(this)
						.index() + 1;
				var bws_seq = $('#twct_bws_seq' + getClickedRow).text();
	
				//잘됨.
				//$('tr.clicked').removeClass('clicked'); 
				//tr.addClass('clicked')
	
				$(this).addClass('clicked').siblings().removeClass('clicked');
			});
			
			// 추가 버튼
			$('#btn_add').click(function() {
				target_row = 0;
				var rownum = $('#categoryDataTable >tbody tr').length;
				var tbody = $('#categoryDataTable >tbody');
				//var row = $('#categoryDataTable >tbody tr');
				//var tbody = $('<tbody>');
				var row = $('<tr id="rowid_' + rownum + '">').addClass('trstyle');
				var cell0 = $('<td style="text-align:center"><i class="fas fa-caret-right" id="table_font_' + rownum + '"></i>')
				var cell1 = $('<td style="text-align:center" id="bws_seq_' + i + '">').text('')
				var cell2 = $('<td><input type="text" class="data_text" id="bws_content_' + rownum + '" value="" style="width:100%; border:none">')
				var cell3 = $('<td><input class="data_text" type="text" id="bws_remark_' + rownum + '" value="" style="width:100%;border:none">')
				var cell4 = $('<td class="data_text" style="text-align:center"><input type="checkbox" value="Y" class="data_checkbox" id="checkboxID_' + rownum + '" checked></td>')
				var cell5 = $('<td><input type="text" class="data_text" id="sort_no_' + rownum + '" value="999" style="width:100%; border:none">')
				
				$(row).append(cell0, cell1, cell2, cell3, cell4, cell5);
				$('#categoryDataTable >tbody:last').append(row);
				//$(tbody).append(row);
				//$("#categoryDataTable").append(tbody);
				//alert(rownum)
				target_row = rownum;
				changeFlag("I")
				$('#bws_content_' + rownum).focus();
				//$('#categoryDataTable >tbody tr').addClass('clicked').siblings().removeClass('clicked');
			})
	
			// 저장 버튼
			$('#btn_save').click(function() {
				//var table = document.getElementById('categoryDataTable')
				$('#save_check_Title').text('저장 확인')
				$('#save_check_Body').html('해당 내역을 저장하시겠습니까?')
				$('#SaveCheckModal').modal('show')
				return;
				
			})
			
			$('#btn_savecheck_yes').click(function() {
				var indexcnt = $('#categoryDataTable tbody tr').length
				var sendarry = new Array();
				
				for (row = 0; row < indexcnt; row++) {
					var rowdata = new Object();
					var status = $('#table_font_' + row).attr('class')
					//fas fa-caret-right : 변화 없음
					//fas fa-pen : 수정
					//fas fa-plus : 추가
					//fas fa-cut : 삭제
					/*
					var bws_seq
					var bws_content
					var remark
					var use_yn
					var sort_no
					var status
					*/
					rowdata.bws_seq = $('#bws_seq_' + row).text()
					rowdata.bws_content = $('#bws_content_' + row).val()
					rowdata.remark = $('#bws_remark_' + row).val()
					rowdata.sort_no = $('#sort_no_' + row).val()
					
					if ($('#checkboxID_' + row).is(":checked")) {
						rowdata.use_yn = 'Y'
					} else {
						rowdata.use_yn = 'N'
					}
					
					if (status == 'fas fa-pen') {
						rowdata.status = 'U'
					} else if (status == 'fas fa-plus') {
						rowdata.status = 'I'
						if (!rowdata.bws_content) {
							$('#save_info_Title').text('저장 실패')
							$('#save_info_Body').html('신규 내역 저장시 반드시 Subject를 입력해 주십시오!')
							$('#SaveInfoModal').modal('show')
							return;
						}
					} else if (status == 'fas fa-cut') {
						rowdata.status = 'D'
						if (!rowdata.bws_seq) {continue;}
					} else {
						continue;
					}
					
					sendarry.push(rowdata);
					//var json = JSON.parse("{bws_seq:}" )
					
				}
				
				if (!sendarry || sendarry.length == 0) { 
					$('#save_info_Title').text('저장 확인')
					$('#save_info_Body').html('변경된 내역이 없습니다!')
					$('#SaveInfoModal').modal('show')
					return; 
				}
				
				//alert(JSON.stringify(sendarry))
				$.ajax({
					type:"post",
					dataType:'json',
					url:'${root}biz/saveWeeklySubjectData',
					contentType:'application/json',
					//traditional:true, // 배열 및 리스트로 값을 넘기기 위해서는 꼭 선언되어야함.
					data:JSON.stringify(sendarry),
					//data: {'action_data':sendarry},
					success: function(result) {
						//alert('success')
						//alert(result);
						searchAllSubject();
					}
				})
			})
	
			// 삭제 버튼
			$('#btn_delete').click(function() {
				target_row = 0;
				//var rownum = $('#categoryDataTable').closest('tr').prevAll().length;
				//var rownum = $('#categoryDataTable tbody> tr .trstyle clicked').attr('id');
				//var id = $("#categoryDataTable").closest('tr').find(".id").html();
				//$('table > tbody > tr.highlight');
				var getobject = $('#categoryDataTable > tbody > tr.trstyle.clicked');
				var clicked = getobject.attr('id');
				
				if (!clicked) {
					alert('먼저 내역을 선택해주세요!')
					return;
				}
				
				var index = getobject.attr('id').substring(6)
				var id = '#bws_content_' + index
				var seq = $('#bws_seq_' + index).text()
				var bws_content = $(id).val();
				target_row = index;
				
				if (!seq) {
					var table = document.getElementById('categoryDataTable')
					changeFlag('D')
					return;
				}
				
				$('#info_Title').text('내역 삭제 확인')
				$('#info_Body').html('해당 내역을 삭제하시겠습니까?<br/>&nbsp;<br/>&nbsp; - Subject : ' + bws_content)
				
				$('#InfoModal').modal('show')
			})
			
			// 데이터 변경시 상태값 변경하기
			$(document).on('click', '.data_checkbox', function(e) {
				//alert(JSON.stringify(e))
				//alert($(e.target).attr("id"))
				//$('#table_font_0').class("fas fa-pen")
				//$('#table_font_0').removeClass();
				//$('#table_font_0').addClass("fas fa-pen")
				//$('#table_font_0').attr('class', 'fas fa-pen');
				//$('#table_font_0').toggleClass('fas fa-pen');
				//alert('eee')
				//var no = td.eq(0).text();
				var rownum = $(this).closest('tr').prevAll().length;
				//$('#table_font_' + rownum).attr('class', 'fas fa-pen');
				target_row = rownum;
				changeFlag('U')
			})
			
			$(document).on('keydown', '.data_text', function(e) {
				var rownum = $(this).closest('tr').prevAll().length;
				target_row = rownum;
				changeFlag('U')
			})
		});
	</script>	
</body>
</html>