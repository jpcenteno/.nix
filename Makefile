darwin:
	darwin-rebuild switch -I darwin-config=$(HOME)/.config/nixpkgs/darwin.nix
	killall Dock
	killall SystemUIServer
