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
    anydesk
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
    kate
    kdenlive
    kdesu
    krita
    libreoffice
    neofetch
    spectacle
    vlc

    # Core Software
    ffmpeg-full
    frei0r
    git
    openjdk8
    python3
    unzip
    wget
    wineStaging
    atftp
  ];
}
