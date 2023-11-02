# complete

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Whit this example you can create a sftp server in aws with Idp authentication + S3 bucket + Credentials in AWS Secret Manager
## To DO
- [X] IAM Roles for:
  - [X] Lambda
  - [X] Transfer
  - [X] API Gateway
- [X] Lambda functions
- [X] API Gateway
- [X] SFTP Server
- [X] S3 Bucket
- [X] AWS Secret Manager
- [X] Route53 DNS record

## Usage
```shell
terraform init
terraform plan
terraform apply
```
## Clean up
```shell
terraform destroy
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_secrets"></a> [secrets](#module\_secrets) | ./secrets | n/a |
| <a name="module_sftp"></a> [sftp](#module\_sftp) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Username to access | `string` | `"sftpadmin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns"></a> [dns](#output\_dns) | SFTP DNS |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | SFTP endpoint |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
