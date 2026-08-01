{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    marksman
    pandoc
    typst
  ];
}
