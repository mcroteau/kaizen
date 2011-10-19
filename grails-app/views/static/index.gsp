<html>
<head>
    <title>Franklins 13 App</title>
    <meta name="layout" content="main" />
<body>
	
	<p class="large">Will doing what is "right" make us happy?</p>
	<p class="medium">Will we be happier if we follow principles that are simple yet require us to be thoughtful, disciplined & hard working?</p>
	
	<p class="medium">Franklin's 13 might help us answer that question</p>
	
	
	<!-- <div id="basechart" style="width:100%"></div> -->
	    
	


	
	<script type="text/javascript" src="${resource(dir:'js/lib/', 'excanvas.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/dygraph/', 'dygraph-combined.js')}"></script>
	
	

<script type="text/javascript">

	$(document).ready(function(){
		
		// var graphdata = ${graphdata};
		
		var datalines = '2011/10/17 13:08:31,558.0606399999997,665.3119,-136.46310000000085\n';
		datalines += '2011/10/17 13:16:04,552.9481400000004,664.5175,-137.0625\n'
		datalines += '2011/10/17 13:23:40,550.5393800000002,665.4069,-137.12247999999818\n'
		datalines += '2011/10/17 13:31:10,557.7824999999993,664.14752,-137.61248000000342\n'
		datalines += '2011/10/17 13:38:40,553.9875200000006,664.7394,-137.5593599999993\n'
		datalines += '2011/10/17 13:46:19,557.8550200000009,665.53126,-136.73309999999765\n'
		datalines += '2011/10/17 13:53:51,557.8156199999994,664.48188,-136.48122000000149\n'
		datalines += '2011/10/17 14:01:30,556.5062799999996,666.99374,-136.09937999999966\n'
		datalines += '2011/10/17 14:09:02,558.8081399999992,665.94816,-135.97810000000027\n'
		datalines += '2011/10/17 14:16:34,555.6975000000002,664.9594,-136.58873999999923\n'
		datalines += '2011/10/17 14:24:13,560.2381399999995,666.2094,-135.68059999999969\n'
		datalines += '2011/10/17 14:31:48,561.2831399999995,666.78126,-135.18686000000162\n'
		datalines += '2011/10/17 14:39:20,556.6149999999998,666.2969,-135.40497999999934\n'
		datalines += '2011/10/17 14:46:57,556.8681400000005,667.57064,-134.94872000000032';
		
	 	g30 = new Dygraph(
			document.getElementById('basechart'), 
			datalines,
			{
				//visibility: [hDisplayed, dDisplayed, zDisplayed],
				gridLineColor: '#DDDDDD',
			    highlightCircleSize: 3,
				pointSize: 1,
			    strokeWidth: 2,               
				labelsDivWidth: 130,
				axisLabelFontSize: 8,
				labels: ["Date", "Satisfaction", "Another", "yet another"],  	  
			        
				labelsDivStyles: {
				 	'background-color': 'efefef',
					'top': '0px',
				 	'left':'60px',
				 	'padding':'3px',
				 	'fontSize':'10px',
				 	'opacity':'0.9',
				 	'lineHeight':'1.4em'
				},
				
				drawPoints: true,
				includeZero: true,
				//pixelsPerXLabel: 200,
				//pixelsPerYLabel: 150,
			    
				//dateWindow: [Date.parse(start_date_time), Date.parse(end_date_time)],	
				colors: ['#ff3b1c','#11eb53','#0F5D7E'],
				
				// colors: ['#11eb53','#0F5D7E'],
				labelsSeparateLines: true
				
			    //valueRange: [ (defined_nano*(-1)),defined_nano]
			
			}
			
		);
			
	});

</script>



</body>
</html>
