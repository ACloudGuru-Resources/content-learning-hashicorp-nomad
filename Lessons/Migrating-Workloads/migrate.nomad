#Used in the Migrating Workloads lesson.
job "migrate" {
  datacenters = ["dc1"]

  migrate {
    max_parallel = 2
    health_check = "checks"
    min_healthy_time = "15s"
    healthy_deadline = "5m"
  }

  group "webapp" {
    count = 9

    task "webapp" {
      driver = "docker"
      config {
        image = "hashicorp/http-echo:0.2.3"
        args  = ["-text", "ok"]
        port_map {
          http = 5678
        }
      }

      resources {

        memory = 16

        network {
          mbits = 10
          port "http" {}
        }
      }
    }
  }
}

