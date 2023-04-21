# terraform-aws-sftp
This module aims to create a SFTP server with an identity provider based on:

- API Gateway
- Lambda
- AWS Secrets

This module will show the **DNS** and **EndPoint** that will allow us to connect to **_SFTP_**.

## Credential Store
The credentials can be stored as AWS Secrets.

The infrastructure code is based on the example provided (in the CF template) in the AWS Storage Blog article
https://aws.amazon.com/blogs/storage/enable-password-authentication-for-aws-transfer-family-using-aws-secrets-manager-updated//.

## TO DO
#### _The following resources will be created._

- [X] IAM Roles for:
    - SFTP
    - Api Gateway
    - Lambda
- [X] Transfer Family Server
- [X] Api Gateway
- [X] Lambda

#### _Route53 resources are optional, they will be created if the zone_name variable is provided._
- [X] Route53

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | >= 2.2.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.50.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1.0 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sftp_name"></a> [sftp\_name](#input\_sftp\_name) | SFTP DNS Name | `string` | `"sftp"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | The deployment stage | `string` | `"dev"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for resources | `map(string)` | `{}` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Zona Name | `string` | `""` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | SFTP EndPoint url |
| <a name="output_sftp_dns"></a> [sftp\_dns](#output\_sftp\_dns) | SFTP DNS |

### Usage
```terraform
module "sftp"{
  source  = "andresb39/sftp/aws"
  version = "0.0.2"
  # optional
  zone_name = "example.com"
  stage = "prod"
  tags = {
    owner       = "DevOps"
    managered   = "terraform"
}
}
```

# Examples
- [Complete](https://github.com/andresb39/terraform-aws-sftp/tree/main/examples/complete): With this example we are going to create a SFTP server with Identity Provider + S3 bucket + Credentials in AWS Secret Manage
