    variable "token" {
      description = "Your Linode API Personal Access Token. (required)"
    }

    variable "apiversion" {
      description = "The Kubernetes version to use for this cluster. (required)"
      default = "1.23"
    }

    variable "region" {
      description = "The region where your cluster will be located. (required)"
      default = "us-east"
    }

    variable "pools" {
      description = "The Node Pool specifications for the Kubernetes cluster. (required)"
      type = list(object({
        type = string
        count = number

      }))
      default = [
        {
          type = "g6-standard-4"
          count = 3
        },
        {
          type = "g6-standard-8"
          count = 3
        }
      ]
    }