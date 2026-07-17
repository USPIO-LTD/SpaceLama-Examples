#!/usr/bin/env bash
# GET /domains — list domains (pagination, search, sort)
# Required env vars: API_BASE, API_KEY

curl -X GET "$API_BASE?path=/domains" \
  -H "Authorization: Bearer $API_KEY"
