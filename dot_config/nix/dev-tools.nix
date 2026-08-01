{ config, pkgs, ... }:

{
  imports = [
    "./languages/config.nix"
    "./languages/notes.nix"
    "./languages/lua.nix"
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
    #########
    # TOOLS #
    #########
    cht-sh
    imagemagick
    calc
    procps
    rlwrap
    sqlite
    jq
    ddcutil
    wmctrl
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
    # bash-completion
    # jq-lsp
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
