## Blue Team · Detection Engineering · Threat Hunting

🔍 **Current Focus:** Live adversary detection — real brute-force data from exposed EC2 honeypot
☁️ **Lab:** AWS EC2 honeypot → Wazuh SIEM (in build)
🛡️ **Specialties:** DNS security, threat hunting, incident response

### Stack
- **SIEM:** Wazuh (self-hosted, replacing Splunk Cloud)
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
