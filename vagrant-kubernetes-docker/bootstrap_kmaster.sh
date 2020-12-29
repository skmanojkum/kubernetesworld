#!/bin/bash

# Initialize Kubernetes
echo "[TASK 1] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=172.42.42.100 --pod-network-cidr=10.244.0.0/16 >> /root/kubeinit.log 2>/dev/null

# Copy Kube admin config
echo "[TASK 2] copy kube admin config to vagrant user .kube directoryi"
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f kube-flannel.yml



# Generate cluster join command
echo "[TASK 3] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh 2>/dev/null

#HOME FOLDER kmaster: Rsyncing folder: /cygdrive/d/master/kubernetes/vagrant-provisioning-new/ => /vagrant

