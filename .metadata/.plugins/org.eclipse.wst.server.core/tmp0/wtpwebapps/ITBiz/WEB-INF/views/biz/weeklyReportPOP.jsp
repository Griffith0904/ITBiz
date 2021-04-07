<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%> 
<c:set var='root' value='${pageContext.request.contextPath }/' />
<c:set var='mainpath'
	value='${pageContext.request.contextPath }/static/main/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type='text/css'>
	table {
		border-collapse: collapse;
		margin-top:-10px;
	}
	
	table thead {
		background-color: #E6E6E6;
	}
	
	table tbody {
		border-bottom:2px solid black;
	}
	
	.hearder-left {
		border-right:1px dotted gray;
		border-top:2px solid black;
		border-bottom:2px solid black;
		width:50%;
		height:40px
	}
	
	.hearder-right {
		border-left:1px dotted gray;
		border-top:2px solid black;
		border-bottom:2px solid black;
		width:50%;
	}
	
	.data-left {
		border-right:1px dotted gray;
		width:50%;
	}
	
	.data-right {
		border-left:1px dotted gray;
		width:50%;
	}
	
	textarea {
		top:0px;
		resize:none;
		width: 99%; 
		height: 100%;
		border:none;
	}
	
	@media print {
		#printpage {
			display: none;
  		}
  		table th {background-color:#E6E6E6 !important; -webkit-print-color-adjust:exact;}
	}
	
	.pages {
		width:210mm;
		/* min-height:297mm; */
		min-height:287mm;
		padding:20mm;
		margin:10mm auto;
		/* border:1px solid red; */
	}
</style>
<style type="text/css" media="print">
	@page {
	    size: auto;  /* auto is the initial value */
	    margin: 0;  /* this affects the margin in the printer settings */
	}
</style>

</head>

<body>
	
	<div id='print' class='pages'>
		<h1>주간 업무 보고</h1>
		
		<div style="text-align: right; margin-top:-10px">
			<h5>${bwsList.swork_edate} (금)</h3>
			<h5 style="margin-top:-16px">${lub.empname } ${lub.jpname}</h3>
		</div>
		<div>
			<h3 style='margin-left:10px;'>금주 진행 업무 (${bwsList.swork_sdate.substring(5, 10)} ~ ${bwsList.swork_edate.substring(5, 10)})</h3>
			<table style='width:100%;'>
				<thead>
					<tr>
						<th class='hearder-left'>지난 주 계획</th>
						<th class='hearder-right'>금주 진행 업무</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class='data-left' id='lastWeekPlan' >
							<textarea readonly='true' id='lastweekdata'>${lastWeek}</textarea>
						</td>
						<td class='data-right' id='thisWeekPlan'>
							<textarea readonly='true' id='thisweekdata'>${thisWeek}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style='margin-top:40px;'>
			<h3 style='margin-left:10px;'>차주 진행 업무 (${bwsList.snext_sdate.substring(5, 10)} ~ ${bwsList.snext_edate.substring(5, 10)})</h3>
			<table style='width:100%;'>
				<thead>
					<tr>
						<th class='hearder-left'>차주 계획</th>
						<th class='hearder-right'>2021년 목표(일정 포함)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class='data-left' id='nextWeekPlan'>
							<textarea readonly='true' id='nextweekdata'>${nextWeek}</textarea>
						</td>
						<td class='data-right' id='thisYearPlan'></td>
						
					</tr>
				</tbody>
			</table>
		</div>
		
		
	</div>
	
	<button id='printpage' style='float:right; margin-top:10px;'>Print</button>
	
	<script src="${mainpath}vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			var lw = $('#lastweekdata').prop('scrollHeight')+12;
			var tw = $('#thisweekdata').prop('scrollHeight')+12;
			var setheight = 0;
			
			if (lw >= tw) {
				setheight = lw
			} else {
				setheight = tw
			}
			
			$('#lastweekdata').height(1).height( setheight );	
			$('#thisweekdata').height(1).height( setheight );
			$('#nextweekdata').height(1).height( $('#nextweekdata').prop('scrollHeight')+12 );
			
			$('#printpage').click(function () {
				//alert('fefe')
				//var g_oBeforeBody = $('#print').innerHTML;
				//document.body.innerHTML = print.innerHTML;
				//alert('22')
				window.print()
			});
		});
	</script>
</body>


</html>