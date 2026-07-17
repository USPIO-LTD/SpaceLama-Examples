#!/usr/bin/env bash
# POST /domains/register — register domains (async, up to 32 per request)
# Required env vars: API_BASE, API_KEY
# Requires: Idempotency-Key header (auto-generated below)

curl -X POST "$API_BASE?path=/domains/register" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: $(uuidgen)" \
  -d '{
    "domains": [
      {
        "domain": "example.com",
        "period": 1,
        "allow_premium": false,
        "auto_renew": true,
        "contacts": {
          "registrant": { "contact_id": "ct_8a92f3c1" },
          "admin": { "use_registrant": true },
          "tech": { "use_registrant": true },
          "billing": { "use_registrant": true }
        }
      }
    ]
  }'
