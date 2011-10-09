
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {

            //dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            //url = "jdbc:hsqldb:mem:devDB"

		    pooled = true
	        dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            driverClassName = "com.mysql.jdbc.Driver"
		    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            url = "jdbc:mysql://localhost:8889/franklin13Test1"
            //url = "jdbc:mysql://franklin13.cz5gbshogmpq.us-east-1.rds.amazonaws.com:3306/franklin13"
            username = "franklin13"
            password = "franklin13"
		    properties {
		        maxActive = 50
		        maxIdle = 25
		        minIdle = 5
		        initialSize = 5
		        minEvictableIdleTimeMillis = 60000
		        timeBetweenEvictionRunsMillis = 60000
		        maxWait = 10000
		        validationQuery = "/* ping */"
			}

        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
}
