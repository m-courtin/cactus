#!/usr/bin/env bash
# Copyright 2020-2022 Hyperledger Cactus Contributors
# SPDX-License-Identifier: Apache-2.0

cd ../..

## Build validator for Fabric
cd ./packages/cactus-plugin-ledger-connector-fabric-socketio
./script-build-validator.sh
cd ../..

## build validator for Ethereum
cd ./packages/cactus-plugin-ledger-connector-go-ethereum-socketio
./script-build-validator.sh
cd ../..

# Build Indy testnet
cd ./tools/docker/indy-testnet
./run-before-build.sh
docker-compose build
cd ../../..

## build discounted-cartrade apps
cd ./examples/discounted-cartrade
./script-build-discounted-cartrade.sh

## build getter apps
./script-build-get-app.sh
