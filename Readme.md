#Terraform Basics
Guide to Terraform Block
1. Introduction
Key Concepts:
Understanding the Terraform Block and its significance.
Learning how to define and handle version constraints for both Terraform itself and providers within the Terraform Block.

2. Terraform Settings Block
Components of the Settings Block:
Required Terraform Version: Define the minimum or specific version of Terraform CLI required.
Provider Requirements: Specify required provider versions and configurations.
Terraform Backends: Configure backend storage for state files.
Experimental Language Features: Enable optional experimental features.
Metadata for Providers: Pass additional data to providers.
Example File: Review the provided file sample-terraform-settings.tf for detailed understanding.

3. Creating and Testing required_version
Understanding required_version:
This controls the minimum or exact version of the Terraform CLI that must be installed.
If the installed Terraform CLI version does not meet the specified constraints, Terraform will generate an error and stop execution.
Experimenting with required_version:
Modify the required_version constraints and observe the behavior of terraform init for different cases.
Sample Constraints:


terraform {
  required_version = "~> 0.14"
}

Testing Variants:


required_version = "~> 0.14.3"  # Allows patch versions ≥ 0.14.3 but < 0.15
required_version = "= 0.14.3"   # Requires exact version 0.14.3
required_version = "= 0.14.4"   # Requires exact version 0.14.4
required_version = ">= 0.13"    # Requires version 0.13 or newer
required_version = "= 0.13"     # Requires exact version 0.13
required_version = "~> 0.13"    # Allows patch versions ≥ 0.13 but < 0.14


Commands to Test:

# Check Terraform CLI version
terraform version

# Initialize Terraform
terraform init
4. Adding Providers and Testing required_providers
Using the required_providers Block:
Specifies all providers required by the module, including the source and version constraints.

Example required_providers Block:


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
Experimenting with Provider Versions:


version = "~> 3.0"             # Allows patch versions ≥ 3.0 but < 4.0
version = ">= 3.0.0, < 3.1.0"  # Allows minor versions between 3.0.0 and 3.1.0 (exclusive)
version = ">= 3.0.0, <= 3.1.0" # Allows minor versions between 3.0.0 and 3.1.0 (inclusive)
version = "~> 2.0"             # Allows patch versions ≥ 2.0 but < 3.0
Commands to Test:

# Initialize Terraform with upgrade option
terraform init -upgrade

5. Cleanup
Commands to Clean Up:
# Remove Terraform folders and files
rm -rf .terraform*