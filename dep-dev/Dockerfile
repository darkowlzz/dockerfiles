# dep development in container
#
# docker run -ti --rm \
#       -v $PWD:/go/src/github.com/golang/dep \
#       dep-dev
#
# Run tests by passing `su dep -c "sh ~/runtest.sh"` to the above command. It
# runs the test commands as user dep.

FROM golang:latest

# Create dep test user in abuild group. Make owner of /go, so that it can
# install packages.
RUN adduser --shell /bin/bash --disabled-password --gecos "" dep \
      && echo "dep ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
      && chown -R dep:dep /go/* \
      && echo "PATH=\"/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"" >> /etc/environment

# Install all the packages
RUN apt update && apt install git mercurial bzr \
      && go get -v honnef.co/go/tools/cmd/gosimple \
      && go get -v honnef.co/go/tools/cmd/staticcheck

COPY ./runtest.sh /home/dep/runtest.sh

WORKDIR /go/src/github.com/golang/dep

CMD ["bash"]
