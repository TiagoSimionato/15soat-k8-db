# 15soat-k8-db

Terraform infrastructure for running the PostgreSQL database used by the 15soat Tech Challenge in a Kubernetes cluster.

The configuration creates:

- A single-replica PostgreSQL 18 deployment.
- A Kubernetes `ClusterIP` service for internal access to PostgreSQL.
- The database, username, password, namespace, and port from Terraform variables.

## Repository structure

| File | Purpose |
| --- | --- |
| `infra/deployment.tf` | Defines the PostgreSQL deployment and its environment variables. |
| `infra/service.tf` | Exposes PostgreSQL inside the cluster through a `ClusterIP` service. |
| `infra/vars.tf` | Declares database, namespace, port, and Kubernetes connection variables. |
| `infra/versions.tf` | Configures the local state backend and the `kind` and Kubernetes providers. |

## Requirements

- Terraform compatible with the configured providers.
- A running Kubernetes cluster, such as Kind.
- Credentials and connection details for the target cluster.

## Usage

Run Terraform from the `infra` directory. Supply values for the variables declared in `vars.tf`, preferably through a local `terraform.tfvars` file or environment variables. The password should be provided securely and should not be committed to the repository.

```bash
cd infra
terraform init
terraform plan
terraform apply
```

After applying, workloads in the configured namespace can reach the database through the service named `db-svc-15soat-tech-challenge` on port `5432` (or the configured `db_port`).
