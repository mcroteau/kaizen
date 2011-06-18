class Account {

    String username
    String passwordHash
  
	String fullName
	String email
	boolean active
	
    static hasMany = [ roles: Role, permissions: String, virtueEntries: VirtueEntry]

    static constraints = {
        username(nullable: false, blank: false)
		email(nullable:false, blank:false, email:true)
    }


}
