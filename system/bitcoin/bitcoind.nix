{config, ...}: {
  services.bitcoind = {
    enable = true;
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
  }; 
  networking.firewall.allowedTCPPorts = [
    config.services.bitcoind.port
    config.services.bitcoind.rpc.port
  ];
  nix-bitcoin.onionServices.bitcoind.public = true; 
}
