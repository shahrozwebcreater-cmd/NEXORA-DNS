# NEXORA DNS — record guide

This guide describes what the current dashboard stores. Saving a record in the dashboard does not publish it to public DNS until an approved DNS provider/backend is connected.

## Record types

| Type | Use | Example value |
|---|---|---|
| A | IPv4 address | `203.0.113.10` |
| AAAA | IPv6 address | `2001:db8::10` |
| CNAME | Alias to another hostname | `origin.example.net` |
| TXT | Verification or text data | `google-site-verification=...` |
| MX | Mail exchanger, priority then hostname | `10 mail.example.net` |
| SRV | Service discovery, priority weight port target | `0 5 25565 play.example.net` |

## Minecraft Java Edition

For a Minecraft Java server on a non-default port, the conventional SRV owner name is:

`_minecraft._tcp`

The SRV value is:

`priority weight port target`

Example: `0 5 25570 play.example.net`

The target must itself resolve to an address record (A or AAAA). The SRV record does not point directly to an IP address. The player can then connect using the hostname without typing the non-default port, provided the authoritative DNS zone publishes the matching SRV record.

For a default Java port (25565), an A/AAAA record for the hostname is usually enough; an SRV record is not required.

Bedrock commonly uses UDP port 19132 and does not use the Java `_minecraft._tcp` SRV convention in the same way. Do not promise Bedrock support until the exact client/provider behavior has been tested.

## Safe examples

Use documentation-only IPs such as `192.0.2.10` while testing. Replace them with an address you control before expecting a real service to work.

## Current product limitation

The dashboard currently stores per-user rows in Supabase. It does not yet:
- create a public DNS zone,
- register a subdomain,
- update authoritative nameservers,
- verify public DNS propagation,
- or prove that a hostname points to a reachable Minecraft server.

These features require a permitted domain namespace and a secured server-side provider integration.
