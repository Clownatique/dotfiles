{ config, pkgs, ... }:


{
  environment.systemPackages = with pkgs; [
    blender
    inkscape
    gimp
    wl-screenrec
    mixxx
    hyprpicker
  ];
}
