provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_container_cluster" "reddit" {
  name = "${var.cluster_name}"
  zone = "${var.zone}"
  initial_node_count = "${var.cluster_node_count}"

  node_config {
    machine_type = "${var.cluster_node_machine_type}"
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.zone}"
  }
}
