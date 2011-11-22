
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

			//pooled = false
			//driverClassName = "com.mysql.jdbc.Driver"
		    //dialect = org.hibernate.dialect.MySQL5InnoDBDialect
		
            //dbCreate = "create-drop"
            //url = "jdbc:mysql://72.9.254.53:3306/franklins13"
	        //username = "root"
	        //password = "z23xe7rGwh"

		   	pooled = false
			dialect = org.hibernate.dialect.PostgreSQLDialect // honestly, not sure what
		    dbCreate = "create-drop" // one of 'create', 'create-drop','update'
		    //url = "jdbc:postgresql://72.9.254.53:5432/franklins13_dev"
		
			url = "jdbc:postgresql://localhost:5432/franklins13"
		    driverClassName = "org.postgresql.Driver"
		    username = "postgres"
			password = "postgres"
			
		    //password = "z23xe7rGwh"

		    // NOTE: both of these dialects have worked for me. But some people
		    // recommend using the net.sf version and not the org.hibernate version.
		    //dialect = org.hibernate.dialect.PostgreSQLDialect // honestly, not sure what
		    //dialect = net.sf.hibernate.dialect.PostgreSQLDialect // the difference is.


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
 			
/**
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
		    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
		
            dbCreate = "create-drop"
            url = "jdbc:mysql://localhost:3306/franklins13"
	        username = "root"
	        password = "z23xe7rGwh"
			properties {
			    maxActive = 50
			    maxIdle = 25
			    minIdle = 5
			    initialSize = 5
			    minEvictableIdleTimeMillis = 60000
			    timeBetweenEvictionRunsMillis = 60000
			    maxWait = 10000
			}
**/			
			
			
			pooled = true
			dialect = org.hibernate.dialect.PostgreSQLDialect
		    dbCreate = "create-drop" // one of 'create', 'create-drop','update'
		    url = "jdbc:postgresql://localhost:5432/franklins13"
		    driverClassName = "org.postgresql.Driver"
		    username = "postgres"
		    password = "P0st_6R35_Mc"
		
		
		
        }
    }
}
