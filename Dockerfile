FROM python:alpine3.7

MAINTAINER Igor Idzikovskyi

COPY . /app
WORKDIR /app

RUN pip install pipenv
RUN set -ex && pipenv install --deploy --system


ENTRYPOINT ["gunicorn", "-c", "build/config/gunicorn.py", "app:app"]