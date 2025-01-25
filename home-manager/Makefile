# Careful about copy/pasting, Makefiles want tabs!
.PHONY: update
update:
	home-manager switch --flake .#monty

.PHONY: clean
clean:
	nix-collect-garbage -d
