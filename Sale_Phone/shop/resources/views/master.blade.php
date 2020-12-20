<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laravel </title>
    <base href="{{asset('')}}">
	<link href='http://fonts.googleapis.com/css?family=Dosis:300,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="source/assets/dest/css/font-awesome.min.css">
	<link rel="stylesheet" href="source/assets/dest/vendors/colorbox/example3/colorbox.css">
	<link rel="stylesheet" href="source/assets/dest/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="source/assets/dest/rs-plugin/css/responsive.css">
	<link rel="stylesheet" title="style" href="source/assets/dest/css/style.css">
	<link rel="stylesheet" href="source/assets/dest/css/animate.css">
	<link rel="stylesheet" title="style" href="source/assets/dest/css/huong-style.css">
	<style>
		.text-dark {
		color: #343a40!important;
		}

		.font-weight-bolder {
		font-weight: bolder!important;
		}

		a {
		color: #007bff;
		text-decoration: none;
		background-color: transparent;
		}

		.main-menu>ul.l-inline> li> a {
		color: #343a40;
		}

		.pb-5, .py-5 {
	    padding-bottom: 3rem!important;
		}
		.pt-5, .py-5 {
			padding-top: 3rem!important;
		}
		.bg-info {
			background-color: #17a2b8!important;
		}
		
		.col-sm {
		flex-basis: 0;
		flex-grow: 1;
		max-width: 100%;
		}

		.ml-3, .mx-3 {
		margin-left: 1rem!important;
		}
		.mr-3, .mx-3 {
		margin-right: 1rem!important;
		}
		.float-left {
		float: left!important;
		}

		div, form, fieldset, legend, label {
		margin: 0;
		padding: 0;
		}

		.text-white {
    	color: #fff!important;
		}
		.h6, h6 {
    	font-size: 1rem;
		}
		.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
		margin-bottom: .5rem;
		font-weight: 500;
		line-height: 1.2;
		}
		h1, h2, h3, h4, h5, h6 {
		margin-top: 0;
		margin-bottom: .5rem;
		}
		.bg-dark {
		background-color: #343a40!important;
		}

		.nav>li>a:hover {
    	background: #f90;
		}

		.nav>li>a:focus {
    	background-color: #343a40;
		}

		.single-item-title {
		font-size: 13px;
		}
	</style>
</head>
<body>

		@include('header')
	<div class="rev-slider">
		@yield('content')
	</div> <!-- .container -->
		@include('footer')
	


	<!-- include js files -->
	<script src="source/assets/dest/js/jquery.js"></script>
	<script src="source/assets/dest/vendors/jqueryui/jquery-ui-1.10.4.custom.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="source/assets/dest/vendors/bxslider/jquery.bxslider.min.js"></script>
	<script src="source/assets/dest/vendors/colorbox/jquery.colorbox-min.js"></script>
	<script src="source/assets/dest/vendors/animo/Animo.js"></script>
	<script src="source/assets/dest/vendors/dug/dug.js"></script>
	<script src="source/assets/dest/js/scripts.min.js"></script>
	<script src="source/assets/dest/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script src="source/assets/dest/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<script src="source/assets/dest/js/waypoints.min.js"></script>
	<script src="source/assets/dest/js/wow.min.js"></script>
	<!--customjs-->
	<script src="source/assets/dest/js/custom2.js"></script>
	<script>
	$(document).ready(function($) {    
		$(window).scroll(function(){
			if($(this).scrollTop()>150){
			$(".header-bottom").addClass('fixNav')
			}else{
				$(".header-bottom").removeClass('fixNav')
			}}
		)
	})
	</script>
</body>
</html>
