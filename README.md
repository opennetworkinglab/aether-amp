# AMP

## Aether Management Platform

The amp repository builds Aether Management Platform that has Aether-ROC and Monitoring system. It utilizes the k8 repository as a submodule to create a multi-node cluster.

To download the AMP repository, use the following command:
```
git clone --recursive https://gitlab.com/onf-internship/amp.git
```
### Step-by-Step Installation
To install the amp, follow these steps:
1. Install k8 cluster
   - As AMF uses K8 submodule, install k8 cluster using `make k8s-install`
2. Install ROC
   - Specify helm charts for `atomix, onosproject, aether_roc`
   - Run `roc-install`.
   - Run `make 5g-roc-install` for 5G or `make 4g-roc-install` for 5G 
3. Install Monitering
   - Specify helm charts for `monitor, monitor-crd`
   - Run `monitor-install`.

#### One-Step Installation
To install AMF in one go, run `amp-install`.
#### Uninstall
   - run `make amp-uninstall`
