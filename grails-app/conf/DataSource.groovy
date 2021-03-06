
dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}



hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
			
 
        	//dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
        	//url = "jdbc:h2:mem:devDb;MVCC=TRUE"


			//pooled = false
			//driverClassName = "com.mysql.jdbc.Driver"
		    //dialect = org.hibernate.dialect.MySQL5InnoDBDialect
		
            //dbCreate = "create-drop"
            //url = "jdbc:mysql://72.9.254.53:3306/franklins13"
	        //username = "root"
	        //password = "z23xe7rGwh"

		   	pooled = false
			dialect = org.hibernate.dialect.PostgreSQLDialect // not sure what
		    dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql://localhost:5432/franklins13"
		    driverClassName = "org.postgresql.Driver"
		    username = "postgres"
			password = "postgres"

			
			
			/**
			pooled = true
			dialect = org.hibernate.dialect.PostgreSQLDialect
		    dbCreate = "update" // one of 'create', 'create-drop','update'
		    url = "jdbc:postgresql://66.215.159.231:5432/test_franklins"
		    driverClassName = "org.postgresql.Driver"
		    username = "postgres"
		    password = "P0st_6R35_Mc"
			
			**/
		
			/**
			pooled = true
			dialect = org.hibernate.dialect.PostgreSQLDialect
		    dbCreate = "create-drop" // one of 'create', 'create-drop','update'
		    url = "jdbc:postgresql://66.215.159.231:5432/prod_franklins13"
		    driverClassName = "org.postgresql.Driver"
		    username = "postgres"
		    password = "P0st_6R35_Mc"
			
		**/
			
		    // NOTE: both of these dialects have worked for me. But some people
		    // recommend using the net.sf version and not the org.hibernate version.
		    //dialect = org.hibernate.dialect.PostgreSQLDialect 
		    //dialect = net.sf.hibernate.dialect.PostgreSQLDialect 


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
		    dbCreate = "update" // one of 'create', 'create-drop','update'
		    url = "jdbc:postgresql://localhost:5432/prod_franklins13"
		    driverClassName = "org.postgresql.Driver"
		    username = "postgres"
		    password = "P0st_6R35_Mc"
		
		
		
        }
    }
}
