#!/usr/bin/env bash
# POST /domains/renew — renew domains (async, up to 100 per request)
# Required env vars: API_BASE, API_KEY
# Requires: Idempotency-Key header (auto-generated below)

curl -X POST "$API_BASE?path=/domains/renew" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: $(uuidgen)" \
  -d '{
    "domains": [
      { "domain": "example.com", "period": 1 }
    ]
  }'
