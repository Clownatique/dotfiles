{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    taplo
    nixd
  ];
}

