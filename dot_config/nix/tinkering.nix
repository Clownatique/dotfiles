{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     rpi-imager
     platformio
     arduino-core
     freecad
     orca-slicer
  ];
}
