component {
    /** 
    *   Authenticates the user and saves the user in the session
    *   @email User's email
    *   @password User's password
    *   @return Returns a struct with the user information
    */
    remote struct function login(
        required string email,
        required string password
    ) httpMethod="POST" {
        if (cgi.request_method != 'POST') {
            location(url="/logins.cfm", addtoken="false");
            return out;
        }
        
        // Authenticate the user
        var user = new model.User().authenticateUser(arguments.email, arguments.password);
        if (!isDefined('user') || isNull(user)) {
            // Redirect back to the login page with an error message
            location(url="/logins.cfm?error=InvalidPassword",addtoken="false");
            return out;
        }
        
        // Save the user in the session
        session.user = user;
        location(url="/index.cfm", addtoken="false");
        return {
            success = true,
            data = user
        };
    } 

    /** 
    *   Log outs the user by destroying the session
    */
    remote struct function logout() httpMethod="POST" {
        if (cgi.request_method != 'POST') {
            location(url="/logins.cfm", addtoken="false");
            return out;
        }
        // Destroy the session
        structClear(session);
        location(url="/logins.cfm", addtoken="false");
        return out;
    }
}