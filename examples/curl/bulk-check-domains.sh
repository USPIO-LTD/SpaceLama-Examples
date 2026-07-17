#!/usr/bin/env bash
# POST /domains/bulk_check — check availability & pricing for up to 32 domains
# Required env vars: API_BASE, API_KEY

curl -X POST "$API_BASE?path=/domains/bulk_check" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "domains": ["example.com", "newsite.com"]
  }'
