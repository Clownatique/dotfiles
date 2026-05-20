{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
     git
     gcc
     clang_20
     ocaml
     chezmoi
     usbutils
     emmet-language-server
     clang-tools
     ocamlPackages.lsp
     racket
     taplo
     marksman
     nixd
     vscode-css-languageserver
     superhtml
     vscode-json-languageserver
     emmet-ls
     python315
     luaformatter
     prettier
     jinja-lsp
     lua-language-server
  ];
  programs.tmux = {
    enable = true;
  };
}
