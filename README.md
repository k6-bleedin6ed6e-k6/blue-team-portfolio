## Blue Team · Detection Engineering · Threat Hunting

**Live:** [blue-team.kontor.studio](https://blue-team.kontor.studio)

🔍 **Current Focus:** Detection engineering + threat hunting against a real historical dataset — genuine adversary brute-force traffic captured during an intentionally-exposed honeypot window (April 2026), analyzed and turned into working detections since.
☁️ **Lab:** Wazuh SIEM (self-hosted, EC2) — built, torn down 2026-07-06 after a cost-drift incident (wrong instance size, caught and killed), rebuilt properly 2026-07-07 with correct sizing and an actual monitored budget alert this time. Live and running. Source at [wazuh-soc-lab](https://github.com/kwasikontor45/wazuh-soc-lab).
🛡️ **Specialties:** DNS security, threat hunting, incident response

### Stack
- **SIEM:** Wazuh (self-hosted, EC2) — manager+indexer+dashboard, agent enrolled on the py-bite box. Splunk Cloud trial also available for SPL practice, not the primary SIEM.
- **Honeypot:** the py-bite EC2 box, briefly SSH-exposed in April 2026 — real attacker traffic captured then (see HUNT-002 below), SSH has since been hardened (key-only auth, restricted to admin IP as of 2026-06-30) so it's not actively collecting new brute-force telemetry anymore. The captured dataset and the detections built from it are still real and still the point.
- **DNS Telemetry:** NextDNS
- **Threat Intel:** MITRE ATT&CK

### Artifacts
- **[Detection Rules](./detections):** SPL and Sigma rules mapped to MITRE ATT&CK
- **[Labs](./labs):** LAB-001 — Securing IoT Device Communication with TLS/SSL (MQTT), CND coursework lab reproduced on Docker/Linux instead of the original Windows VMs
- **[Threat Hunts](./hunts):** HUNT-002 — real brute force captured 2026-04-03, AS8075 (Microsoft Azure IP range)
- **[IR Playbooks](./playbooks):** Incident response procedures with SLA timelines
- **[Scripts](./scripts):** Lab automation and VM baseline setup

### Certifications In Progress
- Splunk Core Certified User
- Microsoft SC-900
- CompTIA Security+
