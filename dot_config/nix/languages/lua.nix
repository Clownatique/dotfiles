{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     luaformatter
     lua-language-server
     tic-80
  ];
}
