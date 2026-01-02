data "oci_identity_availability_domain" "ad_1" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

# Find Ubuntu 22.04 Minimal image for the current region
# This will automatically find the correct image OCID for the current region
data "oci_core_images" "ubuntu_22_04_minimal" {
  compartment_id           = var.tenancy_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape                    = "VM.Standard.E2.1.Micro"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

resource "random_string" "cluster_token" {
  length           = 48
  special          = true
  numeric          = true
  lower            = true
  upper            = true
  override_special = "^@~*#%/.+:;_"
}
