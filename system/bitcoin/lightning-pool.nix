### lightning-pool
{
  # Set this to enable Lightning Lab's non-custodial batched uniform
  # clearing-price auction for Lightning Channel Leases.
  # services.lightning-pool.enable = true;
  #
  services.lightning-pool.enable = true;
  #
  # Use the `pool` command to interact with the lightning-pool service.
  # Automatically enables lnd.
  #
  # lightning-pool requires that lnd has a publicly reachable address.
  # Set this to create a public onion service for lnd.
  # nix-bitcoin.onionServices.lnd.public = true;
}
