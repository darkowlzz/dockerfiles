#/bin/sh

cd /go/src/github.com/golang/dep

PKGS=$(go list ./...)

go build -v ./cmd/dep

./hack/lint.bash

./hack/validate-vendor.bash

go build ./hack/licenseok

set -e; for pkg in $PKGS; do go test -race -v $pkg; done

./hack/validate-vendor.bash
