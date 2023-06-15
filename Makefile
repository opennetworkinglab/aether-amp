#### Variables ####

export ROOT_DIR ?= $(PWD)
export AMP_ROOT_DIR ?= $(ROOT_DIR)
export K8S_ROOT_DIR ?= $(AMP_ROOT_DIR)/deps/k8s

export ANSIBLE_NAME ?= ansible-amp
export ANSIBLE_CONFIG ?= $(K8S_ROOT_DIR)/ansible.cfg
export HOSTS_INI_FILE ?= $(AMP_ROOT_DIR)/hosts.ini

export EXTRA_VARS ?= "@$(AMP_ROOT_DIR)/vars/main.yml"

#### Provisioning k8s ####

include $(K8S_ROOT_DIR)/Makefile

#### a. Debugging ####

amp-debug:
	ansible-playbook -i $(HOSTS_INI_FILE) $(AMP_ROOT_DIR)/debug.yml \
		--extra-vars "ROOT_DIR=$(ROOT_DIR)" --extra-vars $(EXTRA_VARS)

amp-pingall:
	ansible-playbook -i $(HOSTS_INI_FILE) $(AMP_ROOT_DIR)/pingall.yml \
		--extra-vars "ROOT_DIR=$(ROOT_DIR)" --extra-vars $(EXTRA_VARS)

#### b. Provision k8s with AMP ####
amp-install: k8s-install roc-install monitor-install
amp-uninstall: roc-uninstall monitor-uninstall k8s-uninstall

#### c. Provision ROC ####
roc-install: 
	ansible-playbook -i $(HOSTS_INI_FILE) $(AMP_ROOT_DIR)/roc.yml --tags install \
		--extra-vars "ROOT_DIR=$(ROOT_DIR)" --extra-vars $(EXTRA_VARS)
roc-uninstall:
	ansible-playbook -i $(HOSTS_INI_FILE) $(AMP_ROOT_DIR)/roc.yml --tags uninstall \
		--extra-vars "ROOT_DIR=$(ROOT_DIR)" --extra-vars $(EXTRA_VARS)

#### d. Provision Monitoring ####
monitor-install: 
	ansible-playbook -i $(HOSTS_INI_FILE) $(AMP_ROOT_DIR)/monitor.yml --tags install \
		--extra-vars "ROOT_DIR=$(ROOT_DIR)" --extra-vars $(EXTRA_VARS)
monitor-uninstall:
	ansible-playbook -i $(HOSTS_INI_FILE) $(AMP_ROOT_DIR)/monitor.yml --tags uninstall \
		--extra-vars "ROOT_DIR=$(ROOT_DIR)" --extra-vars $(EXTRA_VARS)
