{ config, pkgs, ... }:

{
  imports = [
    "/home/nestor/.config/nix/languages/config.nix"
    "/home/nestor/.config/nix/languages/lua.nix"
    "/home/nestor/.config/nix/languages/notes.nix"
  ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  nixpkgs.config.permittedInsecurePackages = [
      "pnpm-9.15.9"
      "quickjs-2025-09-13-2"
  ];
  programs.tmux = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    imagemagick
    calc
    procps
    rlwrap
    sqlite
    jq
    ddcutil
    wmctrl
    typst
    typstyle
    tinymist
    typst-live
    #######
    # EDC #
    #######
    unzip
    git
    chezmoi
    usbutils
    oh-my-zsh
    #######
    # IDE #
    #######
    # racket
    #######
    # LSP #
    #######
    # taplo
    # nixd
    # emmet-language-server
    # clang-tools
    # ocamlPackages.lsp
    # vscode-css-languageserver
    # superhtml
    # vscode-json-languageserver
    # emmet-ls
    # python315
    # prettier
    # jinja-lsp
  ];
}
