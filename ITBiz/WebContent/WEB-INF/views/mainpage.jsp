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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>IT Working List</title>

    <!-- Custom fonts for this template-->
    <link href="${mainpath}vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${mainpath}css/sb-admin-2.min.css" rel="stylesheet">

</head>



<body id="page-top">
	
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="/WEB-INF/views/include/main_sidebar.jsp">
        	<%-- <c:param name="userInfo" value='${userInfo }'></c:param> sessionScope로 잡음  --%>
        </c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <c:import url="/WEB-INF/views/include/top_bar.jsp"></c:import>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                    	<!-- Dashboard 첫 전체 업무 상태별 항목 Summary -->
						<c:forEach var='obj' items='${listbfm }' varStatus='idx'>
							<!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-3 col-md-6 mb-4">
	                        	<c:choose>
	                        		<c:when test="${obj.SORT_NO == 1}">
	                        			<div class="card border-left-success shadow h-100 py-2">
	                        		</c:when>
	                        		<c:when test="${obj.SORT_NO == 2}">
	                        			<div class="card border-left-primary shadow h-100 py-2">
	                        		</c:when>
	                        		<c:when test="${obj.SORT_NO == 3}">
	                        			<div class="card border-left-warning shadow h-100 py-2">
	                        		</c:when>
	                        		<c:when test="${obj.SORT_NO == 4}">
	                        			<div class="card border-left-info shadow h-100 py-2">
	                        		</c:when>
	                        	</c:choose>
	                        		<input type="hidden" id="bizDailyStatus_${obj.SORT_NO}" value="${obj.WORK_STATUS_CODE }"/>
	                        		<input type="hidden" id="bizDailyStatusName_${obj.SORT_NO}" value="${obj.WORK_STATUS_NAME }"/>
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">${obj.WORK_STATUS_NAME }
	                                            </div>
	                                            <div class="row no-gutters align-items-center">
	                                                <div class="col-auto">
	                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${obj.CNT_PERCENT }%</div>
	                                                </div>
	                                                <div class="col">
	                                                    <div class="progress progress-sm mr-2">
	                                                        <div class="progress-bar bg-info" role="progressbar"
	                                                            style="width: ${obj.CNT_PERCENT }%" aria-valuenow="80" aria-valuemin="0"
	                                                            aria-valuemax="100"></div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="col-auto">
	                                        	<a id="btn_bd_list_${obj.SORT_NO}" href='#'>
	                                            	<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
	                                            </a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
						
						</c:forEach>                        
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-7 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">개별 월 업무량</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <!-- <div class="dropdown-header">Dropdown Header:</div> -->
                                            <!-- <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div> -->
                                            <a class="dropdown-item" href="#">기능 준비 중입니다.</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-5 col-lg-5">
                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Team Projects</h6>
                                </div>
                                <div class="card-body">
                                	<c:forEach var='obj' items='${workforteam }' varStatus='idx'>
                                		<h4 class="small font-weight-bold">${obj.req_subject}<span
	                                            class="float-right">${obj.work_prc_per}%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${obj.work_prc_per}%"
	                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
                                	
                                	</c:forEach>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

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
    
    
    
    <div class="modal fade" id="BizDailyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true" >
        <div class="modal-dialog" role="document" >
            <div class="modal-content" style='width:900px'>
                <div class="modal-header">
                    <h5 class="modal-title" id="bdModalTitle"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                	<!-- 여기 직접 넣은것 -->
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"></h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="modalDataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>요청 일자</th>
                                            <th>요청자</th>
                                            <th>요청 제목</th>
                                            <th>요청 사항</th>
                                            <th>작업 난이도</th>
                                            <th>진도율(%)</th>
                                            <th>예상 종료일</th>
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
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
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
		$(document).ready(function(){
			var chartopen = false;
			boardCharCreate();
			
			$('#btn_bd_list_1').click(function() {
				var work_status = $('#bizDailyStatus_1').val();
				var work_status_name = $('#bizDailyStatusName_1').val();
				modalTableCreate(work_status, work_status_name)
			})
			
			$('#btn_bd_list_2').click(function() {
				var work_status = $('#bizDailyStatus_2').val();
				var work_status_name = $('#bizDailyStatusName_2').val();
				modalTableCreate(work_status, work_status_name)
			})
			
			$('#btn_bd_list_3').click(function() {
				var work_status = $('#bizDailyStatus_3').val();
				var work_status_name = $('#bizDailyStatusName_3').val();
				modalTableCreate(work_status, work_status_name)
			})
			
			$('#btn_bd_list_4').click(function() {
				var work_status = $('#bizDailyStatus_4').val();
				var work_status_name = $('#bizDailyStatusName_4').val();
				modalTableCreate(work_status, work_status_name)
			})
			
			function modalTableCreate(work_status, work_status_name) {
				$.ajax({
					type:"get",
					dataType:'json',
					url:'${root}main/searchAllDataFromStatus/' + work_status,
					success: function(result) {
						var num_len = result.length
						
						if (num_len == 0) {
							alert("등록된 데이터가 없습니다!")
							return
						}
						var tbody = $('<tbody>');
		                for (i=0; i<num_len; i++){
		                	var row = $('<tr>').addClass('chk');
		                    var cell1 = $('<td>').text(result[i].rec_DATE);
		                    var cell2 = $('<td>').text(result[i].req_EMP_NAME);
		                    var cell3 = $('<td>').text(result[i].req_SUBJECT);
		                    var cell4 = $('<td>').text(result[i].req_CONTENT);
		                    var cell5 = $('<td>').text(result[i].work_LEV);
		                    var cell6 = $('<td>').text(result[i].work_PRC_PER);
		                    var cell7 = $('<td>').text(result[i].exp_END_DATE);

		                    $(row).append(cell1, cell2, cell3, cell4, cell5, cell6, cell7);
		                    $(tbody).append(row);
		                	
		                }
		                $("#modalDataTable > tbody").empty();
		                $("#modalDataTable").append(tbody);
		                
						$('#bdModalTitle').text(work_status_name + ' List');
						$('#BizDailyModal').modal('show');
					},
					error: function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			}
			
			function number_format(number, decimals, dec_point, thousands_sep) {
			  // *     example: number_format(1234.56, 2, ',', ' ');
			  // *     return: '1 234,56'
			  number = (number + '').replace(',', '').replace(' ', '');
			  var n = !isFinite(+number) ? 0 : +number,
			    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
			    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
			    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
			    s = '',
			    toFixedFix = function(n, prec) {
			      var k = Math.pow(10, prec);
			      return '' + Math.round(n * k) / k;
			    };
			  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
			  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
			  if (s[0].length > 3) {
			    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
			  }
			  if ((s[1] || '').length < prec) {
			    s[1] = s[1] || '';
			    s[1] += new Array(prec - s[1].length + 1).join('0');
			  }
			  return s.join(dec);
			}
			
			// 월별 업무 접수 건수 표기
			function boardCharCreate() {
				if (chartopen == true) { return ;}
				chartopen = true;
				
				bizDataByMonthly();
			}
			
			function bizDataByMonthly() {
				$.ajax({
					type:'get',
					dataType:'json',
					url:'${root}main/searchAllDataByMonthly',
					success : function(result) {
						dataInsertToChart(result)
					}				
				})
			}
			
			function dataInsertToChart(result) {
				var ctx = document.getElementById("myAreaChart");
				var myLineChart = new Chart(ctx, {
				  type: 'line',
				  data: {
				    labels: [result[0].monthly, result[1].monthly, result[2].monthly, result[3].monthly, result[4].monthly, result[5].monthly, result[6].monthly, result[7].monthly, result[8].monthly, result[9].monthly, result[10].monthly, result[11].monthly],
				    datasets: [{
				      label: "건수",
				      lineTension: 0.3,
				      backgroundColor: "rgba(78, 115, 223, 0.05)",
				      borderColor: "rgba(78, 115, 223, 1)",
				      pointRadius: 3,
				      pointBackgroundColor: "rgba(78, 115, 223, 1)",
				      pointBorderColor: "rgba(78, 115, 223, 1)",
				      pointHoverRadius: 3,
				      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
				      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
				      pointHitRadius: 10,
				      pointBorderWidth: 2,
				      data: [result[0].biz_cnt, result[1].biz_cnt, result[2].biz_cnt, result[3].biz_cnt, result[4].biz_cnt, result[5].biz_cnt, result[6].biz_cnt, result[7].biz_cnt, result[8].biz_cnt, result[9].biz_cnt, result[10].biz_cnt, result[11].biz_cnt],
				    }],
				  },
				  options: {
				    maintainAspectRatio: false,
				    layout: {
				      padding: {
				        left: 10,
				        right: 25,
				        top: 25,
				        bottom: 0
				      }
				    },
				    scales: {
				      xAxes: [{
				        time: {
				          unit: 'date'
				        },
				        gridLines: {
				          display: false,
				          drawBorder: false
				        },
				        ticks: {
				          maxTicksLimit: 7
				        }
				      }],
				      yAxes: [{
				        ticks: {
				          maxTicksLimit: 5,
				          padding: 10,
				          // Include a dollar sign in the ticks
				          callback: function(value, index, values) {
				            return number_format(value);
				          }
				        },
				        gridLines: {
				          color: "rgb(234, 236, 244)",
				          zeroLineColor: "rgb(234, 236, 244)",
				          drawBorder: false,
				          borderDash: [2],
				          zeroLineBorderDash: [2]
				        }
				      }],
				    },
				    legend: {
				      display: false
				    },
				    tooltips: {
				      backgroundColor: "rgb(255,255,255)",
				      bodyFontColor: "#858796",
				      titleMarginBottom: 10,
				      titleFontColor: '#6e707e',
				      titleFontSize: 14,
				      borderColor: '#dddfeb',
				      borderWidth: 1,
				      xPadding: 15,
				      yPadding: 15,
				      displayColors: false,
				      intersect: false,
				      mode: 'index',
				      caretPadding: 10,
				      callbacks: {
				        label: function(tooltipItem, chart) {
				          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
				          return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
				        }
				      }
				    }
				  }
				});
			}
		})
	</script>
	
	<!-- Bootstrap core JavaScript-->
    <script src="${mainpath }vendor/jquery/jquery.min.js"></script>
    <script src="${mainpath }vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>

</html>