.PHONY: rebuild
rebuild:
	rm nixos.qcow2
	nix-build '<nixpkgs/nixos>' -A vm -I nixpkgs=channel:nixos-23.11 -I nixos-config=./configuration.nix

.PHONY: run
run:
	QEMU_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -nographic; reset

.PHONY: refresh
refresh: rebuild run



