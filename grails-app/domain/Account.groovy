class Account {

    String username
    String passwordHash
  
	String email
	
	boolean active
	boolean isMale
	
	int totalEntries
	int totalScore
	 
	//boolean publicProfile
	//String fullName
	//String location
	
	
    static hasMany = [ roles: Role, permissions: String, virtueEntries: VirtueEntry]

    static constraints = {
        username(unique:true, nullable: false, blank: false)
		email(unique:true, nullable:false, blank:false, email:true)
		totalEntries(nullable:true, blank:true)
		totalScore(nullable:true, blank:true)
    }
	
	
	static mapping = {
    	id generator: 'sequence', params:[sequence:'ID_ACCOUNT_PK_SEQ']
  	}


}
