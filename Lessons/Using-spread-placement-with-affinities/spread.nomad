job "redis-spread" {
  datacenters = ["dc1", "dc2"]
  type        = "service"

  spread {
    attribute = "${node.datacenter}"
    weight    = 100

    target "dc1" {
      percent = 70
    }

    target "dc2" {
      percent = 30
    }
  }

  group "redis-cache" {
    count = 10

    task "redis" {
      driver = "docker"

      config {
        image = "redis:latest"

        port_map {
          db = 6379
        }
      }

      resources {

      memory = 16
      
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
