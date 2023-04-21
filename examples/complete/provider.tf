terraform {
	required_version = ">= 1.0"
	required_providers {
		aws = {
			version = ">= 4.50.0"
		}
		archive = {
			source = "hashicorp/archive"
			version = ">= 2.2.0"
		}
		random = {
			source = "hashicorp/random"
			version = ">= 3.1.0"
		}
	}
}
