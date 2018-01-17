provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

data "google_container_engine_versions" "reddit_version" {
  zone = "${var.zone}"
}

resource "google_container_cluster" "reddit" {
  name = "${var.cluster_name}"
  zone = "${var.zone}"
  node_version       = "${data.google_container_engine_versions.reddit_version.latest_node_version}"
  initial_node_count = "${var.cluster_node_count}"
  min_master_version = "${data.google_container_engine_versions.reddit_version.latest_master_version}"
  node_config {
    machine_type = "${var.cluster_node_machine_type}"
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.zone}"
  }
}

resource "google_container_node_pool" "bigpool" {
  name               = "bigpool"
  zone               = "${var.zone}"
  cluster    = "${google_container_cluster.reddit.name}"
  node_count = "${var.bigpool_node_count}"

  node_config {
    machine_type = "${var.bigpool_node_machine_type}"
    disk_size_gb = "${var.bigpool_node_disk_size_gb}"
  }
}
