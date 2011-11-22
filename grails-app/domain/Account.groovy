class Account {

    String username
    String passwordHash
  
	String fullName
	String email
	
	boolean active
	//boolean publicProfile
	
	boolean isMale
	
	//String location
	
	//int totalEntries
	//int totalScore
	 
	
	
    static hasMany = [ roles: Role, permissions: String, virtueEntries: VirtueEntry]

    static constraints = {
        username(unique:true, nullable: false, blank: false)
		email(unique:true, nullable:false, blank:false, email:true)
    }
	
	static mapping = {
    	id generator: 'sequence', params:[sequence:'ID_ACCOUNT_PK_SEQ']
  	}


}
