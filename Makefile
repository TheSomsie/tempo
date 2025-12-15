# Simple Makefile wrapper around common `just` tasks.
# This is optional convenience for contributors who are used to `make`.

.PHONY: all build test localnet fmt

all: build

build:
	just build-all

test:
	cargo nextest run

localnet:
	just localnet

fmt:
	cargo fmt
