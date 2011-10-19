class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

	 	"/"
			{
				controller = "static"
				action = "welcome"
	 		}
	
	
		"500"(view:'/error')
	}
}
