ijob "main-application" {
  datacenters = ["dc1"]

  group "cache" {
    task "redis" {
      driver = "docker"

      config {
        image = "redis:$.0"

        port_map {
          db = 6379
        }
      }

      resources {
        cpu    = 500
        memory = 256

        network {
          mbits = 10
          port "db" {}
        }
      }
    }
  }
}

