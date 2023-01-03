# Create a HashiCorp Vault Server
#
#
dnf -y update
dnf -y upgrade
#
dnf install -y dnf-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
dnf -y install vault
#
vi config.hcl
#
storage "raft" {
  path    = "./vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = "true"
}

disable_mlock = true

api_addr = "http://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8201"
ui = true
#
vault server -config=config.hcl
#
export VAULT_ADDR='http://127.0.0.1:8200'
#
vault operator init
#
# Unseal Key 1: d3kix/saufCS/0+4kj3k1Ik+nyT329j10tkXFCRZU6Qf
# Unseal Key 2: mJEtSLM8K8Ded6ZY3vfPKqzFOxNp149nU9F00GHp1s9g
# Unseal Key 3: 2CUaCkwRg2gCRHzJVtkG5Vjx3Xf00pd10Hpb76XIDoMz
# Unseal Key 4: 7csjkolvE5frvY3sErBarJGAykgymnNkMaGojRV68Na0
# Unseal Key 5: MPTiQfe1kDu49YIH3POGVqkTZrJF5tmxurXE+KR4GYQa

# Initial Root Token: hvs.maJcsS2q1NRV1lI55zVUZq41

# Vault initialized with 5 key shares and a key threshold of 3. Please securely
# distribute the key shares printed above. When the Vault is re-sealed,
# restarted, or stopped, you must supply at least 3 of these keys to unseal it
# before it can start servicing requests.

# Vault does not store the generated root key. Without at least 3 keys to
# reconstruct the root key, Vault will remain permanently sealed!

# It is possible to generate new unseal keys, provided you have a quorum of
# existing unseal keys shares. See "vault operator rekey" for more information.





