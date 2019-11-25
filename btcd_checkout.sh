#!/bin/bash

BTCD_COMMIT=$(cat go.mod | \
        grep github.com/monasuite/monad | \
        tail -n1 | \
        awk -F " " '{ print $2 }' | \
        awk -F "/" '{ print $1 }')
echo "Fetching btcd at $BTCD_COMMIT"

pushd /tmp
GO111MODULE=on go get -v github.com/monasuite/monad@$BTCD_COMMIT
popd
