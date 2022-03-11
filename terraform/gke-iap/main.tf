resource "google_project_service" "svc3" {
  project = var.project
  service = "iap.googleapis.com"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_project_service" "svc2" {
  project = var.project
  service = "compute.googleapis.com"

  lifecycle {
    prevent_destroy = true
  }
}

 resource "google_iap_web_iam_member" "member1" {
  project = var.project
  role = "roles/iap.httpsResourceAccessor"
  member = "user:aps.karthick@gmail.com"
depends_on=[
      google_project_service.svc3
  ]
}

resource "google_iap_web_iam_member" "member2" {
  project = var.project
  role = "roles/iap.httpsResourceAccessor"
  member = "user:testuserm@gmail.com"
depends_on=[
      google_project_service.svc3
  ]
}

 resource "google_iap_web_iam_member" "member3" {
  project = var.project
  role = "roles/iap.httpsResourceAccessor"
  member = "user:arnabgcp2022@gmail.com"
  depends_on=[
      google_project_service.svc3
  ]
}