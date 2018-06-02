{ config, pkgs, ... }:

{
  # Install Drivers.
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  
  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  # Set Kernel Version & Add Modules.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = with config.boot.kernelPackages; [ virtualbox ];

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
    virtualbox
    vscode
    
    # Utilities
    ark
    firefox
    gimp
    gwenview
    inkscape
    kate
    kdenlive
    kdesu
    krita
    latte-dock
    libreoffice
    neofetch
    papirus-icon-theme
    plasma-vault
    skanlite
    spectacle
    vlc

    # Core Software
    platformio
    ffmpeg-full
    frei0r
    git
    openjdk8
    python3
    python2
    unzip
    wget
    wineStaging
    
    # Custom Software
    (import ./packages/HostLoaderApp/default.nix)
  ];
}
