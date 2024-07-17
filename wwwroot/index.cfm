<cfscript>
  tasks = new model.Task().getTasks();
</cfscript>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Task Managament - Technical Assessment</title>
    <link href="./static/vendors/tabler/dist/css/tabler.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/tabler-flags.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/tabler-payments.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/tabler-vendors.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/demo.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/datatables/css/dataTables.dataTables.min.css" rel="stylesheet"/>
    <link href="./static/vendors/datatables/extensions/editor.dataTables.css" rel="stylesheet"/>
    <style>
      @import url('https://rsms.me/inter/inter.css');
      :root {
      	--tblr-font-sans-serif: 'Inter Var', -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif;
      }
      body {
      	font-feature-settings: "cv03", "cv04", "cv11";
      }
      [contenteditable="true"].single-line {
          white-space: nowrap;
          overflow: hidden;
      } 
      [contenteditable="true"].single-line br {
          display:none;

      }
      [contenteditable="true"].single-line * {
          display:inline;
          white-space:nowrap;
      }
    </style>
  </head>
  <body class="theme-dark">
    <script src="./static/vendors/tabler/dist/js/demo-theme.min.js?1674944402"></script>
    <div class="page">
      <!-- Navbar -->
      <header class="navbar navbar-expand-md navbar-light d-print-none">
        <div class="container-xl">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
            <a href="/">
              Task Management - Technical Assessment
            </a>
          </h1>
          <div class="navbar-nav flex-row order-md-last">
            <div class="d-none d-md-flex">
              <a href="?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip"
		   data-bs-placement="bottom">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 3c.132 0 .263 0 .393 0a7.5 7.5 0 0 0 7.92 12.446a9 9 0 1 1 -8.313 -12.454z" /></svg>
              </a>
              <a href="?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode" data-bs-toggle="tooltip"
		   data-bs-placement="bottom">
               <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" /><path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7" /></svg>
              </a>
            </div>
            <div class="nav-item dropdown">
              <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">
                <div class="d-none d-xl-block ps-2">
                  <div>User</div>
                  <div class="mt-1 small text-muted"><cfoutput>#session.user.getEmail()#</cfoutput></div>
                </div>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <form action="/controller/logins.cfc?method=logout" method="POST">
                    <!--- Onclick submit this form --->
                    <button type="submit" class="dropdown-item" onclick="$(this).closest('form').submit();">Logout</button>
                  </form>
                </div>
              </a>
            </div>
          </div>
        </div>
      </header>
      <div class="page-wrapper">
        <!-- Page body -->
        <div class="page-body">
          <cfif (isDefined('url.newTask') and (url.newTask eq true))>
            <div>
              <div class="container-xl">
                <div class="row row-cards">
                  <div class="col-12">
                    <form action="/controller/tasks.cfc?method=create" method="POST">
                      <input type="hidden" name="redirectTo" value="/">
                      <div class="card">
                        <div class="card-body">
                            <div class="mb-3">
                              <label class="form-label">Title</label>
                              <input type="text" class="form-control" name="name" placeholder="Title" required>
                            </div>
                            <div class="mb-3">
                              <label class="form-label">Description</label>
                              <textarea class="form-control" name="description" rows="3" placeholder="Description" required></textarea>
                            </div>
                          <div class="card-footer d-flex flex-row flex-end justify-content-end align-items-center px-0 mx-0">
                            <a href="./" class="btn btn-secondary">Close</a>
                            <button type="submit" class="btn btn-primary ms-3"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg> Add Task</button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>       
            </div>
          </div>
          </cfif>
        </div>
        <div class="container-xl d-flex flex-column justify-content-center">
          <div class="card">
            <div class="card-header d-flex flex-row justify-content-between">
              <h3 class="card-title">Your Tasks</h3>
              <cfif !(isDefined('url.newTask') and (url.newTask eq true))>
                <div>
                  <a href="./?newTask=true" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                    Task
                  </a>
                </div>
              </cfif>
            </div>
            <div class="card-body" style="min-height: 60vh;">
              <div class="dropdown">
                <button id="filter-by-status" class="btn mb-3 btn-sm btn-ghost-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                  All Tasks
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <li><button class="dropdown-item" onclick="table.search('').draw(); document.getElementById('filter-by-status').innerHTML = 'All Tasks';">All</button></li>
                  <li><button class="dropdown-item" onclick="table.search('Pending').draw(); document.getElementById('filter-by-status').innerHTML = 'Pending Tasks';">Pending</button></li>
                  <li><button class="dropdown-item" onclick="table.search('In Progress').draw(); document.getElementById('filter-by-status').innerHTML = 'In Progress Tasks';">In Progress</button></li>
                  <li><button class="dropdown-item" onclick="table.search('Completed').draw(); document.getElementById('filter-by-status').innerHTML = 'Completed Tasks';">Completed</button></li>
                </ul>
              </div>
              <div class="table-responsive" style="min-height: 60vh;">
                <table id="tasks-table" class="table table-vcenter table-mobile-md card-table w-100 h-100">
                  <thead>
                    <tr>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Status</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <cfoutput>
                      <cfloop array="#tasks#" index="task">
                        <tr>
                          <td data-sort="#task.getName()#" data-search="#task.getName()#">
                            <form action="./controller/tasks.cfc?method=update" method="POST">
                                <input type="hidden" name="taskId" value="#task.getTaskId()#">
                                <input type="hidden" name="redirectTo" value="/">
                                <input type="hidden" name="name" value="#task.getName()#">
                                <div name="name" contenteditable="true" class="single-line">#task.getName()#</div>
                            </form>
                          </td>
                          <td data-sort="#task.getDescription()#" data-search="#task.getDescription()#">
                            <form action="./controller/tasks.cfc?method=update" method="POST">
                              <input type="hidden" name="taskId" value="#task.getTaskId()#">
                              <input type="hidden" name="redirectTo" value="/">
                              <input type="hidden" name="description" value="#task.getDescription()#">
                              <div name="description" contenteditable="true" class="single-line">#task.getDescription()#</div>
                            </form>
                          </td>
                          <td data-sort="#task.getStatus()#" data-search="#task.getStatus()#">
                            <div class="dropdown">
                              <button class="btn btn-sm btn-ghost-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                #task.getStatus()#
                              </button>
                              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li>
                                  <form action="./controller/tasks.cfc?method=update" method="POST">
                                    <input type="hidden" name="taskId" value="#task.getTaskId()#">
                                    <input type="hidden" name="status" value="Pending">
                                    <input type="hidden" name="redirectTo" value="/">
                                    <button class="dropdown-item">Pending</button>
                                  </form>
                                </li>
                                <li>
                                  <form action="./controller/tasks.cfc?method=update" method="POST">
                                    <input type="hidden" name="taskId" value="#task.getTaskId()#">
                                    <input type="hidden" name="status" value="In Progress">
                                    <input type="hidden" name="redirectTo" value="/">
                                    <button class="dropdown-item">In Progress</button>
                                  </form>
                                </li>
                                <li><form action="./controller/tasks.cfc?method=update" method="POST">
                                  <input type="hidden" name="taskId" value="#task.getTaskId()#">
                                  <input type="hidden" name="status" value="Completed">
                                  <input type="hidden" name="redirectTo" value="/">
                                  <button class="dropdown-item">Completed</button>
                                </form></li>
                              </ul>
                          </td>
                          <td>
                            <form action="./controller/tasks.cfc?method=delete" method="POST">
                              <input type="hidden" name="taskId" value="#task.getTaskId()#">
                              <input type="hidden" name="redirectTo" value="/">
                              <button type="submit" class="btn btn-sm btn-ghost-danger">
                                <div class="d-flex flex-row align-items-center justify-content-center">
                                  <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-trash"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7l16 0" /><path d="M10 11l0 6" /><path d="M14 11l0 6" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg> 
                                  <div>Delete</div>
                                </div>
                              </a>
                            </form>
                          </td>
                        </tr>
                      </cfloop>
                    </cfoutput>
                  </tbody>
                </table>
                <cfif (tasks.len() eq 0)>
                  <div class="empty">
                    <p class="empty-title">No tasks to show</p>
                    <cfif !(isDefined('url.newTask') and (url.newTask eq true))>
                    <p class="empty-subtitle text-muted">
                      That's okay, create your first one!
                    </p>
                    <div class="empty-action">
                      <a href="./?newTask=true" class="btn btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                        Add your first task
                      </a>
                    </div>
                    </cfif>
                  </div>
                </cfif>
              </div>
            </div>
          </div>
        </div>
        </div>
        <footer class="footer footer-transparent d-print-none">
          <div class="container-xl">
            <div class="row text-center align-items-center flex-row-reverse">
              <div class="col-lg-auto ms-lg-auto">
                <ul class="list-inline list-inline-dots mb-0">
                  <li class="list-inline-item">
                    <a href="https://github.com/sponsors/codecalm" target="_blank" class="link-secondary" rel="noopener">
                      Made by Ivan Ubiñas as a Technical Assessment for DefensePoint
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    <!-- Libs JS -->
    <!-- Tabler Core -->
    <script src="./static/vendors/tabler/dist/js/tabler.min.js?1674944402" defer></script>
    <script src="./static/vendors/tabler/dist/js/demo.min.js?1674944402" defer></script>
    <script src="./static/vendors/jquery/jquery-3.7.1.min.js"></script>
    <script src="./static/vendors/datatables/js/dataTables.min.js"></script>
    <script>
      let table;
      document.addEventListener("DOMContentLoaded", function() {
        // Initialize DataTable
        table = new DataTable(document.querySelector('#tasks-table'), {
          sortable: true,
          "dom": 'ftpr',
          "columnDefs": [
            { "orderable": false, "targets": 2 },
            { "orderable": false, "targets": 3 }
          ]
        });

        // Submit form when contenteditable div is blurred
        document.querySelectorAll('[contenteditable]').forEach(function(element) {
          element.addEventListener('blur', function() {
            // Get the value of the 'name' attribute
            var name = element.getAttribute('name');
            // Set the value of the input with the same name
            element.closest('form').querySelector('input[name="' + name + '"]').value = element.innerText;
            // Submit the form
            element.closest('form').submit();
          });
          // Add the same event when the Enter key is pressed
          element.addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
              event.preventDefault();
              element.blur();
            }
          });
        });
      });
    </script>
    
  </body>
</html>