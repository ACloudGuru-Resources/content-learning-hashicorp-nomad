job "spread-test" {
  datacenters = ["dc1", "dc2"]
  type        = "service"

    target "dc1" {
      percent = 70
    }

    target "dc2" {
      percent = 30
    }
  }

  group "redis-cache" {
    count = 5

    task "redis" {
      driver = "docker"

      config {
        image = "redis:latest"

        port_map {
          db = 6379
        }
      }

      resources {
        network {
          port "db" {}
        }
      }

      service {
        name = "redis-cache"
        port = "db"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
