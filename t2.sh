#!/bin/sh

c=$(buildah from alpine)
buildah run --workingdir /work $c touch foo bar
buildah run --workingdir /work $c chown 1111:2222 foo
buildah run --workingdir /work $c chown 3333:4444 bar
buildah run --workingdir /work $c ls -l /work

c1=$(buildah from alpine)
buildah copy --keep-ownership --from=$c $c1 /work /work-keep
buildah run $c1 ls -l /work-keep
buildah copy --from=$c $c1 /work /work
buildah run $c1 ls -l /work

buildah rm $c
buildah rm $c1
