Utilities = {
	
	//will return text after a specified character
	getSecondPart : function(str, character) {
	    return str.split(character)[1];
	},
	
	getRandomUUID : function() {
	    var S4 = function() {
	       return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	    };
	    return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
	}	
}