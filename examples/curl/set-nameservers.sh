#!/usr/bin/env bash
# PUT /domains/{domain}/nameservers — set custom nameservers (2-5)
# Required env vars: API_BASE, API_KEY
# Usage: bash set-nameservers.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X PUT "$API_BASE?path=/domains/$DOMAIN/nameservers" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "nameservers": ["ns1.cloudflare.com", "ns2.cloudflare.com"]
  }'
