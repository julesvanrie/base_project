# Basic package setup for students to use

This is a generic boilerplate for basic ML/DL projects.
It has the basic functionality for doing one-off predictions based on simple inputs (i.e. not on images for example, or large numbers of inputs).

It contains nothing more than all the configuraton files for the project. No actual code.

## What's being used:
- Streamlit for the front end
- FastAPI serving the back end
- Model storage on GCS / MLFlow (python functions to be written)
- Everything to deploy with Docker

## Using this template:
All commands needed have been included in the Makefile
- `make run_api` to run the API locally
- `make docker_#####` to run Docker stuff:
  - Commands to build and run (nteractively) a local Docker image
  - Commands to build and run (interactively) a Docker image ready for GCP (i.e. using linux/amd64 infra)
  - Commands to push and deploy to GCP
Just type `make <tab>` on the command line to see all possibilities

## Complete the configuration
Copy `.env.sample` and `.env.yaml.sample` to new files `.env` and `.env.yaml` and update all variables with your project identifiers.

Requirements.txt:
- `requirements.txt`: for local usage including ipython, debugging, matplotlib, etc.
= `requirements_prod.txt`: for production excluding all packages that are redundant in prod
- Update `requirements.txt` and `requirements_prod.txt` if you use TensorFlow (uncomment the respective lines).

## Back-end and front-end should go in separate repositories
