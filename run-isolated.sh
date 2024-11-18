#!/bin/bash
podman build  . -t aex-debug

if [ $? -eq 0 ]; then
  podman container exists aex-debug && podman container rm -f aex-debug
  podman run -i -t --name aex-debug aex-debug
fi