# speedtest from container
#
# docker run --rm --network="host" speedtest

FROM python:alpine

RUN apk update && apk add --no-cache openssl \
      && wget http://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
      && /bin/chmod +x speedtest.py

CMD ["python", "speedtest.py"]
