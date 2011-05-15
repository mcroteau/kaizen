class Role {

    String name

    static hasMany = [ users: Account, permissions: String ]
    static belongsTo = Account

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
