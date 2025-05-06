# Infrastructure setup

## Overview

This repository contains Terraform configurations to provision and manage GCP resources for the analytics pipeline. Currently, the script focuses on creating a BigQuery dataset and a table to store structured data used for analytics and reporting.

The repository is designed with scalability in mind, allowing future resource provisioning to be seamlessly integrated as the project evolves.

---

## Features

### Functionality (v0.1.0)

1. **BigQuery Dataset:**

   - Creates a BigQuery dataset for storing analytics data.
   - Configurable properties like dataset ID, location, and description.

2. **BigQuery Table:**
   - A table within the dataset with schema definition.
   - Supports ingestion-ready table structure for further ETL and reporting.

### Functionality (v0.2.0)

1. **GCS Buckets:**
   - Primary Storage Bucket for general data storage.
   - Logging Bucket to store logs for auditing and diagnostics.
   - Configurable bucket names, location, and lifecycle policies.

### Functionality (v0.3.0)

1. **Monitoring:**
   - Added monitoring for `compute-decider` cloud run function.

## Getting Started

### Prerequisites

1. Install Terraform (v1.x or later).
2. Authenticate with GCP using the gcloud CLI:
   ```bash
   gcloud auth application-default login
   ```
3. Ensure you have the required IAM permissions for creating GCP resources (e.g., BigQuery Admin).

### Usage

1. **Clone the Repository:**

   ```bash
    git clone git@github.com:DataArize/prj-wayne-infrastructure.git
    cd prj-wayne-infrastructure/terraform/environment/development
   ```

2. **Initialize Terraform:**

   ```bash
   terraform init
   ```

3. **Review and Configure Variables:**

   ```hcl
   project_id             = "your-gcp-project-id"
   bigquery_dataset_id    = "your-dataset-id"
   bigquery_table_id      = "your-table-id"
   dataset_location       = "us"
   storage_bucket         = "your-gcp-bucket-name"
   logging_bucket         = "your-gcp-bucket-name"
   service_name           = "your-cloud-run-function-service-name"
   ```

4. **Run Terraform Plan:**

   ```bash
   terraform plan
   ```

5. **Apply the Configuration:**

   ```bash
   terraform apply
   ```

6. **Verify Resources in GCP Console:**

   - Navigate to BigQuery in the GCP Console to see the newly created dataset and table.

---

## Future Enhancements

- **Provisioning Additional BigQuery Tables:**
  - Add more tables to support new analytics workflows.
- **ETL Pipeline Integration:**
  - Connect Cloud Functions or Dataflow for automated data ingestion.
- **IAM Configuration:**
  - Add fine-grained access control using IAM roles and permissions.

---

## Version History

| Version | Date       | Updates                                 | Author         |
| ------- | ---------- | --------------------------------------- | -------------- |
| v0.1.0  | 2025-04-20 | Initial release: Added BigQuery setup   | A.V. Amith Sai |
| v0.2.0  | 2025-04-24 | Added storage bucket and logging bucket | A.V. Amith Sai |
| v0.3.0  | 2025-05-06 | Added monitoring for cloud run services | A.V. Amith Sai |

---

## **Contributing**

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/**`.
3. Commit your changes: `git commit -m "feat: Add detailed commit message"`.
4. Push to the branch: `git push origin feature/**`.
5. Open a pull request.

---

## **License**

This project is licensed under the MIT License - see the LICENSE file for details.
