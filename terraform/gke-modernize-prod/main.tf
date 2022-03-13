resource "google_project_service" "svc1" {
  project = var.project
  service = "container.googleapis.com"

  depends_on=[
      google_project_service.svc4
  ]
}
resource "google_project_service" "svc4" {
  project = var.project
  service = "compute.googleapis.com"
}


resource "google_container_cluster" "primary" {
  name     = var.clsname
  location = var.region
depends_on = [
  google_project_service.svc1
]
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode = "VPC_NATIVE"

   
  
ip_allocation_policy {
   
    cluster_ipv4_cidr_block="/20"
    services_ipv4_cidr_block="/20"
  }

}

resource "google_compute_global_address" "bookstore_prod_ip_address" {
    name          = "bookstore-prod-ip"
    description    = "Public IP for gke.bookstore.cloudns.nz"
    address_type = "EXTERNAL"
    depends_on = [
  google_project_service.svc3
]
}

output "bookstore_prod_ip_address" {

value = google_compute_global_address.bookstore_prod_ip_address.address

}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.nodepool
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
   
    machine_type = "e2-medium"

   oauth_scopes    = [
      "https://www.googleapis.com/auth/devstorage.read_only",
                  "https://www.googleapis.com/auth/logging.write",
                  "https://www.googleapis.com/auth/monitoring",
                  "https://www.googleapis.com/auth/service.management.readonly",
                  "https://www.googleapis.com/auth/servicecontrol",
                  "https://www.googleapis.com/auth/trace.append"
    ]
  }
}

resource "google_project_service" "svc2" {
  project = var.project
  service = "sqladmin.googleapis.com"
}
resource "random_integer" "ri" {

 min=10
 max=500 
}

data "google_compute_network" "my-network" {
  name = "default"
  depends_on=[
      google_project_service.svc4
  ]
}

resource "google_sql_database_instance" "mtr" {
  provider = google

  name             = "sql-inst-${random_integer.ri.id}"
  region           = var.region
  database_version = "MYSQL_5_7"
 
 depends_on = [google_service_networking_connection.private_vpc_connection] 


deletion_protection = false
  settings {
    tier = "db-f1-micro"
    availability_type="REGIONAL"
     
         backup_configuration{
             enabled = true
             binary_log_enabled = true
         }

         

    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.my-network.id      
    }
  }
}



output "sqlmtr" {

value = google_sql_database_instance.mtr.ip_address.0.ip_address

}

resource "random_integer" "rs" {

 min=200
 max=500 
}

resource "google_sql_user" "users" {
  name     = var.dbusername
  instance = google_sql_database_instance.mtr.name
  
  password = "uniqpass-${random_integer.rs.id}"
}


resource "google_sql_database" "database" {
name     = var.dbname
instance = google_sql_database_instance.mtr.name
depends_on = [google_sql_database_instance.mtr]
provisioner "local-exec" {

command = "sleep 30;gcloud config set project ${var.project};gcloud sql import sql ${google_sql_database_instance.mtr.name} gs://bucket-vm-images-2022/book.sql --database=${var.dbname};"

}
}

resource "null_resource" "gkesetup_yaml" {
depends_on = [google_sql_database_instance.mtr]
provisioner "local-exec" {
command = "sleep 30;gcloud config set project ${var.project}; gcloud container clusters get-credentials ${var.clsname} --region ${var.region} --project ${var.project}; cd /tmp ; rm -rf bookstoreonk8s; git clone https://github.com/apskarthick/bookstoreonk8s.git; sed -i 's/DBHOST/'${google_sql_database_instance.mtr.ip_address.0.ip_address}'/g' bookstoreonk8s/yaml/prod/db-secret.yaml; sed -i 's/REPLACETHIS/uniqpass-'${random_integer.rs.id}'/g' bookstoreonk8s/yaml/prod/db-secret.yaml; sed -i 's/DBUSER/'${var.dbusername}'/g' bookstoreonk8s/yaml/prod/db-secret.yaml; kubectl create ns prod; kubectl apply -f bookstoreonk8s/yaml/prod/ -n prod; kubectl get ingress -n prod;"
}

}


resource "google_project_service" "svc3" {
  project = var.project
  service = "servicenetworking.googleapis.com"
  depends_on=[
      google_project_service.svc4
  ]
}

resource "google_compute_global_address" "private_ip_address" {
    provider="google"
    name          = "bookstore-prod-nw"
    purpose       = "VPC_PEERING"
    address_type = "INTERNAL"
    prefix_length = 16
    network       = "default"
    depends_on = [
  google_project_service.svc3
]
}

resource "google_service_networking_connection" "private_vpc_connection" {
    provider="google"
    network       = "default"
    service       = "servicenetworking.googleapis.com"
    reserved_peering_ranges = ["${google_compute_global_address.private_ip_address.name}"]
depends_on = [
  google_project_service.svc2
]
}
