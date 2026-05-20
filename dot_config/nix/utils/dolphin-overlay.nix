# /etc/nixos/modules/optional/dolphin-custom.nix
{ config, lib, pkgs, ... }:

{
  options.programs.dolphin.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Dolphin file manager with custom KService configuration.";
  };

  config = lib.mkIf config.programs.dolphin.enable {
    # Apply the overlay to nixpkgs
    nixpkgs.overlays = [
      (final: prev: {
        kdePackages = prev.kdePackages.overrideScope (kfinal: kprev: {
          dolphin = prev.symlinkJoin {
            name = "dolphin-wrapped";
            paths = [ kprev.dolphin ];
            nativeBuildInputs = [ prev.makeWrapper ];
            postBuild = ''
              rm $out/bin/dolphin
              makeWrapper ${kprev.dolphin}/bin/dolphin $out/bin/dolphin \
                --set XDG_CONFIG_DIRS "${prev.libsForQt5.kservice}/etc/xdg:$XDG_CONFIG_DIRS" \
                --run "${kprev.kservice}/bin/kbuildsycoca6 --noincremental ${prev.libsForQt5.kservice}/etc/xdg/menus/applications.menu"
            '';
          };
        });
      })
    ];

  };
}
