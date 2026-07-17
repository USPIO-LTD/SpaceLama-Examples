#!/usr/bin/env bash
# DELETE /domains/{domain}/nameservers — reset nameservers to default
# Required env vars: API_BASE, API_KEY
# Usage: bash reset-nameservers.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X DELETE "$API_BASE?path=/domains/$DOMAIN/nameservers" \
  -H "Authorization: Bearer $API_KEY"
