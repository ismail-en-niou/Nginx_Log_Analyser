#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

LOG_FILE="${1:-ngnix-log.log}"

if [ ! -f "$LOG_FILE" ] ; then
    echo -e "${RED}Error:${NC} Log file ${YELLOW}$LOG_FILE${NC} not found!"
    echo -e "Please specify a valid Nginx access log file"
    exit 1
fi

echo -e "${GREEN}Analyzing:${NC} ${CYAN}$LOG_FILE${NC}"
echo -e "${PURPLE}Top 5 IP addresses with the most requests:${NC}"
echo
echo -e "${BLUE}==============================${NC}"

awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | while read count ip; do
    echo -e "${YELLOW}$ip${NC} - ${GREEN}$count${NC} requests"
done

echo -e "${BLUE}==============================${NC}"
echo 
echo 
echo 

echo -e "${PURPLE}Top 5 most requested paths: ${NC}"
echo
echo -e "${BLUE}==============================${NC}"

awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | while read count req ; do
    if [ -z "$req" ] || [ "$req" = "-" ]; then
        req="/ (root)"
    fi
    echo -e "${CYAN}$req${NC} - ${GREEN}$count${NC} requests"
done

echo -e "${PURPLE}Top 5 response status codes: ${NC}"
echo
echo -e "${BLUE}==============================${NC}"

awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | while read count req ; do
    if [ -z "$req" ] || [ "$req" = "-" ]; then
        req="/ (root)"
    fi
    echo -e "${CYAN}$req${NC} - ${GREEN}$count${NC} requests"
done

echo -e "${BLUE}==============================${NC}"