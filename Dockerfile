#
# Dockerfile for image containerising PSDI's Knowledge Base site
#
#
# Building the image
# ------------------
#
# 1. Download the service repo containing the source code
#    from https://github.com/PSDI-UK/psdi-common-style/tree/main
# 2. Copy this file into the main directory of the repo
# 3. From within the main directory of the repo, use docker to build the image
#    'psdi-common-style' via the command
#    ``docker build -t psdi-common-style .``
#
# To check that the image has been build run ``docker images``, which should
# list an image called 'psdi-common-style'.
#
#
# Running the service
# -------------------
#
# The command ``docker run -p 8080:80 psdi-common-style`` will run the
# service on port 8000 of localhost, with logs output to stdout. To access the
# service visit http://localhost:8080 in your browser.
#

FROM nginx:alpine

ARG TAG
ENV TAG=$TAG
ARG TAG_SHA
ENV TAG_SHA=$TAG_SHA
ARG SHA
ENV SHA=$SHA

#set web server timout to more than application default (60)
ENV TIMEOUT=90

COPY . /usr/share/nginx/html
