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
#
#
#

The app and env repositories are kept separate because they have different lifecycles and uses. The main users of the app repository are actual humans and this repository is dedicated to a specific application. The main users of the env repository are automated systems (such as Cloud Build), and this repository might be shared by several applications. The env repository can have several branches that each map to a specific environment (you only use production in this lab) and reference a specific container image, whereas the app repository does not.
