{...}: {
  ### MEMPOOL
  services.mempool = {
    # Set this to enable mempool, a fully featured Bitcoin visualizer, explorer,
    # and API service.
    enable = true;

    # Possible options for the Electrum backend server:
    #
    # - electrs (enabled by default):
    #   Small database size, slow when querying new addresses.
    #
    # - fulcrum:
    #   Large database size, quickly serves arbitrary address queries.
    #
    electrumServer = "fulcrum";
    frontend.enable = true;
  };
  # Set this to create an onion service to make the mempool web interface
  # available via Tor:
  # nix-bitcoin.onionServices.mempool-frontend.enable = true;
}
