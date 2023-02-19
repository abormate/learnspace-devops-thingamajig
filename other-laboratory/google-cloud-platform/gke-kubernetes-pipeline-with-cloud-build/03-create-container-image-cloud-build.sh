# -------------------------------------------- #
#
# Task 3 - Create container image with Cloud Build
#
# -------------------------------------------- #

#
# Code cloned already contains following Dockerfile
#

FROM python:3.7-slim
RUN pip install flask
WORKDIR /app
COPY app.py /app/app.py
ENTRYPOINT ["python"]
CMD ["/app/app.py"]

#
# With this (above) Dockerfile, you can create a container image with Cloud Build and store it in Artifact Registry.
# In Cloud shell, create build based on the latest commit with the following
#

cd ~/hello-cloudbuild-app
