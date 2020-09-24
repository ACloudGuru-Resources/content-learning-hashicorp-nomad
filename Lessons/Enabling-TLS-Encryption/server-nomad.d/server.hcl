server {
  enabled = true
  bootstrap_expect = 3
  encrypt = "E8b1ldy3iU1zWsWkxN5z1g=="
}

tls {
  http = true
  rpc  = true

  ca_file   = "/etc/nomad.d/nomad-ca.pem"
  cert_file = "/etc/nomad.d/server.pem"
  key_file  = "/etc/nomad.d/server-key.pem"

 #  verify_server_hostname = true
  verify_https_client    = true
  rpc_upgrade_mode = true
}

