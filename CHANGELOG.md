# terraform-aws-sftp

Deploy Transfer Family with Identity Provider

## First deploy version **v0.0.1**

## Version **v0.0.2**

- [x] Remove the creation of the Route53 record for the SFTP server if no zone_name is provided
- [x] Fixed security issues
- [x] Fixed indentation issues
- [x] Add .editorconfig file
- [x] Edit README.md

## Version **v0.0.3**

- [x] Update terraform version
- [x] Edit Readme
- [x] Update locals

## Version **v0.0.4**

- [x] Incorporate a log group into the SFTP / ApiGateway.
- [x] Resolved the problem of Lambda's access to KMS for decrypting SecretManager.
