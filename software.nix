{ config, pkgs, ... }:

{
  # Install Drivers.
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  
  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Install software.
  environment.systemPackages = with pkgs; [
    # Extra software
    atom
    cura
    discord
    gitkraken
    minecraft
    spotify
    steam
    
    # Utilities
    ark
    firefox
    gimp
    kate
    neofetch
    spectacle
    vlc

    # Core Software
    git
    openjdk8
    unzip
    wget
    wineStaging
  ];
}
