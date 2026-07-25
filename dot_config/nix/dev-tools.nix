{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  nixpkgs.config.permittedInsecurePackages = [
      "pnpm-9.15.9"
      "quickjs-2025-09-13-2"
  ];
  environment.systemPackages = with pkgs; [
     wev
     unzip
     git
     chezmoi
     usbutils
     oh-my-zsh
     # emmet-language-server
     # clang-tools
     # ocamlPackages.lsp
     # racket
     taplo
     marksman
     nixd
     # vscode-css-languageserver
     # superhtml
     # vscode-json-languageserver
     # emmet-ls
     # python315
     # luaformatter
     # prettier
     # jinja-lsp
     # lua-language-server
     tic-80
  ];
  programs.tmux = {
    enable = true;
  };
}
