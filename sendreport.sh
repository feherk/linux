#!/bin/bash
df -h -x tmpfs | mail -s "disk space report" email@email.hu
