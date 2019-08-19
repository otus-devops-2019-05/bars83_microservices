resource "google_compute_instance" "app" {
  name         = "reddit-docker-ce-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-docker"]

  count = "${var.instances_count}"

  # параметры подключения provisioners
  connection {
    type  = "ssh"
    user  = "appuser"
    agent = false

    # путь до приватного ключа
    private_key = "${file(var.private_key_path)}"
  }
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }
  metadata {
    # путь до публичного ключа
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    access_config = {
      nat_ip = "${element(google_compute_address.app_ip.*.address,count.index)}"
    }
  }
}

resource "google_compute_address" "app_ip" {
  count = "${var.instances_count}"
  name  = "reddit-app-ip-${count.index}"
}
