### JOINMARKET
### https://github.com/fort-nix/nix-bitcoin/blob/master/modules/joinmarket.nix
{lib,...}: {
  services = {
    joinmarket = {
    # Set this to enable the JoinMarket service, including its command-line scripts.
    # These scripts have prefix 'jm-', like 'jm-tumbler'.
    # Note: JoinMarket has full access to bitcoind, including its wallet functionality.
    enable = true;
    # To see all available settings, check: 
    # https://raw.githubusercontent.com/JoinMarket-Org/joinmarket-clientserver/master/src/jmclient/configure.py
    settings = {
      # Change your preferred taker fees here
      POLICY = {
        max_cj_fee_rel = 0.00002;
        max_cj_fee_abs = 1000;
      };
      # Recommended setting adjustment: override default directory nodes. The following
      # setting makes joinmarket use the updated directory nodes. 
      # See this issue: https://github.com/JoinMarket-Org/joinmarket-clientserver/issues/1445
      # You can also check the status of directory nodes here: https://directories.w3ird.tech/
      "MESSAGING:onion" = {
        directory_nodes = lib.mkForce "satoshi2vcg5e2ept7tjkzlkpomkobqmgtsjzegg6wipnoajadissead.onion:5222,shssats5ucnwdpbticbb4dymjzf2o27tdecpes35ededagjpdmpxm6yd.onion:5222,coinjointovy3eq5fjygdwpkbcdx63d7vd4g32mw7y553uj3kjjzkiqd.onion:5222,nakamotourflxwjnjpnrk7yc2nhkf6r62ed4gdfxmmn5f4saw5q5qoyd.onion:5222";
      };
    };
    # 
    # Set this to enable the JoinMarket Yield Generator Bot. You will be able to
    # earn sats by providing CoinJoin liquidity. This makes it impossible to use other
    # scripts that access your wallet.
    # yieldgenerator.enable = true;
    };
    # Set this to enable the JoinMarket order book watcher.
    joinmarket-ob-watcher.enable = true;
  }; 
}
