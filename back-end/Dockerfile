# TODO: select a base image
# Tip: start with a full base image, and then see if you can optimize with
#      a slim or tensorflow base

#      Standard version
FROM python:3.10.9-buster

#      Slim version
# FROM python:3.10.9-slim-buster

#      Tensorflow version
# FROM tensorflow/tensorflow:2.10.0

#      Or tensorflow to run on Apple Silicon (M1 / M2)
# FROM armswdev/tensorflow-arm-neoverse:r22.11-tf-2.10.0-eigen


# Copy everything we need into the image
COPY packagename packagename
COPY api api
COPY requirements_prod.txt requirements.txt
COPY setup.py setup.py
COPY .env .env

# Install everything
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install .

# Make directories that we need, but that are not included in the COPY
RUN mkdir /raw_data
RUN mkdir /models

# TODO: to speed up, you can load your model from MLFlow or Google Cloud Storage at startup using
# RUN python -c 'replace_this_with_the_commands_you_need_to_run_to_load_the_model'

CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT
