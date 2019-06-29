FROM alpine:3.7

ENV MONGO db_host

ENV RMQ_HOST queue_host
ENV RMQ_QUEUE urls

ENV RMQ_USERNAME guest
ENV RMQ_PASSWORD guest

ENV EXCLUDE_URLS ".*github.com"
ENV CRAWLER_URL "https://vitkhab.github.io/search_engine_test_site/"

WORKDIR /app
COPY . .

RUN apk add --update --no-cache python3 && \
    apk add --update --no-cache --virtual tmp_build build-base gcc py3-pip python3-dev && \
    pip3 install -r ./requirements.txt && \
    apk del tmp_build

CMD ["sh", "-c", "python3 -u crawler/crawler.py $CRAWLER_URL"]
