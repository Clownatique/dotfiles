{ config, pkgs, ... }:

{
  ########
  # BOOT #
  ########
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  services.printing.enable = true;


  #########
  # AUDIO #
  #########
  services.pulseaudio.enable = false;
  security.rtkit.enable = true; # prevents audio dropouts
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  networking.networkmanager.enable = true;
  users.users.nestor = {
    isNormalUser = true;
    description = "nestor";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
