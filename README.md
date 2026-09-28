# API Examples

Usage examples for the Public API — ready-to-run requests to get started quickly.

## Structure

```
examples/
├── curl/                                    # curl requests, one file per endpoint
├── postman_collection.json                  # Collection to import into Postman
└── happy-paths/                             # Typical successful end-to-end scenarios
    ├── registration_happy-path.md           # Check availability → create contact → register → check status → check domain
    ├── renew_happy-path.md                  # Check expiration → renew → check status → check new expiration
    ├── transfer_happy-path.md               # Check transferability → contact → TLD fields → transfer → check status
    └── management_happy-path.md             # Nameservers & DNS records
```

## Authorization

All examples use environment variables so the API key never ends up in a file:

```bash
export API_BASE="https://spacelama.com/modules/addons/public_api/api/index.php"
export API_KEY="your_api_key"
```

The API has no URL rewriting configured, so every endpoint is addressed via the `path` query parameter rather than a URL path segment:

```bash
curl "$API_BASE?path=/domains" -H "Authorization: Bearer $API_KEY"
```

`POST /contacts`, `POST /domains/register`, `POST /domains/renew` and `POST /domains/transfer` additionally require an `Idempotency-Key` header (any UUID, 1–255 chars, TTL 24h):

```bash
curl -X POST "$API_BASE?path=/domains/register" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: $(uuidgen)" \
  -d '{ ... }'
```

To get an API key, register on the website and submit a request for an API key — it is issued after the request is processed.

## How to run the curl examples

```bash
bash examples/curl/get-domains.sh
```

Some scripts accept an argument, e.g. a domain name:

```bash
bash examples/curl/get-domain-by-name.sh example.com
bash examples/curl/get-extension-requirements.sh us   # TLD without leading dot
```

Some TLDs (e.g. `.us`, `.ca`, `.co.ke`) require additional fields for registration and transfer.
Fetch them with `get-extension-requirements.sh` and pass them as `tld_extensions`, keyed by TLD —
see `register-domains-tld-extensions.sh`.

Note: the auth-code field is `auth_code` in `POST /transfercheck` but `auth` in `POST /domains/transfer`.

## How to import the Postman collection

Postman → Import → select `examples/postman_collection.json`.
The collection defines `public_api_base` and `api_token` variables (plus a few endpoint-specific ones like `domain`, `tld`, `contact_id`, `operation_id`) — fill them in under the Variables tab.
