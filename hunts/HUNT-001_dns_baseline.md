# Threat Hunt Report

## Metadata
- **Hunt ID:** HUNT-001
- **Date:** 2026-04-02
- **Analyst:** kwasikontor45
- **Data Source:** NextDNS logs
- **Time Range:** Last 7 days
- **MITRE Technique:** T1071.004

## Hypothesis
High-entropy or unusually long domain names in home network DNS logs
may indicate malware C2 communication or DNS tunneling activity.

## Query
```spl
index=nextdns earliest=-7d
| eval domain_length=len(domain)
| stats count by domain, domain_length
| where domain_length > 40
| sort - domain_length
| head 20
```

## Findings
| IOC | Type | Severity | Disposition |
|-----|------|----------|-------------|
| TBD after running query | Domain | TBD | TBD |

## Conclusion
- True Positives: TBD
- False Positives: TBD
- Actions Taken: TBD
- Detection Tuning: TBD

## Lessons Learned
> Update after running the hunt in Splunk
