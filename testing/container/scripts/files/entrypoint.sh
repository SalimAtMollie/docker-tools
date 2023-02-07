#!/usr/bin/env bash
set -e

DIR=/entrypoint.d
if [[ -d "$DIR" ]]
then
	/bin/run-parts --regex '\.sh$' "$DIR"
fi

exec "$@"