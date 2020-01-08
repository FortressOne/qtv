Build qtv:

```
docker build --tag=qtv .
```


Run qtv:

```sh
docker run qtv
```


Stop qtv:

```sh
docker container ls
docker container stop <hash>
```


Deploy qtv:

```sh
docker tag qtv fortressone/qtv:latest
docker push fortressone/qtv:latest
```
