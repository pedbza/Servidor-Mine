#!/bin/bash
pkill ngrok 2>/dev/null
sleep 2
nohup ngrok tcp 25565 --log stdout > /tmp/ngrok.log 2>&1 &
sleep 6
echo "=== Endereço do servidor ==="
grep -o "tcp://[^\" ]*" /tmp/ngrok.log | tail -1 | sed 's|tcp://||'
echo "=== Agora inicie o Crafty e o servidor no painel ==="
