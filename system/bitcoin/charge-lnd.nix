### charge-lnd
{
  services.charge-lnd = {
    # Set this to enable charge-lnd, a simple policy based fee manager for
    # LND. With this tool you can set fees to autobalance, recover channel open
    # costs, use on-chain fees as reference, or just use static fees. You decide.
    enable = true;
    # Define policies as outlined in the project documentation.
    policies = ''
    '';
  };
}
