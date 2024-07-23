  ### Backups
  # Set this to enable nix-bitcoin's own backup service. By default, it
  # uses duplicity to incrementally back up all important files in /var/lib to
  # /var/lib/localBackups once a day.
  { services.backups.enable = true; }
  #
  # You can pull the localBackups folder with
  # `scp -r bitcoin-node:/var/lib/localBackups /my-backup-path/`
  # Alternatively, you can also set a remote target url, for example
  # services.backups.destination = "sftp://user@host[:port]/[relative|/absolute]_path";
  # Supply the sftp password by appending the FTP_PASSWORD environment variable
  # to secrets/backup-encryption-env like so
  # `echo "FTP_PASSWORD=<password>" >> secrets/backup-encryption-env`
  # You many also need to set a ssh host and publickey with
  # programs.ssh.knownHosts."host" = {
  #   hostNames = [ "host" ];
  #   publicKey = "<ssh public from `ssh-keyscan`>";
  # };
  # If you also want to backup bulk data like the Bitcoin & Liquid blockchains
  # and electrs data directory, enable
  # services.backups.with-bulk-data = true;
