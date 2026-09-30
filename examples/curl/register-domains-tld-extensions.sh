#!/usr/bin/env bash
# POST /domains/register — register a domain whose TLD requires additional fields
# Required env vars: API_BASE, API_KEY
# Requires: Idempotency-Key header (auto-generated below)
# Fetch the required fields via get-extension-requirements.sh, then pass them
# in "tld_extensions" keyed by TLD: { "co.ke": { "terms_conditions": "1" } } (not a flat object).

curl -X POST "$API_BASE?path=/domains/register" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: $(uuidgen)" \
  -d '{
    "domains": [
      {
        "domain": "example.co.ke",
        "period": 2,
        "allow_premium": false,
        "contacts": { "registrant": { "contact_id": "ct_8a92f3c1" } },
        "tld_extensions": { "co.ke": { "terms_conditions": "1" } }
      }
    ]
  }'
