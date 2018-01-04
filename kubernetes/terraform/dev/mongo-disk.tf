resource "google_compute_disk" "mongo_disk" {
  name = "reddit-mongo-disk"
  type = "${var.mongo_disk_type}"
  zone = "${var.zone}"
  size = "${var.mongo_disk_size}"
}
