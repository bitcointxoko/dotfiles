{
  ### RIDE THE LIGHTNING
  services.rtl = {
    # Set this to enable RTL, a web interface for lnd and clightning.
    enable = true;
    nodes = {
      # Set this to add a lnd node interface.
      # Automatically enables lnd.
      # lnd.enable = true;
      # Set this to add a clightning node interface.
      # Automatically enables clightning.
      # clightning.enable = true;
      #
      # You can enable both nodes simultaneously.
      #
      # Set this option to enable swaps with lightning-loop.
      # Automatically enables lightning-loop.
      # lnd.loop = true;
    };
  };
}
