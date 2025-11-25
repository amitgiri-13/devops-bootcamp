#!/bin/bash

# Exit if any command fails
set -e

# Usage: ./package.sh [app_name] [version] [source_directory]
# Defaults: app_name=myapp, version=v1.0, source_directory=./client

APP_NAME=${1:-myapp}
VERSION=${2:-v1.0}
SOURCE_DIR=${3:-./client}
PACKAGE_NAME="${APP_NAME}-${VERSION}.tar.gz"
CHECKSUM_FILE="CHECKSUM.sha256"

# Required files
REQUIRED_FILES=("package.json" "src" "README.md" "public" "Dockerfile")

# Files to exclude
EXCLUDE_FILES=(".git" "node_modules")

# Validate required files or directory
for item in ${REQUIRED_FILES[*]}
do
	if [[ ! -e ${SOURCE_DIR}/${item} ]]; then
		echo "Error: required file/directory '$item' missing!"
		exit 
	fi
done

# Creating exclude flag for tar command
for item in ${EXCLUDE_FILES[*]}
do
	exclude+="--exclude=${item} "
done

# Creating package with tar
tar -czf ${PACKAGE_NAME} ${exclude} ${SOURCE_DIR}

if [[ $? -ne 0 ]]
then
	echo "Error: failed to create package!"
fi

# Generate checksum
sha256sum "${PACKAGE_NAME}" >> "${CHECKSUM_FILE}"

if [[ $? -ne 0 ]]
then
	echo "Error: failed to create checksum!"
fi

# Print package path on success
PACKAGE_PATH=$(/bin/realpath "${PACKAGE_NAME}")
echo "Package created at: ${PACKAGE_PATH}"

