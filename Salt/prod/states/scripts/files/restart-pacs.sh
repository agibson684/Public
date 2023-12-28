#!/bin/bash
systemctl restart prometheus-alertmanager prometheus consul
echo "restarted services"
