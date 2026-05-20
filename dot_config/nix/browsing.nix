{ config, pkgs, mkForce, lib, ... }:


{

  programs.firefox = {
    enable = true;

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
      HardwareAcceleration          = false;
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

      };
    };

  };
  environment.systemPackages = with pkgs; [
  (chromium.override {
    enableWideVine = true;
    commandLineArgs = [
      "--enable-features=AcceleratedVideoEncoder"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
    ];
  })
  ];
  programs.chromium = {
    enable = true;
    homepageLocation = "https://www.startpage.com/";
    extensions = [
    "eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx" # dark reader
    "aapbdbdomjkkjkaonfhkkikfgjllcleb;https://clients2.google.com/service/update2/crx" # google translate
    ];
    extraOpts = {
      "WebAppInstallForceList" = [
        {
        "custom_name" = "Youtube";
        "create_desktop_shortcut" = false;
        "default_launch_container" = "window";
        "url" = "https://youtube.com";
        }
      ];
    };
  };
}
