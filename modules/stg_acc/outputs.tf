output "conn_str" {
  value = azurerm_storage_account.stg_acc.primary_access_key
}

output "stgAccName" {
  value = azurerm_storage_account.stg_acc.name
}

output "shareName" {
  value = azurerm_storage_share.stg_fs.name
}