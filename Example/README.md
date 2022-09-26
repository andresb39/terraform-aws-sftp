<!-- BEGIN_TF_DOCS -->
# SFTP example 
With this example we are going to create a SFTP server with Identity Provider + S3 bucket + Credentials in AWS Secret Manage

## TO DO
#### _The following resources will be created._

- [X] IAM Roles for:
    - SFTP
    - Api Gateway
    - Lambda
- [X] Transfer Family Server
- [X] Api Gateway
- [X] Lambda
- [X] Route53
- [X] Bucket S3
- [X] Secret Manager credentials

## Usage
```
terraform init 
terraform plan
terraform apply
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Username to access | `string` | `"sftpadmin"` |   yes    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns"></a> [dns](#output\_dns) | SFTP DNS |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | SFTP endpoint |

## Clean Up
```
terraforom destroy
```

<!-- END_TF_DOCS -->