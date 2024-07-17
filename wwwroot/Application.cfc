component {
    this.name = "defensepointtest";
    this.nullSupport = true;
    // this.datasources = {
    //     "dbtest" = {
    //         database = "defensepointdb",
    //         host = "localhost",
    //         driver = "MySQL",
    //         port = "3306",
    //         username = "root",
    //         password = "123456" 
    //     }
    // };
    this.datasource = "dbtest";
    this.ORMSettings.dbcreate = "update";
    this.ORMSettings.cfclocation=expandpath('./model');
    this.mappings["/model"] = expandPath("./model");
    this.mappings["/controller"] = expandPath("./controller");
    this.ormenabled = true;
    this.sessionmanagement = "yes";
	
	boolean function onApplicationStart(){
        // Create a default admin user if it doesn't exist 
        // with the following credentials: 
        // Email: admin@admin.com
        // Password: admin
        var adminUser = new model.User().getUserByEmail("admin@admin.com");
        if (!isDefined('adminUser') || isNull(adminUser)) {
            new model.User().createUser(email: "admin@admin.com", password: "admin");
        }
        return true;
	}

	boolean function onRequestStart(string targetPage) {
        // Get ccurrent template
        var template = listLast(arguments.targetPage, "/");

        if (template == "logins.cfm") {
            // Check if the user is logged in
            if (structKeyExists(session, "user")) {
                location(url="/index.cfm", addtoken="false");
                return false;
            } else {
                return true;
            }
        }
        
        // Check if the user is logged in
        if (!structKeyExists(session, "user") && template != "logins.cfm" && template != "logins.cfc") {
            location(url="/logins.cfm", addtoken="false");
            return false;
        } else {
            return true;
        }

		return true;
	}

    void function onRequestEnd(required string targetPage) {
        if (isDefined('form.redirectTo')) {
            location(url="/", addtoken="false");
        }
    }

	void function onError(exception, eventName) {
        writeDump(exception);
    }
}