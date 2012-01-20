package franklins13

import org.apache.shiro.SecurityUtils

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
				println "request uri -> ${request.getRequestURI()}"
				println "request url -> ${request.getRequestURL()}"
				
				def subject = SecurityUtils.getSubject();
				if(subject?.getPrincipal() && !session?.rank){
					redirect(controller:'static', action:'refreshSessionStats', params: [targetUrl: request.getRequestURL()])
				}
            }
            afterView = {
                
            }
        }
    }
    
}
