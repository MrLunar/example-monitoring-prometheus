#!/usr/bin/env bash
set -euo pipefail

url="https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz"
curl -L "$url" > /tmp/node_exporter.tar.gz

tar -xf /tmp/node_exporter.tar.gz -C /tmp
cp -f /tmp/node_exporter-0.15.2.linux-amd64/node_exporter /usr/bin/node_exporter
rm -Rf  /tmp/node_exporter-0.15.2.linux-amd64
rm /tmp/node_exporter.tar.gz

cat <<EOF >/etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter

[Service]
ExecStart=/usr/bin/node_exporter

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter

echo "Provisioning completed [linhost]"
