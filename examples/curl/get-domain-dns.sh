#!/usr/bin/env bash
# GET /domains/{domain}/dns — list DNS records for a domain
# Required env vars: API_BASE, API_KEY
# Usage: bash get-domain-dns.sh example.com

DOMAIN="${1:?Usage: $0 <domain>}"

curl -X GET "$API_BASE?path=/domains/$DOMAIN/dns" \
  -H "Authorization: Bearer $API_KEY"
