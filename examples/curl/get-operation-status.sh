#!/usr/bin/env bash
# GET /operations/{operation_id} — check async operation status (can be called anytime, no fixed interval required)
# Required env vars: API_BASE, API_KEY
# Usage: bash get-operation-status.sh op_01HQXZ7K3M9P5W2N

OPERATION_ID="${1:?Usage: $0 <operation_id>}"

curl -X GET "$API_BASE?path=/operations/$OPERATION_ID" \
  -H "Authorization: Bearer $API_KEY"
