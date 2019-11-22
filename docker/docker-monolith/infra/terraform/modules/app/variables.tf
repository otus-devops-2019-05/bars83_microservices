variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable instances_count {
  description = "Count of reddit-app instances"
  default     = 1
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for provisioning ssh access"
}
