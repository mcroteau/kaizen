class Account {

    String username
    String passwordHash
  
	String fullName
	String email
	boolean active
	boolean isMale 
	
    static hasMany = [ roles: Role, permissions: String, virtueEntries: VirtueEntry]

    static constraints = {
        username(nullable: false, blank: false)
		email(nullable:false, blank:false, email:true)
    }
	
	static mapping = {
    	//id generator: 'sequence', params:[sequence:'ID_ACCOUNT_PK_SEQ']
  	}


}
