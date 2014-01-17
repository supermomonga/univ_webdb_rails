#!/usr/bin/env bash

sudo cat <<EOF | sudo tee /media/state/units/docker-daemon.service
[Unit]
Description=Docker Application Container Engine 
Documentation=http://docs.docker.io
After=docker.service

[Service]
ExecStartPre=systemctl stop docker
# Run docker but don't have docker automatically restart
# containers. This is a job for systemd and unit files.
ExecStart=/usr/bin/docker -d -r=false -H tcp://0.0.0.0:4243

[Install]
WantedBy=multi-user.target
EOF
