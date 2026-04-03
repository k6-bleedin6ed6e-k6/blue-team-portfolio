# Threat Hunt Report — HUNT-002

## Metadata
- **Hunt ID:** HUNT-002
- **Date:** 2026-04-03
- **Analyst:** kwasikontor45
- **Data Source:** index=linux sourcetype=linux_secure
- **Time Range:** 10:20–10:25 UTC
- **MITRE Technique:** T1110 — Brute Force

## Hypothesis
Public-facing SSH on honeypot would attract automated brute force
within hours of deployment.

## Query
```spl
index=linux sourcetype=linux_secure earliest=-15m
| rex "PAM: Authentication failure for (?<user>\S+) from (?<src_ip>\d+\.\d+\.\d+\.\d+)"
| where isnotnull(src_ip)
| bin _time span=1m
| stats count by _time, src_ip
| sort - count
```

## Findings
| IOC | Type | Severity | Disposition |
|-----|------|----------|-------------|
| 20.97.163.85 | IP — SSH brute force | High | Monitoring — honeypot intel |

## Conclusion
- True Positives: 1 attacker confirmed
- Attempts: 12 per minute, 4 parallel connections
- Actions Taken: Monitoring, not blocked (honeypot intent)
- Detection: DET-004 validated successfully

## Lessons Learned
Honeypot was discovered and attacked within hours of deployment.
Real attacker traffic provides better detection validation than simulated attacks.

## Threat Intel Enrichment
- **AbuseIPDB:** 247 reports, 0% confidence
- **ISP:** Microsoft Corporation (Azure Data Center)
- **ASN:** AS8075
- **Assessment:** Likely compromised Azure VM or automated scanner
  running from within Azure infrastructure
- **Lesson:** Cloud provider IPs are commonly abused — confidence
  scores alone are insufficient for blocking decisions
