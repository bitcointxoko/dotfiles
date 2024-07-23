### BTCPayServer
{
  services.btcpayserver = {
    # Set this to enable BTCPayServer, a self-hosted, open-source
    # cryptocurrency payment processor.
    enable = true;
    # Privacy Warning: BTCPayServer currently looks up price rates without
    # proxying them through Tor. This means an outside observer can correlate
    # your BTCPayServer usage, like invoice creation times, with your IP address.
    #
    # Enable this option to connect BTCPayServer to clightning.
    lightningBackend = "clightning";
    #
    # Enable this option to connect BTCPayServert to lnd.
    #
    # The lightning backend service is automatically enabled.
    # Afterwards you need to go into Store > General Settings > Lightning Nodes
    # and select "the internal lightning node of this BTCPay Server".
    #
  };
  # Set this to create an onion service to make the btcpayserver web interface
  # accessible via Tor.
  # Security WARNING: Create a btcpayserver administrator account before allowing
  # public access to the web interface.
  # nix-bitcoin.onionServices.btcpayserver.enable = true;
}
