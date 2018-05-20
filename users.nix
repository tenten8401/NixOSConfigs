{ config, pkgs, ... }:

{
  # Set default shell.
  users.defaultUserShell = pkgs.zsh;

  # Define users.
  users.extraUsers.isaac = {
    extraGroups = [ "wheel" "uucp" "dialout" "networkmanager" ];
    isNormalUser = true;
    uid = 1000;
  };
}
