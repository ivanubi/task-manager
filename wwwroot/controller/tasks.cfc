component {
    remote struct function list() produces="application/json" httpMethod="GET" returnFormat="json" {
        cfheader( name="Content-Type", value="application/json" );
        if (cgi.request_method != 'GET') {
            return {
                success = false,
                data = []
            };
        }

        
        out = {
            success = true,
            data = []
        };

        // Call model.task getTasks static method
        tasks = new model.Task().getTasks();
        return out;
    }  

    remote struct function create(required string name, required string description) produces="application/json" httpMethod="POST" returnFormat="json" {
        cfheader( name="Content-Type", value="application/json" );
        if (cgi.request_method != 'POST') {
            return {
                success = false,
                data = []
            };
        }

        out = {
            success = true,
            data = {}
        };

        // Call model.task createTask static method
        task = new model.Task().createTask(arguments.name, arguments.description);
        out.data = task;
        return out;
    }

    remote struct function update(
        required numeric taskId, 
        string name = '', 
        string description = '', 
        string status = ''
    ) httpMethod="POST" produces="application/json" returnFormat="json" {
        cfheader( name="Content-Type", value="application/json" );
        if (cgi.request_method != 'POST') {
            return {
                success = false,
                data = []
            };
        }

        out = {
            success = true,
            data = {}
        };

        var task = new model.Task().getTaskById(arguments.taskId);

        task.update(
            name=arguments.name ?: "",
            description=arguments.description ?: "",
            status=arguments.status ?: ""
        );
        out.data = task;
        return out;
    }

    remote struct function delete(required numeric taskId) produces="application/json" httpMethod="POST" returnFormat="json" {
        cfheader( name="Content-Type", value="application/json" );
        if (cgi.request_method != 'POST') {
            return {
                success = false,
                data = []
            };
        }

        out = {
            success = true,
            data = {}
        };

        var task = new model.Task().getTaskById(arguments.taskId); 
        task = task.delete(arguments.taskId);
        out.data = task;
        return out;
    }
}
  