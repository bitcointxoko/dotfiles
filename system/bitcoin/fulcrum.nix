### FULCRUM
{
  services.fulcrum = {
    # Set this to enable fulcrum, an Electrum server implemented in C++.
    #
    # Compared to electrs, fulcrum has higher storage demands but
    # can serve arbitrary address queries instantly.
    #
    # Before enabling fulcrum, and for more info on storage demands,
    # see the description of option `enable` in ../modules/fulcrum.nix
    #
    enable = true;
  };
}
