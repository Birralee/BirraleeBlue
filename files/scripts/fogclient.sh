#!/bin/bash

# Grab the latest fogclient and install it
curl -Lo /tmp/SmartInstaller.exe $(curl https://api.github.com/repos/FOGProject/fog-client/releases/latest | jq -r '.assets[] | select(.name| test("SmartInstaller.exe$")).browser_download_url')
mono /tmp/SmartInstaller.exe --server="fog.birralee.local"
