#!/usr/bin/env bash

sudo cat <<EOF | sudo tee /media/state/units/docker-daemon.service
[Unit]
Description=Docker Application Container Engine
Documentation=http://docs.docker.io
After=docker.service
Requires=docker.service

[Service]
Restart=always
RetartSec=10s
ExecStartPre=systemctl stop docker
ExecStart=/usr/bin/docker -d -r=false -H tcp://0.0.0.0:4243

[Install]
WantedBy=local.target
EOF
