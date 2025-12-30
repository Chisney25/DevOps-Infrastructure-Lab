#!/bin/bash
# DevOps Lab: Basic System Health Audit Script

echo "--- STARTING SYSTEM AUDIT ---"
echo "Date: $(date)"

# 1. Check Disk Usage
echo "Checking Disk Space..."
df -h | grep '^/dev/'

# 2. Check Memory Usage
echo "Checking Memory..."
free -m

# 3. Check if a specific service is running (e.g., Docker)
if systemctl is-active --quiet docker; then
    echo "✅ Docker service is running."
else
    echo "❌ Docker service is NOT running."
fi

echo "--- AUDIT COMPLETE ---"
