provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "static-web-site"

  ports {
    internal = 80
    external = 8000
  }

  volumes {
    host_path      = "${path.cwd}/website"
    container_path = "/usr/share/nginx/html"
  }
}
