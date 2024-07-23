{config, ...}: {
  ### BITCOIND
  # Bitcoind is enabled by default via secure-node.nix.
  services.bitcoind = {
    enable = true;
    # Set this option to enable pruning with a specified MiB value.
    # clightning is compatible with pruning. See
    # https://github.com/ElementsProject/lightning/#pruning for more information.
    # LND and electrs are not compatible with pruning.
    prune = 0;
    txindex = true;
    zmqpubrawtx = "tcp://127.0.0.1:28333";
    zmqpubrawblock = "tcp://127.0.0.1:28332";
    listen = true;
    address = "0.0.0.0";
    rpc = {
      address = "0.0.0.0";
      allowip = [
        "10.10.0.0/24" # Allow on a subnet
        "10.50.0.3" # Allow on a specific address
        "0.0.0.0/0" # Allow on all addresses
      ];
    };
    # You can add options that are not defined in modules/bitcoind.nix as follows
    # extraConfig = ''
    #   maxorphantx=110
    # '';
  }; 
  networking.firewall.allowedTCPPorts = [
    config.services.bitcoind.port
    config.services.bitcoind.rpc.port
  ];
  # Set this to accounce the onion service address to peers.
  # The onion service allows accepting incoming connections via Tor.
  # nix-bitcoin.onionServices.bitcoind.public = true;
}
