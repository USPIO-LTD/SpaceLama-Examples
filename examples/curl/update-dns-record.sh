#!/usr/bin/env bash
# PUT /domains/{domain}/dns — update a DNS record (by id, or by name+type)
# Required env vars: API_BASE, API_KEY
# Usage: bash update-dns-record.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X PUT "$API_BASE?path=/domains/$DOMAIN/dns" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "rec_3",
    "name": "www",
    "type": "A",
    "value": "203.0.113.20",
    "ttl": 3600
  }'
