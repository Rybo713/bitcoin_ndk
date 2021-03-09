Build status: [![Build Status](https://travis-ci.com/Rybo713/bitcoin_ndk.svg?branch=master)](https://travis-ci.com/github/Rybo713/bitcoin_ndk)

This repo is a dependency of Rybo713/abcore however it is usable stand alone.

You can build using docker or using debian stretch.

There is a docker image prebuilt (see .travis.yml file) but you can build the same
image by issuing docker build . in the root of this repo.

The docker image assumes the repo is mounted as a volume to /repo.

Many thanks to the Core and Knots team and greenaddress.
