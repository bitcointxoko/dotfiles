### lightning-loop
{
  services.lightning-loop = {
    # Set this to enable lightninglab's non-custodial off/on chain bridge.
    enable = true;
    # loopd (lightning-loop daemon) will be started automatically. Users can
    # interact with off/on chain bridge using `loop in` and `loop out`.
    # Automatically enables lnd.
  };
}
