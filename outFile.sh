#!/bin/bash

rsync -avhz --exclude=node_modules /root/dev/ /mnt/shared/ --delete
