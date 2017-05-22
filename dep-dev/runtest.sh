#/bin/sh

cd /go/src/github.com/golang/dep

PKGS=$(go list ./... | grep -v /vendor/ | grep -v _testdata/ )

go build -v ./cmd/dep

go vet $PKGS

staticcheck $PKGS

./hack/validate-vendor.bash

gosimple $PKGS

go build ./hack/licenseok

set -e; for pkg in $PKGS; do go test -v $pkg; done

./hack/validate-vendor.bash
