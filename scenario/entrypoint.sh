#!/bin/sh

exec npx @playwright/mcp@0.0.10 --port 9876 "$@"