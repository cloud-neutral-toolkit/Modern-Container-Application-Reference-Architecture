SHELL := /bin/bash

TF=terraform

CONFIG_ROOT ?= ../../../../../gitops
CONFIG_DIR ?= $(CONFIG_ROOT)/config
export TF_VAR_config_root ?= $(CONFIG_ROOT)

render:
	python ../../../utils/render_provider_backend.py \
		--config-dir $(CONFIG_DIR) \
		--template-dir ../../templates \
		--component-dir .. \
		--component rds

init:
	$(TF) init --upgrade

plan:
	$(TF) plan

apply:
	$(TF) apply -auto-approve

output:
	$(TF) output

destroy:
	$(TF) destroy -auto-approve
