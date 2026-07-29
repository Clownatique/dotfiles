{ config, pkgs, mkForce, lib, ... }:


{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
    
  };
  programs.firefox = {
    enable = true;
    package = pkgs.waterfox;

    languagePacks = [ "en-GB" ];

    policies = {
      # Feature Disabling
      DisableBuiltinPDFViewer       = true;
      DisableFirefoxStudies         = true;
      DisableFirefoxScreenshots     = true;
      DisableProfileImport          = true;
      DisableProfileRefresh         = true;
      DisableSetDesktopBackground   = true;
      DisablePocket                 = true;
      DisableTelemetry              = true;
      DisableFormHistory            = true;
      DisablePasswordReveal         = true;

      # Access Restrictions
      BlockAboutConfig              = false;
      # UI and Behavior
      DontCheckDefaultBrowser       = true;
      HardwareAcceleration          = true;
      DefaultDownloadDirectory      = "/home/nestor/Downloads";

      # Extensions
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi"; 
      in {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          install_url       = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };
        "vimium-store@googlegroups.com" = {
          install_url       = moz "vimium-ff";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };
      };
  };
  preferences = { 
      # "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
      "extensions.pocket.enabled" = "lock-false";
      "extensions.screenshots.disabled" = "lock-true";
      "browser.topsites.contile.enabled" = "lock-false";
      "browser.formfill.enable" = "lock-false";
      "browser.search.suggest.enabled" = "lock-false";
      "browser.search.suggest.enabled.private" = "lock-false";
      "browser.urlbar.suggest.searches" = "lock-false";
      "browser.urlbar.showSearchSuggestionsFirst" = "lock-false";
      "browser.newtabpage.activity-stream.feeds.section.topstories" = "lock-false";
      "browser.newtabpage.activity-stream.feeds.snippets" = "lock-false";
      "browser.newtabpage.activity-stream.section.highlights.includePocket" = "lock-false";
      "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = "lock-false";
      "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = "lock-false";
      "browser.newtabpage.activity-stream.section.highlights.includeVisited" = "lock-false";
      "browser.newtabpage.activity-stream.showSponsored" = "lock-false";
      "browser.newtabpage.activity-stream.system.showSponsored" = "lock-false";
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = "lock-false";
    };
  };

}
