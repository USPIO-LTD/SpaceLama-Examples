#!/usr/bin/env bash
# GET /contacts — list contacts for the API key owner (pagination)
# Required env vars: API_BASE, API_KEY

curl -X GET "$API_BASE?path=/contacts&page=1&limit=50" \
  -H "Authorization: Bearer $API_KEY"
