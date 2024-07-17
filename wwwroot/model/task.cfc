/**
 * Represents a Task entity.
*/
component persistent="true" accessors="true" {
    property name="taskid" fieldtype="id" column="taskid" generator="increment";
	property name="Name" ormtype="string" sqltype="VARCHAR(255)";
	property name="Description" ormtype="string" sqltype="VARCHAR(255)";
	property name="Status" ormtype="string"; // Pending, In Progress, Completed
    property name="CreatedAt" ormtype="date";
	property name="IsDeleted" ormtype="boolean" dbdefault="0" default="false";

     /** 
      *  Updates the task with the given values
      */
    public function update(string name='', string description='', string status='') {
        if (isDefined('arguments.name') && !(arguments.name == '')) {
            this.setName(arguments.name);
        }
        if (isDefined('arguments.description') && !(arguments.description == '')) {
            this.setDescription(arguments.description);
        }
        
        if (isDefined('arguments.status') && !(arguments.status == '')) {
            // Validate status
            if (arguments.status != "Pending" && arguments.status != "In Progress" && arguments.status != "Completed") {
                throw(message="Invalid status", detail="Status must be one of: Pending, In Progress, Completed");
            }
            this.setStatus(arguments.status);
        }
        
        entitySave(this);
        return this;
    }

    /** 
     *  Deletes the task
    */
    public function delete() {
        this.setIsDeleted(true);
        entitySave(this);
        return this;
    }

    /** 
      *  Returns the task with the given id
    */
    static function getTaskById(required numeric taskId) {
        // Filter by IsDeleted = false
        return entityLoad(entityName="Task", id=arguments.taskId, unique="true");
    }

    /** 
      *  Returns all tasks
    */
    static function getTasks() {
        return entityLoad(entityName="Task", filter={IsDeleted: false});
    }

    /** 
      *  Creates a new task
      *  @name Task's name or title
      *  @description Task's description
      *  @return Returns the created task
    */
    static function createTask(required string name, required string description) {
        var task = entityNew("Task");
        task.setName(arguments.name);
        task.setDescription(arguments.description);
        task.setStatus("Pending");
        task.setCreatedAt(now());
        entitySave(task);
        return task;
    }
}