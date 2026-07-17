#!/usr/bin/env bash
# POST /contacts — create a contact
# Required env vars: API_BASE, API_KEY
# Requires: Idempotency-Key header (auto-generated below)

curl -X POST "$API_BASE?path=/contacts" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: $(uuidgen)" \
  -d '{
    "first_name": "Ada",
    "last_name": "Lovelace",
    "type_company": "individual",
    "email": "ada@example.com",
    "phone": "+1.4155551234",
    "address_line1": "123 Market St",
    "city": "San Francisco",
    "state": "CA",
    "postal_code": "94103",
    "country": "US"
  }'
