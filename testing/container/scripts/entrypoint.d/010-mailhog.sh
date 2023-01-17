#!/usr/bin/env bash
#set -e

swaks --to jerry@eduami.org --server mailhog -p 1025 --body "WE DID IT" --header "Subject: LETSGOOOO"
swaks --to jerry@eduami.org --server mailhog -p 25 --body "WE DID IT" --header "Subject: LETSGOOOO"

swaks --to jerry@eduami.org --server mailhog.my.mollie.localhost -p 1025 --body "WE DID IT" --header "Subject: LETSGOOOO"
swaks --to jerry@eduami.org --server mailhog.my.mollie.localhost -p 25 --body "WE DID IT" --header "Subject: LETSGOOOO"

swaks --to jerry@eduami.org --server 172.24.0.19 -p 25 --body "WE DID IT" --header "Subject: LETSGOOOO"
swaks --to jerry@eduami.org --server 172.24.0.19 -p 1025 --body "WE DID IT" --header "Subject: LETSGOOOO"