resource "random_integer" "ri" {
  min = 10000
  max = 99999

}

resource "azurerm_storage_account" "stg_acc" {
  name                     = "stgacc${random_integer.ri.result}"
  resource_group_name      = var.rg_name
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier = "Cool"
}

resource "azurerm_storage_share" "stg_fs" {
  name                 = "stgacc${random_integer.ri.result}fs"
  storage_account_name = azurerm_storage_account.stg_acc.name
  quota                = 1
  access_tier = "Cool"

  depends_on = [ azurerm_storage_account.stg_acc ]
}

resource "azurerm_storage_share_file" "penguin" {
  name             = "linux.png"
  storage_share_id = azurerm_storage_share.stg_fs.id
  source           = "${path.root}/modules/stg_acc/linux.png"

  depends_on = [ azurerm_storage_share.stg_fs ]
}