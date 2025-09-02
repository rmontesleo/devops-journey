
terraform {
  backend "azurerm" {
    storage_account_name = "generaldevstorage202304"
    container_name = "webappstate"
    key = "webapp.tfstate"  # name of the file with the token, its the content of terraform.tfstate
    # access_key = "value"
  }

}