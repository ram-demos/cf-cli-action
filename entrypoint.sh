#!/bin/sh -l

cf api --skip-ssl-validation "$INPUT_CF_API"
cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD"

if [ -n "$INPUT_CF_ORG" ] && [ -n "$INPUT_CF_SPACE" ]; then
  cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
fi
git clone https://github.com/ramiyengar/test-app.git
cd test-app
sh -c "cf7 $*"
