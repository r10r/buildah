#!/bin/sh -eu

go build -o /usr/local/bin \
	-ldflags '-w -s -extldflags=-static' \
	-tags osusergo,netgo,exclude_graphdriver_devicemapper,exclude_graphdriver_btrfs,containers_image_openpgp \
	./cmd/buildah
