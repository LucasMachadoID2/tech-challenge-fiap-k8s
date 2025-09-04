terraform {
  cloud {
    organization = "danilo-fiap"
    workspaces {
      name = "w-fiap-prod"
    }
  }
}
