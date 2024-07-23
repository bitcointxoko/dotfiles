### Hardware wallets
# Enable the following to allow using hardware wallets.
# See https://github.com/bitcoin-core/HWI for more information.
{
  services.hardware-wallets = {
    # Ledger must be initialized through the official ledger live app and the Bitcoin app must
    # be installed and running on the device.
    # ledger = true;
    # Trezor can be initialized with the trezorctl command in nix-bitcoin. More information in
    # `../docs/services.md`.
    # trezor = true;
  };
}
