Debug = {
	
	LOG   : "LOG",
	INFO  : "INFO",
	WARN  : "WARN",
	DEBUG : "DEBUG",
	ERROR : "ERROR",
	
	init : function(){
		this.print('Debugger initialized..', Debug.INFO);
	},
	
	print : function(message, type){
		
		if(Alerting.debug && window.console){	
			switch(type) {
				case Debug.LOG:
				  	console.log(message);
				  	break;				
				case Debug.INFO:
			  		console.info(message);
			  		break;
				case Debug.WARN:
				  	console.warn(message);
				  	break;				
				case Debug.DEBUG:
					console.debug(message);
					break;	
				case Debug.ERROR:
				  	console.error(message);
				  	break;										
				default:
			  		console.log(message);
			}
			
		}
	}
}