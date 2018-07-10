<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Learning Hearts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" type="image/png"
	href="resources/icons/learningheart.png" />
<meta charset="utf-8">
<link rel='stylesheet' type='text/css' href='CSS/home.css'>
<link
	href="https://fonts.googleapis.com/css?family=Acme|Luckiest+Guy|Permanent+Marker|Satisfy"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#form').validate({
			onfocusout: false,
		    onkeyup: false,
		    onclick: false,
			rules : {
				fname : {
					required : true
				},
				age : {
					required : true
				},
				gender : {
					required : true
				},
				bloodPressure1 : {
					required : true
				},
				bloodPressure2 : {
					required : true
				},
				cholesterol : {
					required : true
				},
				history : {
					required : true
				},
				smoking : {
					required : true
				},
				alcohol : {
					required : true
				},
				diabetes : {
					required : true
				}
			   			   
			},
			 submitHandler: function(form1) {
			        form1.submit();
			  },
			  showErrors: function (errorMap, errorList) {
			        $("#error").html(this.numberOfInvalids() + " fields are empty");
			        this.defaultShowErrors();
			    },
			    errorPlacement: function () {
			        return false; 
			    }
		    
		});

	});
</script>
</head>
<body>
	<div id='pagecontainer'>
		<div class='container'>
			<div id='header' class='row-md-12 row-sm-12 row-lg-12'>
				<div id='title'>
					Learning Hearts <img src='resources/logo.png'
						style="width: 100px; height: 100px;">
				</div>
			</div>
			<nav class="navbar navbar-default">
			<div class='container-fluid'>
				<ul class="nav navbar-nav" id='menu'>
					<li class='active'><a>Home</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li><a href="about.html">About</a></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="container">

			<div id='content' class='row-md-12 row-lg-12 row-sm-12'>
				<div class="row">
					<div
						class="col-lg-6 col-lg-offset-6 col-md-8 col-md-offset-4 col-sm-10 col-sm-offset-2">
						<form name='f1' class="validateform" id='form' method='POST'
							action="result">

							<div class="row">
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 15px; font-size: 18px; color: #4c4a12;">Your
										Name</div>
									<div class='col-sm-8' style="color: #3d436f;">
										<input id='textfield' type='text' name='fname'
											placeholder="Name" class='form-control'>
									</div>
								</div>
							</div>
							<div class="row">
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 18px; font-size: 18px; color: #4c4a12;">Your
										Age</div>
									<div class='col-sm-8'>
										<input type='text' id='textfield' name='age' placeholder='Age'
											class='form-control'
											style="margin-top: 18px; color: #3d436f;">

									</div>
								</div>
							</div>
							<div class='row'>
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 27px; font-size: 18px; color: #4c4a12;">Gender</div>
									<div class='col-sm-8' style="margin-top: 23px; color: #3d436f;">
										<input type='radio' name='gender' value='1' id='selectbutton'>Male
										<input type='radio' name='gender' value='0' id='selectbutton'>Female
									</div>
								</div>
							</div>
							<div class='row'>
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 40px; font-size: 18px; color: #4c4a12;">Blood
										Pressure</div>
									<div class='col-sm-8' style="margin-top: 23px; color: #3d436f;">
										<input type='text' name='bloodPressure1' id='textfield'
											placeholder='Systolic' class='form-control'
											style="width: 40%;"> <input type='text'
											name='bloodPressure2' id='textfield' placeholder='Diastolic'
											class='form-control'
											style="width: 40%; margin-top: -45px; margin-left: 170px">

									</div>
								</div>
							</div>
							<div class='row'>
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 39px; font-size: 18px; color: #4c4a12;">Total
										Cholesterol Level</div>
									<div class='col-sm-8' style="margin-top: 23px; color: #3d436f;">
										<input type='text' name='cholesterol' id='textfield'
											placeholder="mg" class='form-control'>
									</div>
								</div>
							</div>
							<div class='row'>
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 28px; font-size: 18px; color: #4c4a12;">Family
										History?</div>
									<div class='col-sm-8' style="margin-top: 23px; color: #3d436f;">
										<input type='radio' name='history' value='1' id='selectbutton'>Yes
										<input type='radio' name='history' value='0' id='selectbutton'>No
									</div>
								</div>
							</div>
							<div class='row'>
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 29px; font-size: 18px; color: #4c4a12;">Tobacco
										Usage</div>
									<div class='col-sm-8' style="margin-top: 23px; color: #3d436f;">
										<input type='radio' name='smoking' value='1' id='selectbutton'>Rarely
										<input type='radio' name='smoking' value='2' id='selectbutton'>Ocassionally
										<input type='radio' name='smoking' value='3' id='selectbutton'>Daily
										<input type='radio' name='smoking' value='0' id='selectbutton'>None
									</div>
								</div>
							</div>
							<div class='row'>
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 28px; font-size: 18px; color: #4c4a12;">Alcohol
										Usage</div>
									<div class='col-sm-8' style="margin-top: 23px; color: #3d436f;">
										<input type='radio' name='alcohol' value='1' id='selectbutton'>Rarely
										<input type='radio' name='alcohol' value='2' id='selectbutton'>Ocassionally
										<input type='radio' name='alcohol' value='3' id='selectbutton'>Daily
										<input type='radio' name='alcohol' value='0' id='selectbutton'>None
									</div>
								</div>
							</div>
							<div class='row'>
								<div class='form-group'>
									<div class='col-sm-4'
										style="margin-top: 27px; font-size: 18px; color: #4c4a12;">Diabetes</div>
									<div class='col-sm-8' style="margin-top: 23px; color: #3d436f;">
										<input type='radio' value='1' name='diabetes'
											id='selectbutton'>Yes <input type='radio' value='0'
											name='diabetes' id='selectbutton'>No
									</div>
								</div>
							</div>
							<div id="error"></div>
							<div class='row'>

								<div class='form-group'>
									<div class='col-sm-8 col-sm-offset-4'>
										<input type='submit' value='submit' class='button'>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id='footer'></div>
		</div>
</body>
</html>