#!/usr/bin/env bash
# GET /domains/extension-requirements/{tld} — additional fields a TLD requires for register/transfer
# Required env vars: API_BASE, API_KEY
# Usage: bash get-extension-requirements.sh us   (TLD without leading dot, e.g. us, ca, co.uk)
# An empty "data" array means the TLD needs no additional fields.

TLD="${1:?Usage: $0 <tld>}"

curl -X GET "$API_BASE?path=/domains/extension-requirements/$TLD" \
  -H "Authorization: Bearer $API_KEY"
