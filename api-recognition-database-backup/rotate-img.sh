#!/bin/bash
find /mnt/i/RKB-Dataset/experiments/inferencing_img -name "*.jpg" -type f -mtime +30 -exec rm -f {} \;
find /mnt/i/RKB-Dataset/experiments/inferencing_img -name "*.png" -type f -mtime +30 -exec rm -f {} \;