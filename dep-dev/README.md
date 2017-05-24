dep-dev
=======

Container development environment for [dep](https://github.com/golang/dep) to
build and run all the tests.

```
docker run -ti --rm -v $PWD:/go/src/github.com/golang/dep dep-dev
```

Run tests by passing `su dep -c "sh ~/runtest.sh"`. It runs the test commands
as user dep. A separate user is required for some tests related to access
permissions.

```
docker run --rm -v $PWD:/go/src/github.com/golang/dep dep-dev su dep -c "sh ~/runtest.sh"
```
