#!/bin/bash

# Function to get CPU usage
cpu_usage() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | \
    awk '{print "  Usage: " $2 + $4 "%"}'
    echo ""
}

# Function to get memory usage
memory_usage() {
    echo "Memory Usage:"
    free -m | awk 'NR==2{printf "  Used: %sMB / %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
    echo ""
}

# Function to get disk usage
disk_usage() {
    echo "Disk Usage:"
    df -h --total | awk '$NF=="total" {printf "  Used: %s / %s (%s)\n", $3,$2,$5}'
    echo ""
}

# Function to get top 5 processes by CPU usage
top_cpu_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo ""
}

# Function to get top 5 processes by memory usage
top_memory_processes() {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo ""
}

# Run functions
cpu_usage
memory_usage
disk_usage
top_cpu_processes
top_memory_processes