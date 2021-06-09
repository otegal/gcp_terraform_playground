# インスタンスグループが利用する仮想マシンのテンプレート。
# このテンプレを元にインスタンスを複数作成していけまっせ。
resource "google_compute_instance_template" "default" {
  name_prefix = "default-"
  machine_type = "f1-micro"

  disk {
    source_image = "debian-cloud/debian-9"
  }

  network_interface {
    network = "default"
  }
}

# インスタンステンプレートを利用してリソース作成する。
resource "google_compute_region_instance_group_manager" "default" {
  name = "default"
  region = "asia-northeast1"
  version {
    instance_template = google_compute_instance_template.default.self_link # テンプレートを利用する
  }

  base_instance_name = "mig"
  target_size = 3
}