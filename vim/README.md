Create bash function:
```
cvim() {
  docker run -ti --rm -v $PWD:/root/code vim $@
}
```
