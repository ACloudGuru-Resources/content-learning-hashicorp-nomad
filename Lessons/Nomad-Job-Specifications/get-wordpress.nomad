# Note this this the code used in the Lesson.  It is likely you
# will need to replace the md5 sum for your own example.

job "get-wordpress" {

  datacenters = ["dc1"]

  type = "service"

  group "webs" {
    count = 1

    task "frontend" {
      driver = "docker"

    artifact {
       source      = "https://wordpress.org/wordpress-5.5.1.tar.gz"
       destination = "local/wordpress"
       options {
         checksum = "md5:72c6f56b4818ffd0e6e6a4ed8f3e8d4e"
          }
      }

      config {
        image = "httpd"
      }

      service {
        port = "http"

      }

      env {
        "DB_HOST" = "db01.example.com"
        "DB_USER" = "web"
        "DB_PASS" = "loremipsum"
      }

      resources {

        network {
          mbits = 100

          port "http" {
            static = 80
          }
        }
      }
    }
  }
}

