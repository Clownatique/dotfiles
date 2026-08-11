{ config, pkgs, ... }:

{

  ########
  # BOOT #
  ########
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  services.printing.enable = true;
  networking.networkmanager.enable = true;
  services.pipewire.systemWide= true;

  users.users.nestor = {
    isNormalUser = true;
    description = "nestor";
    extraGroups = [ "networkmanager" "wheel" "pipewire" "audio" "input" ];
  };

  users.users.mopidy.extraGroups = [ "pipewire" "audio" ];
}
