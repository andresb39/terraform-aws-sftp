locals {
  suffix                     = join("-", [random_string.random_suffix.result, var.stage])
  function_name              = join("-", ["lambda-idp", local.suffix])
  filename                   = join("/", [path.module, "sftp-idp.zip"])
  apigateway_idp_role_name   = join("-", ["apigateway-idp-role", local.suffix])
  sftp_role_name             = join("-", ["sftp-server-iam-role", local.suffix])
  sftp_log_role_name         = join("-", ["sftp-server-iam-log-role", local.suffix])
  lambda_idp_role_name       = join("-", ["lambda-idp-role", local.suffix])
  lambda_idp_iam_policy_name = join("-", ["lambda-idp-iam-policy", local.suffix])
  apigateway_rest_name       = join("-", ["apigateway-idp", local.suffix])
  auth_source_value          = data.aws_region.current.name
  sftp_log_group             = join("/", ["/aws", "transfer", local.suffix])
}
