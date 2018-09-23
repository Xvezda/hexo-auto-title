#!/bin/sh
# Copyright (c) 2018 Xvezda <https://xvezda.com>

EDITOR=""
API_ID=""
API_SEC=""

USAGE="usage: $0 <TITLE>"

if [ "$#" -lt 1 ]; then
    echo "${USAGE}"
    exit 0
fi

# Check configuration
if [ -z "$EDITOR" ] || [ -z "$API_ID" ] || [ -z "$API_SEC" ]; then
    echo "Setting not configured."
    exit 1
fi

# Check dependencies
curl --version >/dev/null 2>&1 || { echo "curl not found."; exit 1; }
python3 -V >/dev/null 2>&1 || { echo "python3 not found.";  exit 1; }
awk --version >/dev/null 2>&1 || { echo "awk not found.";   exit 1; }


echo "Loading API..."

# Get translated title from naver api
TITLE=`curl --silent "https://openapi.naver.com/v1/papago/n2mt" \
-H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
-H "X-Naver-Client-Id: ${API_ID}" \
-H "X-Naver-Client-Secret: ${API_SEC}" \
-d "source=ko&target=en&text=$1" \
| python3 -c \
"import json; \
import sys; \
result = json.loads(input())['message']['result']['translatedText']; \
sys.stdout.write(result)" | awk '{ print tolower($0) }'`

echo "Creating post..."

# Create new post
FILE_NAME=`hexo new "${TITLE}" | awk '{ print $3 }'`

echo "Waiting for ${EDITOR}..."

# Execute editor with created post
eval "$EDITOR ${FILE_NAME}"
echo "DONE."


# vim:ft=sh
