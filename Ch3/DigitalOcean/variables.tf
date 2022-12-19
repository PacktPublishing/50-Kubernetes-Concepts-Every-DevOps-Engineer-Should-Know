variable "region" {
    type = string
    default = "nyc1"
}

variable "cluster_name" {
    type = string
    default = "packtdo01"
}

variable "k8s_version" {
    type = string
    default = "1.22.11-do.0"
}

variable "do_token" {
    type = string
    default = ""
    sensitive = true
}