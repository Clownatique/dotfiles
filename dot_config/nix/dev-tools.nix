{ config, pkgs, ... }:

{
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
     #######
     # EDC #
     #######
     unzip
     git
     chezmoi
     usbutils
     oh-my-zsh
     pandoc
     #######
     # IDE #
     #######
     # racket
     tic-80
     #######
     # LSP #
     #######
     taplo
     marksman
     nixd
     # emmet-language-server
     # clang-tools
     # ocamlPackages.lsp
     # vscode-css-languageserver
     # superhtml
     # vscode-json-languageserver
     # emmet-ls
     # python315
     # luaformatter
     # prettier
     # jinja-lsp
     # lua-language-server
  ];
}
