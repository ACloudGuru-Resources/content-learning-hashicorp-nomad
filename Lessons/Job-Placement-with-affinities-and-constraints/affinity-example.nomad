job "redis" {
  datacenters = ["dc1", "dc2"]
  type        = "service"

  affinity {
    attribute = "${node.datacenter}"
    value     = "dc2"
    weight    = 100
  }

  group "cache1" {
    count = 4

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
