{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
    users.users.nestor = {
      isNormalUser = true;
      description = "nestor";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    security.sudo.extraRules = [
      {
        users = [ "nestor" ];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];


    time.timeZone = "Europe/Paris";

    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  }
