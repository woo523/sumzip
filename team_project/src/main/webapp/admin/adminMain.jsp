<%@page import="chart.RegionDTO"%>
<%@page import="chart.CountRegion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/admain.css" type="text/css" >
<title>Insert title here</title>
<%
CountRegion c = new CountRegion();
RegionDTO dto = c.getsalesproduct();
%>
</head>
<body>

<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
<!-- Backgrounds -->
<div class="menu-item">
	<div class="container">
	   	<div class="row">
	       	<div class="col-lg-2">
				
			</div>
		
			<div class="col-lg-10">
				<div class="content-main">		
					<!--Load the AJAX API-->
					<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					<script type="text/javascript">
					
					// Load the Visualization API and the corechart package.
					google.charts.load('current', {'packages':['corechart']});
					
					// Set a callback to run when the Google Visualization API is loaded.
					google.charts.setOnLoadCallback(drawChart);
					
					// Callback that creates and populates a data table,
					// instantiates the pie chart, passes in the data and
					// draws it.
					function drawChart() {
					
					  // Create the data table.
					  var data = new google.visualization.DataTable();
					  data.addColumn('string', 'Topping');
					  data.addColumn('number', 'Slices');
					  data.addRows([
					    ['애월읍', <%=dto.get애월읍()%>],
					['성산읍', <%=dto.get성산읍()%>],
					['중문', <%=dto.get중문()%>],
					['우도', <%=dto.get우도()%>],
					['그외', <%=dto.get그외()%>]
					  ]);
					
					  // Set chart options
					  var options = {'title':'섬집 지역별 예약현황',
					               'titleTextStyle' : {
					                  fontSize: 30
					                  },
					                 'width':1500,
					                 'height':800};
					
					  // Instantiate and draw our chart, passing in some options.
					  var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
					  chart.draw(data, options);
					}
					</script>
				</div>		
			</div>
		</div>
	</div>
</div>
    
</head>
<body>
    <!--Div that will hold the pie chart-->
    
 
    <div id="chart_div"></div>      
      
   
</body>
</html>