# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.109.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "rg" {
  source = "./modules/rg"
}

module "appsvc_plan" {
  source = "./modules/appsvc_plan"

  depends_on = [
    module.rg
  ]
}

module "stg_acc" {
  source = "./modules/stg_acc"

  depends_on = [ module.rg ]

  rg_name = module.rg.rg_name
}

module "appsvc" {
  depends_on = [ module.stg_acc ]
  source  = "./modules/appsvc"

  plan_id = module.appsvc_plan.svc_plan_id
  num     = var.app_count

  acc_k = module.stg_acc.conn_str
  stg_acc_name = module.stg_acc.stgAccName
  shr_name = module.stg_acc.shareName

}