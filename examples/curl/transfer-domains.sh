#!/usr/bin/env bash
# POST /domains/transfer — transfer domains to your account (async, returns operation_id)
# Required env vars: API_BASE, API_KEY
# Requires: Idempotency-Key header (auto-generated below)
# Note: the auth-code field here is "auth" (not "auth_code" as in /transfercheck)

curl -X POST "$API_BASE?path=/domains/transfer" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: $(uuidgen)" \
  -d '{
    "domains": [
      {
        "domain": "example.com",
        "auth": "abc-123-epp-code",
        "allow_premium": false,
        "auto_renew": false,
        "contacts": {
          "registrant": { "contact_id": "ct_8a92f3c1" },
          "admin": { "use_registrant": true },
          "tech": { "use_registrant": true },
          "billing": { "use_registrant": true }
        }
      }
    ]
  }'
