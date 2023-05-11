package istio.authz

import future.keywords
import input.attributes.request.http as http_request

# Default is not allowed
default allow = false

status_code := 200 { allow } else := 403 { true }
body := "Unauthorized Operation" { status_code == 403 } else := "ok" { true }

result["allowed"] := allow
result["body"] := body
result["http_status"] := status_code
