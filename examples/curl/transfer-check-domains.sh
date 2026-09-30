#!/usr/bin/env bash
# POST /transfercheck — check transferability & transfer price for up to 32 domains
# Required env vars: API_BASE, API_KEY
# auth_code is optional but gives the most accurate result. Prices are returned in EUR.

curl -X POST "$API_BASE?path=/transfercheck" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "domains": [
      { "domain": "example.com", "auth_code": "AUTH-CODE-123" },
      { "domain": "another.net" }
    ]
  }'
