FROM alpine:3.9
LABEL MAINTAINER furkan.sayim@yandex.com

RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

RUN apk add git
RUN apk add build-base
RUN git clone https://github.com/Arno0x/WebDAVC2.git /tmp/webdavc2

WORKDIR /tmp/webdavc2
RUN pip install lib
RUN pip install pycryptodome
RUN chmod +x webdavC2.py

ENTRYPOINT ["python", "webdavC2.py"]
