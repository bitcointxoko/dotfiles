### JOINMARKET
{
  services = {
    joinmarket = {
    # Set this to enable the JoinMarket service, including its command-line scripts.
    # These scripts have prefix 'jm-', like 'jm-tumbler'.
    # Note: JoinMarket has full access to bitcoind, including its wallet functionality.
    enable = true;
    # 
    # Set this to enable the JoinMarket Yield Generator Bot. You will be able to
    # earn sats by providing CoinJoin liquidity. This makes it impossible to use other
    # scripts that access your wallet.
    # services.joinmarket.yieldgenerator.enable = true;
    };
    # Set this to enable the JoinMarket order book watcher.
    joinmarket-ob-watcher.enable = true;
  }; 
}
