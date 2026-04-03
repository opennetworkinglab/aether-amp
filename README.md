# AMP

## Aether Management Platform

The amp repository builds the Aether Management Platform with Aether-ROC and Monitoring. It relies on a k8s cluster that can be created from the k8s repository.

To download the AMP repository, use the following command:
```
git clone https://github.com/omec-project/aether-amp.git
```
### Step-by-Step Installation
To install AMP, follow these steps:
1. Install a k8s cluster
   - Install a cluster first (for example with `make k8s-install` in `deps/k8s`).
2. Install ROC
   - Specify Helm chart settings for `atomix`, `onosproject`, and `aether_roc`.
   - Run `make roc-install`.
3. Install Monitoring
   - Specify Helm chart settings for `monitor` and `monitor_crd`.
   - Run `make monitor-install`.

#### One-Step Installation
To install AMP in one go, run `make amp-install`.
#### Uninstall
   - Run `make amp-uninstall`.
