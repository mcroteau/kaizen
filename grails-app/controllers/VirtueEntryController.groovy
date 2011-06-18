class VirtueEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [virtueEntryInstanceList: VirtueEntry.list(params), virtueEntryInstanceTotal: VirtueEntry.count()]
    }

    def create = {
        def virtueEntryInstance = new VirtueEntry()
        virtueEntryInstance.properties = params
        return [virtueEntryInstance: virtueEntryInstance]
    }

	def newEntry = {
    	def virtueEntryInstance = new VirtueEntry()
    	virtueEntryInstance.properties = params
    	return [virtueEntryInstance: virtueEntryInstance]
	}

    def save = {
		println 'saving ... '
        def virtueEntryInstance = new VirtueEntry(params)
		def reformattedParms = onOffToBoolean(params)
		println reformattedParms
		
		def today = getTodaysDate()
		virtueEntryInstance.entryDate = today
		
		def todaysEntry = VirtueEntry.findByEntryDate(today)
		println todaysEntry
		if(todaysEntry){ 
			println 'today has already been entered'
			redirect(action : 'show', id:todaysEntry.id)
			return
		}
		
        if (virtueEntryInstance.save(flush: true)) {
			println 'really saving  ... '
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), virtueEntryInstance.id])}"
            redirect(action: "show", id: virtueEntryInstance.id)
			println 'here.. '
        }
        else {
			println 'redisplay create'
            render(view: "newEntry", model: [virtueEntryInstance: virtueEntryInstance])
        }
    }

	def onOffToBoolean(params){
		def reformattedParams = {}
		params.each{ key, value ->
			println key + ':' + value
		    if(value == 'on'){
				println 'turn to true'
				//reformattedParams[key] = true
			}
		}
	
		return reformattedParams
	}
	
    def show = {
        def virtueEntryInstance = VirtueEntry.get(params.id)
        if (!virtueEntryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
            redirect(action: "list")
        }
        else {
            [virtueEntryInstance: virtueEntryInstance]
        }
    }

    def edit = {
        def virtueEntryInstance = VirtueEntry.get(params.id)
        if (!virtueEntryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [virtueEntryInstance: virtueEntryInstance]
        }
    }

    def update = {
        def virtueEntryInstance = VirtueEntry.get(params.id)
        if (virtueEntryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (virtueEntryInstance.version > version) {
                    
                    virtueEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'virtueEntry.label', default: 'VirtueEntry')] as Object[], "Another user has updated this VirtueEntry while you were editing")
                    render(view: "edit", model: [virtueEntryInstance: virtueEntryInstance])
                    return
                }
            }
            virtueEntryInstance.properties = params
            if (!virtueEntryInstance.hasErrors() && virtueEntryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), virtueEntryInstance.id])}"
                redirect(action: "show", id: virtueEntryInstance.id)
            }
            else {
                render(view: "edit", model: [virtueEntryInstance: virtueEntryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def virtueEntryInstance = VirtueEntry.get(params.id)
        if (virtueEntryInstance) {
            try {
                virtueEntryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'virtueEntry.label', default: 'VirtueEntry'), params.id])}"
            redirect(action: "list")
        }
    }

	def getTodaysDate(){
		def date = new Date()
		println 'date : ' + date
		
		date.clearTime()
		println 'new date : ' + date
		return date
	}
}
