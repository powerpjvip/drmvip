FROM python:3.9.2-slim-buster
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
COPY . .
RUN pip3 install -r requirements.txt
CMD python3 bot.py
