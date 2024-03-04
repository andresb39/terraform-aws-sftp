# terraform-aws-sftp

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
This module aims to create a SFTP Server on AWS with an identity provider (IdP) based on users and passwords.
- The SFTP Server is created using the AWS Transfer Family service.
- The IdP is created using lambda functions and API Gateway.

This module will show the **DNS** and **EndPoint** that will allow us to connect to **SFTP**.

## Credentials stored
The credentials can be stord as AWS Secrets Manager.

## References
The infrastructure code is based on the example provided (in the CF template) in the AWS Storage Blog article
https://aws.amazon.com/blogs/storage/enable-password-authentication-for-aws-transfer-family-using-aws-secrets-manager-updated/

## To DO
- [X] IAM Roles for:
  - [X] Lambda
  - [X] Transfer
- [X] Lambda functions
- [X] API Gateway
- [X] SFTP Server
- [X] CloudWatch Log Group

### Route53 DNS record is optional and can be created if the variable `zone_name` is set.

## Usage
```hcl
module "sftp" {
 source    = "andresb39/sftp/aws"
 version   = "0.0.3"
 zone_name = "example.com" # Optional
 stage     = "dev"

 tags = {
  Environment = "dev"
  Project     = "sftp"
  Team        = "devops"
 }
}
```

# Examples
- [Complete](https://github.com/andresb39/terraform-aws-sftp/tree/main/examples/complete): With this example we are going to create a SFTP server with Identity Provider + S3 bucket + Credentials in AWS Secret Manage

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.6.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.4.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.38 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.4.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_account.api_gateway_account](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/api_gateway_account) | resource |
| [aws_api_gateway_deployment.deployment](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_method_settings.all](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_rest_api.apigateway_rest](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.stage](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_log_group.transfer](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.lambda_idp_policy](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_policy) | resource |
| [aws_iam_role.apigateway_idp_role](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda_idp_role](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_role) | resource |
| [aws_iam_role.sftp](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_role) | resource |
| [aws_iam_role.sftp_log](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.apigateway_cloudwatchlogs](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_basic_execution](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_idp](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.sftp_log_group](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/kms_alias) | resource |
| [aws_kms_key.sftp_log_group](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/kms_key) | resource |
| [aws_lambda_function.lambda_idp](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_apigateway](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/lambda_permission) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/route53_record) | resource |
| [aws_transfer_server.sftp](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/resources/transfer_server) | resource |
| [random_string.random_suffix](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/string) | resource |
| [archive_file.sftp_idp](https://registry.terraform.io/providers/hashicorp/archive/2.4.0/docs/data-sources/file) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_common](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda_idp_policy](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/data-sources/region) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/5.38/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy to | `string` | `"us-east-1"` | no |
| <a name="input_sftp_name"></a> [sftp\_name](#input\_sftp\_name) | The name of the SFTP server | `string` | `"sftp"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage (e.g. dev, test, prod) | `string` | `"dev"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources | `map(string)` | <pre>{<br>  "Environment": "dev",<br>  "ManagedBy": "Terraform",<br>  "Project": "sftp",<br>  "Team": "DevOps"<br>}</pre> | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The name of the Route53 zone | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint of the SFTP server (e.g. s-12345678.server.transfer.us-west-2.amazonaws.com) |
| <a name="output_sftp_dns"></a> [sftp\_dns](#output\_sftp\_dns) | The DNS of the SFTP server (e.g. sftp.example.com) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
