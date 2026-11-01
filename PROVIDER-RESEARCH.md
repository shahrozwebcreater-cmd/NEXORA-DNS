# NEXORA DNS — provider and domain roadmap

Last reviewed: 2026-11-01

## Current state

- Website: GitHub Pages.
- Authentication and DNS record storage: Supabase.
- The current dashboard stores record data in the user's Supabase account. It does **not** publish public DNS records or register customer subdomains.
- No customer-facing domain registration or paid checkout should be enabled yet.

## Provider review

### HexName
- A registration attempt for the `nexora.hexname.com` label returned an internal error in the user's browser.
- The service's permission for NEXORA to automate registrations for third-party customers or resell names has not been verified.
- Status: technical test blocked; commercial/reseller permission unconfirmed.
- Next step: request written confirmation from HexName support before any integration.

### ing.ng
- Its published terms allow personal or commercial use of free subdomains.
- The terms explicitly say subdomains may not be resold without explicit written permission.
- Status: possible candidate only after written reseller/managed-customer permission.

### is-a.dev
- Its terms restrict use to individuals, developer groups and non-commercial projects.
- They prohibit commercial/for-profit use and monetisation/transfer of subdomains.
- Status: not suitable for NEXORA's free/paid customer DNS business.

### DNSHE
- Public API documentation exists for subdomain and DNS management.
- Published terms prohibit account transfer, rental or sale; the service documentation also prohibits resale/rental/unauthorized sharing of account resources.
- Status: do not use as a shared reseller backend without explicit written permission.

### isroot.in
- Public information describes free developer subdomains and nameservers.
- Commercial/reseller permission has not been established from the information reviewed.
- Status: investigate terms and obtain written permission before use.

## Required before launch

1. Obtain written permission for customer provisioning/resale or secure a parent domain controlled by NEXORA.
2. Choose a provider/API whose terms explicitly permit the intended customer-facing service.
3. Keep provider API secrets server-side (Supabase Edge Function or secured backend). Never put provider secrets in `config.js`, browser JavaScript, or GitHub.
4. Validate hostnames, record types, IP addresses, ports, quotas and ownership server-side.
5. Publish DNS only after the provider confirms registration/record creation.
6. Add audit logs, abuse reporting, rate limits, account suspension and deletion flows.
7. Keep paid checkout disabled until domain rights, renewals, refunds and support responsibilities are clear.

## Product roadmap

- Phase 1: dashboard and Supabase record storage (current).
- Phase 2: provider permission and test account.
- Phase 3: secure backend integration and test hostname.
- Phase 4: free plan quotas, then premium names only if provider/domain rights permit.
- Phase 5: public launch after DNS resolution, SRV records, renewals and abuse controls are tested.
