FROM alpine:3.7

ENV MONGO db_host

WORKDIR /app
COPY . .

RUN apk add --update --no-cache python3 && \
    apk add --update --no-cache --virtual tmp_build build-base gcc py3-pip python3-dev && \
    pip3 install -r ./requirements.txt && \
    apk del tmp_build

WORKDIR /app/ui

ENV FLASK_APP "ui.py"

CMD ["gunicorn", "ui:app", "-b", "0.0.0.0"]
