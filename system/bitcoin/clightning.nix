{
  ### CLIGHTNING
  # Enable clightning, a Lightning Network implementation in C.
  services = {
    clightning = {
      enable = true;
      extraConfig = ''
        experimental-offers
      '';
      # == Plugins
      # See ../README.md (Features → clightning) for the list of available plugins.
      # plugins.clboss.enable = true;
    };
    # == REST server
    # Set this to create a clightning REST onion service.
    # This also adds binary `lndconnect-clightning` to the system environment.
    # This binary creates QR codes or URLs for connecting applications to clightning
    # via the REST onion service.
    # You can also connect via WireGuard instead of Tor.
    # See ../docs/services.md for details.
    #
    # clightning-rest = {
    #   enable = true;
    #   lndconnect = {
    #     enable = true;
    #     onion = true;
    #   };
    # };
  };
  # Set this to create an onion service by which clightning can accept incoming connections
  # via Tor.
  # The onion service is automatically announced to peers.
  # nix-bitcoin.onionServices.clightning.public = true;
}
