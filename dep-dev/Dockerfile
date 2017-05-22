FROM golang:alpine

# Create dep test user in abuild group. Make owner of /go, so that it can
# install packages.
RUN adduser -G abuild -g "dep test user" -s /bin/ash -D dep \
      && echo "dep ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
      && chown -R dep:abuild /go/*

# Install all the packages
RUN apk update && apk add git gcc libc-dev bash mercurial \
      && go get -v github.com/golang/dep \
      && go get -v honnef.co/go/tools/cmd/gosimple \
      && go get -v honnef.co/go/tools/cmd/staticcheck

COPY ./runtest.sh /home/dep/runtest.sh

WORKDIR /go/src/github.com/golang/dep

ENTRYPOINT ["sh"]
