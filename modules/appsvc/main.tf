locals {
  test = "jribeir0/test:latest"
  test2 = "jribeir0/test2:latest"
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999

}

resource "azurerm_linux_web_app" "tfapp" {
  count = var.num
  name                = "mytfapp-${random_integer.ri.result + count.index}"
  resource_group_name = "myTFResourceGroup"
  location            = "westeurope"
  service_plan_id     = var.plan_id

  virtual_network_subnet_id = var.subnet_id
  storage_account {
    access_key = var.acc_k
    account_name = var.stg_acc_name
    name = "app_fs_mount"
    share_name = var.shr_name
    type = "AzureFiles"
    mount_path = "/usr/share/nginx/html/mount"
  }

  site_config {
    always_on = false

    application_stack {
      docker_image_name = count.index %2 == 0 ? local.test : local.test2
      docker_registry_url = "https://index.docker.io"
    }
  }
}