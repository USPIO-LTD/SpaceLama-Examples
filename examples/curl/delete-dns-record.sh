#!/usr/bin/env bash
# DELETE /domains/{domain}/dns — delete a DNS record (by id, or by name+type)
# Required env vars: API_BASE, API_KEY
# Usage: bash delete-dns-record.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X DELETE "$API_BASE?path=/domains/$DOMAIN/dns" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "rec_3"
  }'
