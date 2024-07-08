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

test:
	$(PYTHON) -m pytest

build:
	$(PYTHON) -m build

$(ENV):
	virtualenv --python python$(PYTHON_VERSION) $@

pip:
	$(PYTHON) -m pip install --upgrade pip
