<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Task Management</title>
    <!-- CSS files -->
    <link href="./static/vendors/tabler/dist/css/tabler.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/tabler-flags.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/tabler-payments.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/tabler-vendors.min.css?1674944402" rel="stylesheet"/>
    <link href="./static/vendors/tabler/dist/css/demo.min.css?1674944402" rel="stylesheet"/>
    <style>
      @import url('https://rsms.me/inter/inter.css');
      :root {
      	--tblr-font-sans-serif: 'Inter Var', -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif;
      }
      body {
      	font-feature-settings: "cv03", "cv04", "cv11";
      }
    </style>
  </head>
  <body  class="theme-dark d-flex flex-column">
    <script src="./static/vendors/tabler/dist/js/demo-theme.min.js?1674944402"></script>
    <div class="page page-center">
      <div class="container container-normal py-4">
        <div class="row align-items-center g-4">
          <div class="col-lg">
            <div class="container-tight">
              <div class="card card-md">
                <div class="card-body">
                  <h2 class="h2 text-center mb-4">Login to your account</h2>
                  <form action="/controller/logins.cfc?method=login" method="POST">
                    <div class="mb-3">
                      <label class="form-label">Email address</label>
                      <input type="email" class="form-control" name="email" placeholder="your@email.com" value="admin@admin.com" required>
                    </div>
                    <div class="mb-2">
                      <label class="form-label">
                        Password
                      </label>
                      <div class="input-group input-group-flat">
                        <input type="password" class="form-control" name="password" placeholder="Your password"  value="admin" required>
                      </div>
                    </div>
                    
                    <div class="form-footer">
                      <button type="submit" class="btn btn-primary w-100">Sign In</button>
                       <cfif structKeyExists(url, "error")>
                        <div class="alert mt-3 alert-danger alert-dismissible" role="alert">
                          <div class="d-flex">
                            <div>
                              <h4 class="alert-title">Invalid email or password</h4>
                            </div>
                          </div>
                          <a class="btn-close" data-bs-dismiss="alert" aria-label="close"></a>
                        </div>
                      </cfif>
                    </div>
                    <div>
                      <div class="text-center text-muted mt-3">
                        Sign in with the test account: admin@admin.com, password: admin
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Libs JS -->
    <!-- Tabler Core -->
    <script src="./static/vendors/tabler/dist/js/tabler.min.js?1674944402" defer></script>
    <script src="./static/vendors/tabler/dist/js/demo.min.js?1674944402" defer></script>
  </body>
</html>