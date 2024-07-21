{...}: {
  services = {
    clightning = {
      enable = true;
      extraConfig = ''
        experimental-offers
      '';
    };
  };
}
