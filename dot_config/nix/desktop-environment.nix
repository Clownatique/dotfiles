{ config, pkgs, ... }:


{
  imports = [
    "/home/nestor/.config/nix/utils/dolphin-overlay.nix"
    # "/home/nestor/.config/nix/utils/nnn.nix"
  ];
  programs.thunderbird.enable = true;
  environment.systemPackages = with pkgs;
  [
    wob
    fzf
    calcurse
    bemoji
    fastfetch
    helix
    wl-clipboard
    wlsunset
    dunst
    swww
    swaylock
    swayidle
    wayfarer
    imv
    foot
    power-profiles-daemon
    brightnessctl
    mpv
    waybar
    zathura
    fuzzel
    kdePackages.kcolorchooser
    kdePackages.dolphin
    pandoc
    bitwarden-cli
    (pkgs.nnn.override { withNerdIcons= true; })
    # bonus
    power-profiles-daemon
    # backbone
    kdePackages.qtsvg
     
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
    xwayland-satellite
  ];
  programs.kdeconnect.enable = true;

  services.power-profiles-daemon.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.fira-code
  ];
  fonts.fontDir.enable = true;

  xdg.portal.enable = true; 
  xdg.portal.config.niri = {
    "org.freeedesktop.impl.portal.FileChooser" = [ "kde" ];
  };
  
  programs.niri.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};
  programs.waybar.enable = true;

}
