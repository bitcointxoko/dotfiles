{
  ### LND
  # Set this to enable lnd, a lightning implementation written in Go.
  # services.lnd.enable = true;
  #
  services.lnd = {
    enable = true;
    # NOTE: In order to avoid collisions with clightning you must disable clightning or
    # change the services.clightning.port or services.lnd.port to a port other than
    # 9735.
    #
    port = 9736;
  };

  # Set this to create an onion service by which lnd can accept incoming connections
  # via Tor.
  # The onion service is automatically announced to peers.
  # nix-bitcoin.onionServices.lnd.public = true;
  #
  # Set this to create a lnd REST onion service.
  # This also adds binary `lndconnect` to the system environment.
  # This binary generates QR codes or URLs for connecting applications to lnd via the
  # REST onion service.
  # You can also connect via WireGuard instead of Tor.
  # See ../docs/services.md for details.
  #
  # services.lnd.lndconnect = {
  #   enable = true;
  #   onion = true;
  # };
  #
  ## WARNING
  # If you use lnd, you should manually backup your wallet mnemonic
  # seed. This will allow you to recover on-chain funds. You can run the
  # following commands after the lnd service starts:
  #   mkdir -p ./backups/lnd/
  #   scp bitcoin-node:/var/lib/lnd/lnd-seed-mnemonic ./backups/lnd/
  #
  # You should also backup your channel state after opening new channels.
  # This will allow you to recover off-chain funds, by force-closing channels.
  #   scp bitcoin-node:/var/lib/lnd/chain/bitcoin/mainnet/channel.backup ./backups/lnd/
  #
  # Alternatively, you can have these files backed up by services.backups.
}
