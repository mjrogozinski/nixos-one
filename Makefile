.PHONY: build
build:
	nix-build '<nixpkgs/nixos>' -A vm -I nixpkgs=channel:nixos-23.11 -I nixos-config=./configuration.nix -v

.PHONY: just-run
just-run:
	QEMU_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -display gtk ; reset

.PHONY: krun
krun:
	kitty --detach make run

.PHONY: run
run: build just-run

