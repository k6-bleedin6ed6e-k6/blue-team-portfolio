# IRP-001: DNS Tunneling Alert Response

## Alert Details
- **Detection:** DET-001
- **Severity:** High
- **Response Time:** 30 minutes

## Initial Triage (5 minutes)
1. Verify alert in Splunk:
```spl
index=nextdns client_ip=<ALERT_IP>
| stats count by domain
| sort - count
| head 20
```
2. Check if IP is a known device (phone, laptop, tablet)
3. If known good device → close as false positive, tune threshold

## Investigation (15 minutes)
1. Identify device by cross-referencing NextDNS client name
2. Check top domains on VirusTotal manually
3. Look for beaconing pattern:
```spl
index=nextdns client_ip=<ALERT_IP>
| delta _time as gap
| stats avg(gap) by domain
| where avg(gap) > 300 AND avg(gap) < 3600
```

## Containment (5 minutes)
1. Block domain in NextDNS denylist
2. Isolate device via router admin panel
3. Reimage device if compromise confirmed

## Recovery
1. Document IOCs
2. Update detection threshold
3. Add device to watchlist
