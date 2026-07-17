#!/usr/bin/env bash
# POST /domains/{domain}/dns — create a DNS record
# Required env vars: API_BASE, API_KEY
# Usage: bash create-dns-record.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X POST "$API_BASE?path=/domains/$DOMAIN/dns" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "www",
    "type": "A",
    "value": "203.0.113.10",
    "ttl": 3600
  }'
