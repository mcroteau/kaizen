<!DOCTYPE html> 
<html> 
	<head> 
	<title>Franklins 13 : Log Virtues Entry</title> 
    <link rel="stylesheet" href="${resource(dir:'js/lib/jquery/jquerymobile/jquery.mobile-1.0b3/',file:'jquery.mobile-1.0b3.min.css')}" /> 
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/jquerymobile/jquery.mobile-1.0b3/', 'jquery.mobile-1.0b3.min.js')}"></script>
	
	<style type="text/css">
		.clear{clear:both !important;}
		.message{font-weight:bold !important; color:#ff0000;}
	</style>
	
	<!--
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0b1/jquery.mobile-1.0b1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0b1/jquery.mobile-1.0b1.min.js"></script>
	-->
</head> 
<body>

	<g:layoutBody />

	<!-- <shiro:isLoggedIn> -->
	
	<!-- </shiro:isLoggedIn> -->
	<!-- <shiro:notAuthenticated>
		<script type="text/javascript">
			window.location = 'http://localhost:8080/franklins13/auth'
		</script>
	</shiro:notAuthenticated> -->	
	
	<script type="text/javascript">
	
		$(document).bind("mobileinit", function(){
			$.ajaxFormsEnabled = false;
		});
	
		//$('.ui-select ').parent().par.attr('')
			
	</script>
	
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-23684175-1']);
	  _gaq.push(['_trackPageview']);

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();

	</script>
	
</body>
</html>