#!/bin/bash

# Quick fix to resolve DNS issues with using minikube alongside the Cisco Anyconnect VPN client. 
# This simply updates the resolv.conf file in the minikube VM by removing the symlink to "../run/systemd/resolve/resolv.conf"
# and then replacing it with a google dns server. 
#
# To restore ssh into minikube, replace resolv.conf with a symlink to ../run/systemd/resolve/resolv.conf

ssh -i ~/.minikube/machines/minikube/id_rsa docker@$(minikube ip) 'sudo rm /etc/resolv.conf && echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf'