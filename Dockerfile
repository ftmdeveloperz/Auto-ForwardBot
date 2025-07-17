FROM python:3.12-slim

# Install required system dependencies
RUN apt update && apt install -y \
    git gcc python3-dev libffi-dev build-essential \
 && apt upgrade -y

# Copy requirements file
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip3 install --upgrade pip && pip3 install -r /requirements.txt

# Set up working directory and entry point
RUN mkdir /fwdbot
WORKDIR /fwdbot
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
