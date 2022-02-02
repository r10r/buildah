#!/bin/sh

c=$(buildah from alpine)
buildah run $c chown 666:333 /bin/busybox 2>/dev/null 1>&2
buildah run $c ls -l /bin/busybox

c1=$(buildah from alpine)
buildah copy --keep-ownership --from=$c $c1 /bin/busybox .
buildah run $c1 ls -l busybox

buildah rm $c
buildah rm $c1
