
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.Info.InputInformation"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>Learning Hearts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="utf-8">
<link rel='stylesheet' type='text/css' href='CSS\result.css'>
<link
	href="https://fonts.googleapis.com/css?family=Acme|Luckiest+Guy|Permanent+Marker|Satisfy"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
</head>
<body>
	<div id='pagecontainer'>
		<div class='container'>
			<div id='header' class='row-md-12 row-sm-12'>
				<div id='title'>
					Learning Hearts<img src='resources/logo.png'
						style="width: 100px; height: 100px;">
				</div>
			</div>
			<nav class="navbar navbar-default">
			<div class='container-fluid'>
				<ul class="nav navbar-nav" id='menu'>
					<li><a href="/LearningHeart">Home</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li><a href="about.html">About</a></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class='container'>
			<div class='row-md-12' id='resultbox'>
				<div id='result'>

					<%
						List<InputInformation> inp = (ArrayList) request.getAttribute("list");
					String name=null;
					int gender=1;
					%>
					</br> </br>

					<%
						for (InputInformation input1 : inp) {

							List<Float> list = new ArrayList<>();
							list.add((float) input1.getAge());
							list.add((float) input1.getGender());
							list.add((float) input1.getBloodPressure1());
							list.add((float) input1.getBloodPressure2());
							list.add((float) input1.getCholesterol());
							list.add((float) input1.getHistory());
							list.add((float) input1.getSmoking());
							list.add((float) input1.getAlcohol());
							list.add((float) input1.getDiabetes());

							PrintWriter pw = new PrintWriter(
									new File("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\testset.csv"));
							StringBuilder sb = new StringBuilder();

							sb.append(input1.getAge());
							sb.append(',');
							sb.append(input1.getGender());
							sb.append(',');
							sb.append(input1.getBloodPressure1());
							sb.append(',');
							sb.append(input1.getBloodPressure2());
							sb.append(',');
							sb.append(input1.getCholesterol());
							sb.append(',');
							sb.append(input1.getHistory());
							sb.append(',');
							sb.append(input1.getSmoking());
							sb.append(',');
							sb.append(input1.getAlcohol());
							sb.append(',');
							sb.append(input1.getDiabetes());
							sb.append('\n');

							pw.write(sb.toString());
							pw.close();
							
							name = input1.getName();
							gender = input1.getGender();

						}
						String[] text = new String[6];
						try {
							String line;
							int count = 0;

							Process p = Runtime.getRuntime()
									.exec("cmd /c C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\test.py");

							BufferedReader bri = new BufferedReader(new InputStreamReader(p.getInputStream()));
							BufferedReader bre = new BufferedReader(new InputStreamReader(p.getErrorStream()));
							while ((line = bri.readLine()) != null) {

								text[count] = line.toString().replaceAll("(^\\[|\\]$)", "");
								count++;
								if (line.equals("[1.0]")) {
					%>
					<img src='resources/sad.png'
						style="width: 300px; height: 300px; margin-left: 384px; margin-top: -112px;">
					<script>
					function changeBackgroundRed(){
						document.getElementById("result").style.backgroundColor = "#CD1010"; 
					}
					
					changeBackgroundRed();</script>

					<div id="text" style="text-align: center; margin-left: -41px;">
						<%
					
					 if(gender==1){
						 out.println("Mr.");
					 }else{
						 out.println("Ms.");
					 }
					
					%><%=name %>
						, you have a high risk of having a heart attack. Please take care of
						your health!!
					</div>

					<%
						}

					if (line.equals("[0.0]")) {
					%>
					<img src='resources/happy.jpg'
						style="width: 300px; height: 300px; margin-left: 384px; margin-top: -112px;">
					<script>
					
					function changeBackgroundGreen(){
						document.getElementById("result").style.backgroundColor = "#0CA229 "; 
					}
					
					changeBackgroundGreen();</script>

					<div id="text" style="text-align: center; margin-left: -41px;">
						<%
					 if(gender==1){
						 out.println("Mr.");
					 }else{
						 out.println("Ms.");
					 }
					
					%><%=name %>
						, you have minimal risk of a heart attack! Great!!
					</div>

					<%
						}
							}

							bri.close();
							while ((line = bre.readLine()) != null) {
								out.println(line);
							}
							bre.close();
							p.waitFor();

						} catch (Exception err) {
							err.printStackTrace();
						}
					%>

					<%
						String test1 = text[1].toString().replaceAll("(^\\[|\\[|\\]|\\]$)", "");
						String test2 = text[2].toString().replaceAll("(^\\[|\\[|\\]|\\]$)", "");
						String test3 = text[3].toString().replaceAll("(^\\[|\\[|\\]|\\]$)", "");
						String test4 = text[4].toString().replaceAll("(^\\[|\\[|\\]|\\]$)", "");
						String test5 = text[5].toString().replaceAll("(^\\[|\\[|\\]|\\]$)", "");

						String[] parts = test1.split(",");
						float[] ageset = new float[parts.length];
						for (int i = 0; i < parts.length; i++) {
							ageset[i] = Float.parseFloat(parts[i]);
						}

						String[] parts1 = test2.split(",");
						float[] sbpset = new float[parts1.length];
						for (int i = 0; i < parts1.length; i++) {
							sbpset[i] = Float.parseFloat(parts1[i]);
						}

						String[] parts2 = test3.split(",");
						float[] dbpset = new float[parts2.length];
						for (int i = 0; i < parts2.length; i++) {
							dbpset[i] = Float.parseFloat(parts2[i]);
						}

						String[] parts3 = test4.split(",");
						float[] cholset = new float[parts3.length];
						for (int i = 0; i < parts3.length; i++) {
							cholset[i] = Float.parseFloat(parts3[i]);
						}
						
						String[] parts4 = test5.split(",");
						float[] hao = new float[parts4.length];
						for (int i = 0; i < parts4.length; i++) {
							hao[i] = Float.parseFloat(parts4[i]);
						}
					%>

					<%
						float age = 1, dbp = 1, sbp = 1, chol = 1;
						for (InputInformation input1 : inp) {
							age = input1.getAge();
							sbp = input1.getBloodPressure1();
							dbp = input1.getBloodPressure2();
							chol = input1.getCholesterol();
						}
					%>
				</div>
			</div>
			
			<div class='row-md-12' id='graphbox'>
			
			
				<div class='col-md-6 col-sm-6'>
					<canvas id='sbpgraph'></canvas>
				</div>
				<div class='col-md-6 col-sm-6'>
					<canvas id='dbpgraph'></canvas>
				</div>
				<%
				double usersbpprediction=0.4;
					if(sbp>=90 && sbp<=99){
						usersbpprediction = 0.51;
					}if(sbp>=100 && sbp<=109){
						usersbpprediction = 0.53;
					}if(sbp>=110 && sbp<=119){
						usersbpprediction = 0.545;
					}if(sbp>=120 && sbp<=129){
						usersbpprediction = 0.552;
					}if(sbp>=130 && sbp<=139){
						usersbpprediction = 0.561;
					}if(sbp>=140 && sbp<=149){
						usersbpprediction = 0.5717;
					}if(sbp>=150 && sbp<=159){
						usersbpprediction = 0.570;
					}if(sbp>=160 && sbp<=169){
						usersbpprediction = 0.63;
					}if(sbp>=170 && sbp<=179){
						usersbpprediction = 0.65;
					}if(sbp>=180 && sbp<=189){
						usersbpprediction = 0.68;
					}
				
					double userdbpprediction=0.4;
					if(dbp>=80 && dbp<=89){
						userdbpprediction = 0.5702;
					}if(dbp>=90 && dbp<=99){
						userdbpprediction = 0.567;
					}if(dbp>=100 && dbp<=109){
						userdbpprediction = 0.60;
					}if(dbp>=110 && dbp<=119){
						userdbpprediction = 0.64;
					}if(dbp>=120 && dbp<=129){
						userdbpprediction = 0.62;
					}
				%>
				<script type="text/javascript">
					let sbpchartarea = document.getElementById('sbpgraph')
							.getContext('2d');
					let dbpchartarea = document.getElementById('dbpgraph')
							.getContext('2d');

					let sbpChart = new Chart(sbpchartarea, {
						type : 'scatter',
						data : {
							datasets: [{
							label: "Systolic",
							data: [
							{
								x: 90,
								y: 0.51
							},
							{
								x: 100,
								y: 0.53
							},	
							{
								x: 110,
								y: 0.545
							},
							{
								x: 120,
								y: 0.552
							},
							{
								x: 130,
								y: 0.561
							},
							{
								x: 140,
								y: 0.5717
							},
							{
								x: 150,
								y: 0.570
							},{
								x: 160,	
								y: 0.63
							},{
								x: 170,
								y: 0.65
							},{
								x: 180,
								y: 0.68
							}
							],
							backgroundColor:"#EE4E3B",
							spanGaps: true,
							omitXLabels: true,
							fill: false,
							showLine : true
						 },
							{
							label: "User",
							data:[{
								x: <%=sbp%>,
								y: <%=usersbpprediction%>
							},
							{
								x:<%=sbp%>,
								y:0
							}
							
							],
							backgroundColor:"#223344",
							borderColor: "ff22aa",
							fill: false,
							showLine: true
						}],
							options : {}
					} 

					});

					let dbpChart = new Chart(dbpchartarea, {
						type : 'scatter',
						data : {
							datasets: [{
							label: "Diastolic",
							data: [
							
							{
								x: 80,
								y: 0.5702
							},
							{
								x: 90,
								y: 0.567
							},
							{
								x: 100,
								y: 0.60
							},{
								x: 110,
								y: 0.64
							},{
								x: 120,
								y: 0.62
							}
							],
							backgroundColor:"#EE4E3B",
							spanGaps: true,
							omitXLabels: true,
							fill: false,
							showLine : true
						 },
							{
							label: "User",
							data:[{
								x: <%=dbp%>,
								y: <%=userdbpprediction%>
							},
							{
								x:<%=dbp%>,
								y:0
							}
							
							],
							backgroundColor:"#223344",
							borderColor: "ff22aa",
							fill: false,
							showLine: true
						}],
							options : {}
					} 

					});
				</script>
			</div>
			<div class='row-md-12' id='graphbox'>
				<div class='col-md-6 col-sm-6'>
					<canvas id='cholgraph'></canvas>
				</div>
				<div class='col-md-6 col-sm-6'>
					<canvas id='agegraph'></canvas>
				</div>
				<%
				double userageprediction=0;
					if(age>=20 && age<=29){
						userageprediction = 0.28;
					}if(age>=30 && age<=39){
						userageprediction = 0.31;
					}if(age>=40 && age<=49){
						userageprediction = 0.59;
					}if(age>=50 && age<=59){
						userageprediction = 0.57;
					}if(age>=60 && age<=69){
						userageprediction = 0.52;
					}if(age>=70 && age<=79){
						userageprediction = 0.61;
					}
					
				double usercholprediction=0;
					if(chol>=140 && chol<=169){
						usercholprediction = 0.5715;
					}if(chol>=170 && chol<=199){
						usercholprediction = 0.5705;
					}if(chol>=200 && chol<=229){
						usercholprediction = 0.549;
					}if(chol>=230 && chol<=259){
						usercholprediction = 0.60;
					}if(chol>=260 && chol<=299){
						usercholprediction = 0.620;
					}
					
				%>
				<script type="text/javascript">
					let agechartarea = document.getElementById('cholgraph')
							.getContext('2d');
					let cholchartarea = document.getElementById('agegraph')
							.getContext('2d');

					let AgeChart = new Chart(agechartarea, {
						type : 'scatter',
						data : {
							datasets: [{
							label: "Age",
							data: [
								
							{
								x: 20,
								y: 0.28
							},
							{
								x: 30,
								y: 0.31
							},
							{
								x: 40,
								y: 0.59
							},{
								x: 50,
								y: 0.57
							},{
								x: 60,
								y: 0.52
							},{
								x: 70,
								y: 0.61
							}
							],
							backgroundColor:"#EE4E3B",
							spanGaps: true,
							omitXLabels: true,
							fill: false,
							showLine : true
						 },
							{
							label: "User",
							data:[{
								x: <%=age%>,
								y: <%=userageprediction%>
							},
							{
								x:<%=age%>,
								y:0
							}
							
							],
							backgroundColor:"#223344",
							borderColor: "ff22aa",
							fill: false,
							showLine: true
						}],
							options : {}
					} 
				});

					let CholChart = new Chart(cholchartarea, {
						type : 'scatter',
						data : {
							datasets: [{
							label: "Cholestrol",
							data: [
								
							{
								x: 140,
								y: 0.5715
							},
							{
								x: 170,
								y: 0.5705
							},
							{
								x: 200,
								y: 0.549
							},{
								x: 230,
								y: 0.60
							},{
								x: 260,
								y: 0.620
							}
							],
							backgroundColor:"#EE4E3B",
							spanGaps: true,
							omitXLabels: true,
							fill: false,
							showLine : true
						 },
							{
							label: "User",
							data:[{
								x: <%=chol%>,
								y: <%=usercholprediction%>
							},
							{
								x:<%=chol%>,
								y:0
							}
							
							],
							backgroundColor:"#223344",
							borderColor: "ff22aa",
							fill: false,
							showLine: true
						}],
							options : {}
					} 

					} );

				</script>
			</div>
		</div>
	</div>
</body>
</html>
