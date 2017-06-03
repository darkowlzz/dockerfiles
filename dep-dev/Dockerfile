# dep development in container
#
# docker run -ti --rm \
#       -v $PWD:/go/src/github.com/golang/dep \
#       dep-dev
#
# Run tests by passing `su dep -c "sh ~/runtest.sh"` to the above command. It
# runs the test commands as user dep.

FROM golang:alpine

# Create dep test user in abuild group. Make owner of /go, so that it can
# install packages.
RUN adduser -G abuild -g "dep test user" -s /bin/ash -D dep \
      && echo "dep ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
      && chown -R dep:abuild /go/*

# Install all the packages
RUN apk update && apk add --no-cache git gcc libc-dev bash mercurial bzr \
      && go get -v honnef.co/go/tools/cmd/gosimple \
      && go get -v honnef.co/go/tools/cmd/staticcheck

COPY ./runtest.sh /home/dep/runtest.sh

WORKDIR /go/src/github.com/golang/dep

CMD ["sh"]
