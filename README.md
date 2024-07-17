# Requirements
This project is tipically ran through Commandbox using an Adobe Colfusion 2021 engine (adobe@2021). See server.json for reference. server.json uses the port 40000 for the project.

- Adobe ColdFusion 2021
- MySQL 8.3.0

# Features

- Authentication and basic authorization
- Make, create, delete and update tasks (to update a task just click on a name or description)
- Changing themes between light mode and dark mode

# Setup 

1. Spin up a MySQL Database server and create a database.
2. Setup the default datasource for the created MySQL database. It can be done from the Application.cfc or directly from the admin panel on ColdFusion (preferably).
3. Run the application from the wwwrooot directory, preferebly using Commandbox (server start).
4. Go to localhost:40000 (or your custom port).
3. Log in with the credentials: (email: emailadmin@admin.com, password: admin).

# Third Party Libraries Used

As far as the backend goes no major third-party library or framework was used, that was intentional. I tried to keep the code organized into a Model-View-Controller hierarchy.

- JQuery: To make the page more interactive
- Datatables: To show the tasks as a highly interactive table
- Tabler CSS: Open-source bootstrap based theme, very easy to prototype on it