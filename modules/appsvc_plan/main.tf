resource "azurerm_service_plan" "tfplan" {
  name                = "tfplan1234"
  resource_group_name = "myTFResourceGroup"
  location            = "westeurope"
  os_type             = "Linux"
  sku_name            = "F1"
}