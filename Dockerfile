# Get the Docker 3.7-alpine python installation
FROM python:3.7-alpine

# Identify who is maintaining this code
MAINTAINER Netrea.ch

# Ensure the Docker Python environment is running 'unbuffered'
ENV PYTHONUNBUFFERED 1

# Copy the projects requirements.txt file into the docker image
COPY ./requirements.txt /requirements.txt

# install all packages identified in the requirements.txt file
RUN pip install -r /requirements.txt

# Create a new app folder on our docker image
RUN mkdir /mysite

# Make this the working directory
WORKDIR /mysite

# Copy all files from our project app folder to the app folder on the
# Docker image
COPY ./mysite /app

# Create a user to run the appliation only (cannot log on w. this account)
# This ensures that we will not be using the root user to run the application
# and thus improve security.
RUN adduser -D app_user

# Switch to use the newly created user
USER app_user