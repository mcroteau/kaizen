
/*

 splash.ajax is a helper wrapper class for all 
 jquery ajax calls

*/
AjaxHelper = {

	defaultOnSuccess : this.onSuccess,
	defaultOnFailure : this.onFailure,
	
	init : function(url, type, onSuccessCallback, onFailureCallback, params){
		
		if(window.console){this.debug(url, type, params)}
				
		if(type){
			
			try{
							
				$.ajax({
					url     : url,
					type    : type,
					data    : params,
					success : onSuccessCallback,
					error   : onFailureCallback
				});
					
			} catch (e){
				this.onFailure(e);
			}
			
		}else{
			this.onFailure('something went wrong');
		}
		
	},
	
	onSuccess : function(data){
		if(splash.debug){console.info('default on success');}
		if(splash.debug){console.info(data);}
	},
	
	onFailure : function(data){
		if(splash.debug){console.info('default on failure');}
		if(splash.debug){console.info(data);}
	},
	
	debug : function(url, type, paramsString){
		
		console.info('******  AJAX CALL ********');
	
		console.info('url: ' + url);
		console.info('type: ' + type);		
		console.info('params: ' + paramsString);
		
		console.info('**************************');
		
	}	
	
}