# Default provider (first region in list)
provider "aws" {
  region = var.regions[0]
}

# Additional providers for each extra region
# Create a provider alias for each region
provider "aws" {
  alias  = "useast"
  region = var.regions[1]
}

