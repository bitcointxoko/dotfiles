# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./system/bitcoin/bitcoind.nix
    # ./system/bitcoin/fulcrum.nix
    # ./system/bitcoin/mempool.nix
    # ./system/bitcoin/joinmarket.nix
    # ./system/bitcoin/joinmarket-ob-watcher.nix
    # ./system/bitcoin/btcpayserver.nix
    # ./system/bitcoin/clightning.nix
    # ./system/bitcoin/lnd.nix
    # ./system/bitcoin/rtl.nix
  ];

  # FIXME: Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.satoshi = {
    isNormalUser = true;
    description = "satoshi";
    extraGroups = ["wheel"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];

  # FIXME: Define your hostname.
  networking.hostName = "host";
  time.timeZone = "UTC";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  
  users.users.root = {
    openssh.authorizedKeys.keys = [
      # FIXME: Replace this with your SSH pubkey
      "ssh-ed25519 AAAAC3..."
    ];
  };

  ### Nodeinfo
  # Set this to add command `nodeinfo` to the system environment.
  # It shows info about running services like onion addresses and local addresses.
  # It is enabled by default when importing `secure-node.nix`.
  # nix-bitcoin.nodeinfo.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
