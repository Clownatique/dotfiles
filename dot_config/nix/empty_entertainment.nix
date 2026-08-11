{ config, pkgs, ...}:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.gamemode.enable = true;
  hardware.graphics.enable32Bit = true;
  environment.systemPackages = with pkgs; [
    # (lutris.override {
    #    extraPkgs = pkgs: [
    #      # List package dependencies here
    #    ];
    # (lutris.override {
    #   extraLibraries =  pkgs: [
    #     # List library dependencies here
    #   ];
    # })
    steam-tui
    steam-run
    heroic
    prismlauncher
  ];


  
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

}
