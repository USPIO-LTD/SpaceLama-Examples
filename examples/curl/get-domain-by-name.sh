#!/usr/bin/env bash
# GET /domains/{domain} — get domain details by name
# Required env vars: API_BASE, API_KEY
# Usage: bash get-domain-by-name.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X GET "$API_BASE?path=/domains/$DOMAIN" \
  -H "Authorization: Bearer $API_KEY"
