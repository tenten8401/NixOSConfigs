################################
#        MISC. SECTION         #
################################

{ config, pkgs, ... }:
{
  # Allow automatic updating & garbage collection.
  system.autoUpgrade.enable = true;
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  # Enable Redshift.
  services.redshift = {
    enable = true;
    latitude = "35.43";
    longitude = "-83.34";
  };
  
  # Enable ZSH and setup themes.
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.theme = "agnoster";
  };

  # Allow non-free software.
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Enable plymouth.
  boot.plymouth.enable = true;
  
  # Enable boot-up numlock.
  services.xserver.displayManager.sddm.autoNumlock = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
}
