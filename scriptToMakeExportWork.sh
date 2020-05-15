#!/usr/bin/env bash

# Semiautomatic workaround for the issue described in
# https://github.com/grpc/grpc/issues/20500

trap "exit" INT

while true; do
    sleep 0.1
    _boring_ssl=$(find ~/Library/Developer/Xcode/DerivedData/FirebaseIssueCatalyst* \
        -name "BoringSSL-GRPC" | head -n1)

    cd "$_boring_ssl/openssl_grpc.framework" && ln -s Versions/Current/Headers Headers &&
        echo "Patched openssl_grpc"

    _grpc_core=$(find ~/Library/Developer/Xcode/DerivedData/FirebaseIssueCatalyst* \
        -name "gRPC-Core" | head -n1)

    cd "$_grpc_core/grpc.framework" && ln -s Versions/Current/Headers Headers &&
        echo "Patched grpc"
done
