#!/bin/bash
set -e

TASK=$1
REPORT_FILE="health_report.txt"

case "$TASK" in
  "sysinfo")
    echo "=== Task 1: System Info ===" | tee $REPORT_FILE
    echo "Hostname: $(hostname)" | tee -a $REPORT_FILE
    echo "Date: $(date)" | tee -a $REPORT_FILE
    echo "Uptime: $(uptime -p)" | tee -a $REPORT_FILE
    ;;
  "disk")
    echo -e "\n=== Task 2: Disk Usage ===" | tee -a $REPORT_FILE
    df -h / | tee -a $REPORT_FILE
    ;;
  "memory")
    echo -e "\n=== Task 3: Memory Usage ===" | tee -a $REPORT_FILE
    free -m | tee -a $REPORT_FILE
    ;;
  *)
    echo "Invalid task: $TASK"
    exit 1
    ;;
esac
