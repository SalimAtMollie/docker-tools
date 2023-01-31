#!/usr/bin/env bash
#set -e

echo "Waiting for everything to load..."
sleep 7
echo "Test [1]: Mailhog."
result=$(swaks -4 --to jerry@example.com --server mailhog:1025 --body "Hello Jerry, How are you?" --header "Subject: Greeting")

if [[ "$result" == *"250 Ok"* ]]; then 
    echo "Mail sent! Mailhog is configured properly."
else
    echo "Mail failed to send, check configuration."
fi