package franklins13

class LinkFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if(params.activeLink){
					if(params.activeLink == "dashboard"){
						request.dashboardActive = "active"
					}
					if(params.activeLink == "logentry"){
						request.logentryActive = "active"
					}
					if(params.activeLink == "history"){
						request.historyActive = "active"
					}					
				}
				
				println "before ->  activeLink : ${params.sort}"
            }
            after = {
				
				println "after ->  activeLink : ${params.sort}"
				println request.dashboardActive
            }
            afterView = {
                
            }
        }
    }
    
}
