terraform {
  # Версия terraform
  required_version = "~>0.11.7"
}

provider "google" {
  version = "2.0.0"
  project = "${var.project}"
  region  = "${var.region}"
}


module "app" {
  source            = "./modules/app"
  public_key_path   = "${var.public_key_path}"
  private_key_path  = "${var.private_key_path}"
  zone              = "${var.zone}"
  app_disk_image    = "${var.app_disk_image}"
  instances_count   = "${var.instances_count}"
}
