{...}: {
  services.mempool = {
    enable = true;
    electrumServer = "fulcrum";
    frontend.enable = true;
  };
  # Set this to create an onion service to make the mempool web interface
  # available via Tor:
  # nix-bitcoin.onionServices.mempool-frontend.enable = true;
}
