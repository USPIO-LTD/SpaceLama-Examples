#!/usr/bin/env bash
# GET /domains/{domain}/nameservers — get current nameservers
# Required env vars: API_BASE, API_KEY
# Usage: bash get-nameservers.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X GET "$API_BASE?path=/domains/$DOMAIN/nameservers" \
  -H "Authorization: Bearer $API_KEY"
