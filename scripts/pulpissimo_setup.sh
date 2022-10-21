#!/bin/bash
mkdir -p /home/sjaeger/pulpissimo
sshfs sjaeger@eda03.ict.tuwien.ac.at:/home/sjaeger/pulpissimo /home/sjaeger/pulpissimo -o cache=no,reconnect

source ~/.bashrc

