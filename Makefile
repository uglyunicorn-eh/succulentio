ENV ?= venv
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
VIRTUAL_ENV := ${ROOT_DIR}/${ENV}
PYTHON := ${VIRTUAL_ENV}/bin/python
PYTHON_VERSION := 3.12

.PHONY: install bootstrap test build pip

install:
	$(PYTHON) -m pip install -e "."
	$(PYTHON) -m pip install -e ".[cli]"

bootstrap: $(ENV) pip
	$(PYTHON) -m pip install ".[dev]"
	$(PYTHON) -m pip install ".[test]"
	$(PYTHON) -m pip install build

# develop:
# 	source $(ENV)/bin/activate && $(PYTHON) -m nova.utils.debug runserver -p 9023 nova/api/http

test:
	$(PYTHON) -m pytest

build:
	$(PYTHON) -m build

$(ENV):
	virtualenv --python python$(PYTHON_VERSION) $@

pip:
	$(PYTHON) -m pip install --upgrade pip
# @ $(PYTHON) -m pip config set global.extra-index-url "https://aws:$(CODEARTIFACT_SECRET)@plushcare-924474617161.d.codeartifact.us-west-2.amazonaws.com/pypi/private/simple/"
