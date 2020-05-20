resource "digitalocean_droplet" "web2" {
  image = "ubuntu-18-04-x64"
  name = "web2"
  region = "fra1"
  size = "512mb"
  private_networking = true
  user_data = "${file("config/webuserdata.sh")}"
  ssh_keys = [
        "${var.ssh_fingerprint}"
  ]
  connection {
      user = "root"
      type = "ssh"
      host = "${digitalocean_droplet.web2.ipv4_address}"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }
}
