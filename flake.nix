{
  description = "a simple yet secure bitcoin node using nix-bitcoin";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-bitcoin.url = "github:fort-nix/nix-bitcoin/release";
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
          (nix-bitcoin + "/modules/presets/secure-node.nix")
          {
            nix-bitcoin = {
              generateSecrets = true;
              operator = {
                enable = true;
                name = "satoshi";
              };
            };
          }
        ];
      };
    };
  };
}
