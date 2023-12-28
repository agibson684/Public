#!/bin/bash
curl -H "Content-Type: application/json" -d '[{"status": "firing", "labels":{"alertname":"TestAlert1"}}]' solan.thrace.lan:9093/api/v2/alerts

