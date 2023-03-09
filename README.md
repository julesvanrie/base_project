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

> :warning: **Back-end and front-end should go in separate repositories** :warning:

All commands needed have been included in the Makefiles:

### Back-end

- `make run_api` to run the API locally
- `make docker_#####` to run Docker stuff:
  - Commands to build and run (nteractively) a local Docker image
  - Commands to build and run (interactively) a Docker image ready for GCP (i.e. using linux/amd64 infra)
  - Commands to push and deploy to GCP

Just type `make <tab>` on the command line to see all possibilities

### Front-end
- `make streamlit`: defaults to `make streamlit_local`
- `make streamlit_local`: run streamlit locally and connect to local API (running through uvicorn on port 8000)
- `make streamlit_local_docker`: run streamlit locally and connect to local Docker container (running on port 8080)
- `make streamlit_cloud`: run streamlit locally and connect to cloud API

Just type `make <tab>` on the command line to see all possibilities

URIs for local and cloud APIs are included in the `.streamlit/secrets.toml` file (or in the Secrets setting on Streamlit Cloud)


## Complete the configuration

### Back-end

Copy `.env.sample` and `.env.yaml.sample` to new files `.env` and `.env.yaml` and update all variables with your project identifiers.

Requirements.txt:
- `requirements.txt`: for production excluding all packages that are redundant in prod
= `requirements_dev.txt`: adding packages for local usage including ipython, debugging, matplotlib, etc.
- Update `requirements.txt` if you use TensorFlow (uncomment the respective lines).

### Front-end

Complete the following files (if needed):
- `requirements.txt`
- `.streamlit/config.toml`: mainly for layout purposes
- `.streamlit/secrets.toml`: base it on the sample file; reflect the contents also in the Secrets settings on Streamlit Cloud

## Repository structure (highlights)

> :warning: **Back-end and front-end should go in separate repositories** :warning:

### Back-end

- `packagename/`: your package (rename this, and adapt the configuration files - tip: Ctrl-Shift-F or Cmd-Shift-F in VS Code)
  - `data/`: only small static data (no large files), or temporary files (not tracked by git)
- `api/`: this is where your API code goes
- `models/`: your saved models (not tracked by git, should be stored elsewhere: GCS, MLFlow, ...)
- `raw_data/`: your data (not tracked by git, should be stored elsewhere for cloud: GCS, MLFLow, ...)
- `notebooks/`: your notebooks, tracked by git, but avoid working with different people on one notebook (include your name in the filename)

### Front-end

- `app.py`: main streamlit page
- `pages/`: put a .py file per page here if you use multiple pages
- `media/`: store visual elements for your pages here
- `.streamlit/`: configuration files for streamlit
