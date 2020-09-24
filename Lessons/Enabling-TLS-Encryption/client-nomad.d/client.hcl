client {
  enabled = true 
  servers = ["172.31.121.159","172.31.126.172","172.31.114.242"]
}
# Require TLS
tls {
  http = true
  rpc  = true

  ca_file   = "/etc/nomad.d/nomad-ca.pem"
  cert_file = "/etc/nomad.d/client.pem"
  key_file  = "/etc/nomad.d/client-key.pem"

 # verify_server_hostname = true
  verify_https_client    = true
}

