resource "linode_lke_cluster" "my-cluster" {
  label       = "michmato-cluster"
  k8s_version = var.k8s_version
  region      = var.region

  pool {
    type  = "g6-standard-2"
    count = 3
  }

  # lifecycle {
  #   ignore_changes = [
  #     pool.0.count
  #   ]
  # }
}

//Export this cluster's attributes
output "kubeconfig" {
  value     = linode_lke_cluster.my-cluster.kubeconfig
  sensitive = true
}

output "api_endpoints" {
  value = linode_lke_cluster.my-cluster.api_endpoints
}

output "status" {
  value = linode_lke_cluster.my-cluster.status
}

output "id" {
  value = linode_lke_cluster.my-cluster.id
}

output "pool" {
  value = linode_lke_cluster.my-cluster.pool
}
