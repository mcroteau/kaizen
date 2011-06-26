<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="mobile" />
        <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
        <title>Franklins 13 : Log Todays Entry</title>
    </head>
    
	<body>
	
	<div data-role="page">
	
		<div data-role="header" data-theme="b">
			<a href="login.html" rel="external">login</a>
			<h1>Dashboard</h1>
			<a href="#help" data-icon="alert" class="ui-btn-right" data-transition="pop">Help</a>
		</div><!-- /header -->

		<div data-role="content">	
										
			<div id="chart1"></div>
										
			<div data-role="fieldcontain">
				
				<fieldset data-role="controlgroup" data-type="horizontal" data-role="fieldcontain">
				<!-- <legend>Choose a pet:</legend> -->
					<input type="radio" name="radio-choice-1" id="radio-choice-1" value="choice-1" checked="checked" />
					<label for="radio-choice-1">Week</label>

					<input type="radio" name="radio-choice-1" id="radio-choice-2" value="choice-2"  />
					<label for="radio-choice-2">Month</label>

					<input type="radio" name="radio-choice-1" id="radio-choice-3" value="choice-3"  />
					<label for="radio-choice-3">All Time</label>

				</fieldset>
			
			</div>
					
					
		</div><!-- /content -->

		<div data-role="footer">
			<div data-role="navbar">
				<ul>
					<li><g:link controller="virtueEntry" rel="external" data-icon="star" data-iconpos="top" action="newEntry">Todays Entry</g:link></li>
						<!-- <a href="virtueEntry/newEntry" rel="external" data-icon="star" data-iconpos="top">Todays Entry</a> -->
					<li><g:link controller="static" rel="external" data-icon="star" data-iconpos="top" action="dashboard" class="ui-btn-active">Dashboard</g:link></li>
						<!-- <a href="dashboard.html"  class="ui-btn-active" class="" data-role="button" data-icon="grid" data-iconpos="top">Dashboard</a>	 -->
					<li><a href="#definitions" class="" data-role="button" data-icon="info" data-iconpos="top" data-transition="pop" >Virtues Defined</a>
				</ul>
			</div>
		</div><!-- /footer -->
			
	</div>


	
	<g:render template="/help/help"/>
	<g:render template="/help/definitions"/>
	
	
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/jqplot/', 'jquery.jqplot.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/jqplot/plugins/', 'jqplot.dateAxisRenderer.min.js')}"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			var line1=[['2008-09-30 4:00PM',4], ['2008-10-30 4:00PM',6.5], ['2008-11-30 4:00PM',5.7], ['2008-12-30 4:00PM',9], ['2009-01-30 4:00PM',8.2]];
		  	var plot1 = $.jqplot('chart1', [line1], {
		    	title:'Default Date Axis',
		    	axes:{
		        	xaxis:{
		        	  	renderer:$.jqplot.DateAxisRenderer, 
		        	  	tickOptions:{formatString:'%b %#d, %y'},
		        	  	tickInterval:'1 month'
		        	}		
				},

			    // seriesDefaults: {
			    //     show: true,     // wether to render the series.
			    //     xaxis: 'xaxis', // either 'xaxis' or 'x2axis'.
			    //     yaxis: 'yaxis', // either 'yaxis' or 'y2axis'.
			    //     label: '',      // label to use in the legend for this line.
			    //     color: '',      // CSS color spec to use for the line.  Determined automatically.
			    //     lineWidth: 2.5, // Width of the line in pixels.
			    //     shadow: true,   // show shadow or not.
			    //     shadowAngle: 45,    // angle (degrees) of the shadow, clockwise from x axis.
			    //     shadowOffset: 1.25, // offset from the line of the shadow.
			    //     shadowDepth: 3,     // Number of strokes to make when drawing shadow.  Each
			    //                         // stroke offset by shadowOffset from the last.
			    //     shadowAlpha: 0.1,   // Opacity of the shadow.
			    //     showLine: true,     // whether to render the line segments or not.
			    //     showMarker: true,   // render the data point markers or not.
			    //     fill: false,        // fill under the line,
			    //     fillAndStroke: false,       // *stroke a line at top of fill area.
			    //     fillColor: undefined,       // *custom fill color for filled lines (default is line color).
			    //     fillAlpha: undefined,       // *custom alpha to apply to fillColor.
			    //     renderer: $.jqplot.LineRenderer],    // renderer used to draw the series.
			    //     rendererOptions: {}, // options passed to the renderer.  LineRenderer has no options.
			    //     markerRenderer: $.jqplot.MarkerRenderer,    // renderer to use to draw the data
			    //                                                 // point markers.
			    //     markerOptions: {
			    //         show: true,             // wether to show data point markers.
			    //         style: 'filledCircle',  // circle, diamond, square, filledCircle.
			    //                                 // filledDiamond or filledSquare.
			    //         lineWidth: 2,       // width of the stroke drawing the marker.
			    //         size: 9,            // size (diameter, edge length, etc.) of the marker.
			    //         color: '#666666'    // color of marker, set to color of line by default.
			    //         shadow: true,       // wether to draw shadow on marker or not.
			    //         shadowAngle: 45,    // angle of the shadow.  Clockwise from x axis.
			    //         shadowOffset: 1,    // offset from the line of the shadow,
			    //         shadowDepth: 3,     // Number of strokes to make when drawing shadow.  Each stroke
			    //                             // offset by shadowOffset from the last.
			    //         shadowAlpha: 0.07   // Opacity of the shadow
			    //     }
			    // },
		    	series:[{lineWidth:4, markerOptions:{style:'square'}}]
		  	});
		});
	
	</script>
		
	</body>
	
</html>