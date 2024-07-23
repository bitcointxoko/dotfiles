# This is a system configuration template that uses nix-bitcoin.
#
# You can adapt this to an existing system flake by copying the parts
# relevant to nix-bitcoin.
#
# Make sure to check and edit all lines marked by 'FIXME:'

{
  description = "a simple yet secure bitcoin node using nix-bitcoin";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-bitcoin.url = "github:fort-nix/nix-bitcoin/release";
    # You can also use a version branch to track a specific NixOS release
    # nix-bitcoin.url = "github:fort-nix/nix-bitcoin/nixos-24.05";
  };

  outputs = {
    self,
    nixpkgs,
    nix-bitcoin,
    ...
  }: let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      # FIXME: change "host" to the hostname of your system defined in configuration.nix
      host = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          nix-bitcoin.nixosModules.default
          # Optional:
          # Import the secure-node preset, an opinionated config to enhance security
          # and privacy.
          (nix-bitcoin + "/modules/presets/secure-node.nix")
          {
            nix-bitcoin = {
              # Automatically generate all secrets required by services.
              # The secrets are stored in /etc/nix-bitcoin-secrets
              generateSecrets = true;
              # When using nix-bitcoin as part of a larger NixOS configuration, set the following to enable
              # interactive access to nix-bitcoin features (like bitcoin-cli) for your system's main user
              operator = {
                enable = true;
                # FIXME: Set this to your system's main user
                name = "satoshi";
              };
            };
          }
          # If you use a custom nixpkgs version for evaluating your system
          # (instead of `nix-bitcoin.inputs.nixpkgs` like in this example),
          # consider setting `useVersionLockedPkgs = true` to use the exact pkgs
          # versions for nix-bitcoin services that are tested by nix-bitcoin.
          # The downsides are increased evaluation times and increased system
          # closure size.
          #
          # nix-bitcoin.useVersionLockedPkgs = true;
        ];
      };
    };
  };
}
