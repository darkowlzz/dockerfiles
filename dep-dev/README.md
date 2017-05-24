dep-dev
=======

Container development environment for [dep](https://github.com/golang/dep) to
build and run all the tests.

```
docker run -ti --rm \
      -v $PWD:/go/src/github.com/golang/dep \
      dev-dep
```

Run tests by passing "su dep -c "sh ~/runtest.sh" to the above command. It
runs the test commands as user dep.
