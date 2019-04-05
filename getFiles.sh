#!/bin/bash
rsync -avz --exclude=node_modules /mnt/shared/ /root/dev
