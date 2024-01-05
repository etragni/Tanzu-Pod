# Tanzu CLI Docker Container

This repository provides a Dockerfile to build a container image with the Tanzu CLI (formerly known as `tks`) pre-installed. This allows users to quickly set up a Docker environment with Tanzu CLI, facilitating seamless interaction with VMware Tanzu Kubernetes Grid (TKG) clusters.

## Usage

### Prerequisites

- Docker installed on your system
- Valid Tanzu CLI credentials and configurations

### Build the Docker Image

Clone this repository and navigate to the project directory:

```bash
git clone https://github.com/your-username/tanzu-cli-docker.git
cd tanzu-cli-docker
```

```
docker build -t tanzu-cli-container .
```
### Run the Tanzu CLI Container
Once the image is built, you can run the container:

```
docker run -it tanzu-cli-container
```
