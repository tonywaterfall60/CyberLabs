# Challenge — Hunt for Suspicious Script Execution

Dataset:

```text
events.jsonl
```

## Scenario

A SOC analyst suspects a workstation may have executed an unusual encoded PowerShell command and then made an outbound connection.

Everything in this dataset is synthetic.

## Tasks

1. Identify PowerShell process events.
2. Identify any encoded-command usage.
3. Decode the harmless training Base64 string.
4. Correlate the process with nearby network events.
5. Identify the user and host involved.
6. Build a timeline.
7. State one benign alternative explanation.
8. Identify two additional telemetry sources you would request.

## Suggested Tools

```bash
jq
grep
base64
python3
```

## Important

Do not treat the presence of encoded PowerShell as automatic proof of malware.
