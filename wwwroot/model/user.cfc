/**
 * Represents a User entity.
*/
component persistent="true" accessors="true" {
    property name="userid" fieldtype="id" column="userid" generator="increment";
	property name="Email" sqltype="VARCHAR(255)" ormtype="string";
    property name="Password" sqltype="VARCHAR(255)" ormtype="string";
    property name="CreatedAt" sqltype="DATETIME" ormtype="date";
	property name="IsDeleted" ormtype="boolean" dbdefault="0" default="false";
    
    /** 
      *  Gets a user by email
      *  @email User's email
      *  @return Returns the given user
    */
    static function getUserByEmail(required string email) {
        return entityLoad(entityName="User", Filter={Email: arguments.email}, unique="true");
    }

    /** 
      *  Retrieves all users
      */
    static function getUsers() {
        return entityLoad("User");
    }

    /** 
      *  Create a new user
      *  @email User's email
      *  @password User's password, it will be hashed before saving
      *  @return Returns the given user
    */
    static function createUser(required string email, required string password) {
        var user = entityNew("User");
        user.setEmail(arguments.email);
        // Hash the password before saving it
        user.setPassword(hash(arguments.password));
        entitySave(user);
        return user;
    }

    /** 
      *  Deletes the user
    */
    static function deleteUser(required numeric userId) {
        var user = getUserById(arguments.userId);
        user.setIsDeleted(true);
        entitySave(user);
        return user;
    }

    /** 
      *  Verifies if the given email and password match a user
    */
    static function authenticateUser(required string email, required string password) {
        var user = entityLoad(entityName="User", Filter={Email: arguments.email, Password: hash(arguments.password)}, unique=true);
        if (!isDefined('user') || isNull(user)) {
            return;
        }
        return user;
    }
}