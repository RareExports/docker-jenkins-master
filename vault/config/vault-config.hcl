backend "consul" {
  path = "vault/"
  address = "consul:8500"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}
ui = true