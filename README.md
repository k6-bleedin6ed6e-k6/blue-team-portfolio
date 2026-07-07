## Blue Team · Detection Engineering · Threat Hunting

**Live:** [blue-team.kontor.studio](https://blue-team.kontor.studio)

🔍 **Current Focus:** Live adversary detection — real brute-force data from exposed EC2 honeypot
☁️ **Lab:** AWS EC2 honeypot → Wazuh SIEM — built, torn down 2026-07-06 after a cost-drift incident (wrong instance size, caught and killed), then rebuilt properly 2026-07-07 with correct sizing and an actual monitored budget alert this time. Live and running. Source at [wazuh-soc-lab](https://github.com/kwasikontor45/wazuh-soc-lab).
🛡️ **Specialties:** DNS security, threat hunting, incident response

### Stack
- **SIEM:** Wazuh (self-hosted, EC2) — manager+indexer+dashboard, agent enrolled on the honeypot box. Splunk Cloud trial also available for SPL practice, not the primary SIEM.
- **Honeypot:** AWS EC2 t3.micro — live, collecting real adversary data
- **DNS Telemetry:** NextDNS
- **Threat Intel:** MITRE ATT&CK

### Artifacts
- **[Detection Rules](./detections):** SPL and Sigma rules mapped to MITRE ATT&CK
- **[Threat Hunts](./hunts):** HUNT-002 — real brute force, AS8075 (Microsoft Azure IP range)
- **[IR Playbooks](./playbooks):** Incident response procedures with SLA timelines
- **[Scripts](./scripts):** Lab automation and VM baseline setup

### Certifications In Progress
- Splunk Core Certified User
- Microsoft SC-900
- CompTIA Security+
