Build qtv:

```
docker build --tag=qtv .
```


Run qtv:

```sh
docker run \
--interactive \
--tty \
--init \
--publish 27599:27599 \
--publish 27599:27599/udp \
qtv \
+hostname "FortressOne QTV" \
+qtv <hostname>:<port>
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
