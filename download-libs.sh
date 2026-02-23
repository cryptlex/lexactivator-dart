#!/bin/bash

# Exit on error
set -e

BASE_URL=https://dl.cryptlex.com/downloads
VERSION="v3.37.0";

# Create temporary directory
mkdir -p tmp

# Windows libraries
mkdir -p tmp/windows
WINDOWS_FILE_NAME="LexActivator-Win.zip"
curl -O ${BASE_URL}/${VERSION}/${WINDOWS_FILE_NAME}
unzip ${WINDOWS_FILE_NAME} -d ./tmp/windows

# Copy Windows libraries to existing directories
cp ./tmp/windows/libs/vc14/x64/LexActivator.dll ./windows/win-x86-64/
cp ./tmp/windows/libs/vc17/arm64/LexActivator.dll ./windows/win-arm64/
cp ./tmp/windows/THIRD-PARTY-NOTICES.txt ./windows/

# macOS libraries
mkdir -p tmp/macos
MAC_FILE_NAME="LexActivator-Mac.zip"
curl -O ${BASE_URL}/${VERSION}/${MAC_FILE_NAME}
unzip ${MAC_FILE_NAME} -d ./tmp/macos

# Copy macOS universal binary to existing directory
cp ./tmp/macos/libs/clang/universal/libLexActivator.dylib ./macos/darwin-universal/
cp ./tmp/macos/THIRD-PARTY-NOTICES.txt ./macos/

# Linux libraries
mkdir -p tmp/linux
LINUX_FILE_NAME="LexActivator-Linux.zip"
curl -O ${BASE_URL}/${VERSION}/${LINUX_FILE_NAME}
unzip ${LINUX_FILE_NAME} -d ./tmp/linux

# Copy Linux libraries to existing directories
cp ./tmp/linux/libs/gcc-6/amd64/libLexActivator.so ./linux/linux-x86-64/
cp ./tmp/linux/libs/gcc-6/arm64/libLexActivator.so ./linux/linux-aarch64/
cp ./tmp/linux/THIRD-PARTY-NOTICES.txt ./linux/

# Cleanup
rm -f ${WINDOWS_FILE_NAME}
rm -f ${MAC_FILE_NAME}
rm -f ${LINUX_FILE_NAME}
rm -R -f ./tmp

echo "Libraries downloaded and organized successfully!"