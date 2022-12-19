terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}
provider "linode" {
  token = var.token
}

//Use the linode_lke_cluster resource to create
//a Kubernetes cluster
resource "linode_lke_cluster" "packtlke" {
    k8s_version = var.apiversion
    region = var.region

    dynamic "pool" {
        for_each = var.pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}

output "kubeconfig" {
   value = linode_lke_cluster.packtlke.kubeconfig
   sensitive = true
}