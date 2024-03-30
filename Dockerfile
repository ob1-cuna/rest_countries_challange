FROM python:3.12-alpine

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Set work directory
WORKDIR /flask_paises
# Install dependencies
COPY requirements.txt /flask_paises/
RUN pip install --upgrade pip && pip install -r requirements.txt
# Copy project
COPY . /flask_paises

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs