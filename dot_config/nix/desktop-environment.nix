{ config, pkgs, ... }:

{
  imports = [
    "/home/nestor/.config/nix/utils/dolphin-overlay.nix"
    # "/home/nestor/.config/nix/utils/nnn.nix"
  ];
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;
  programs.kdeconnect.enable = true;

  services.power-profiles-daemon.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.fira-code
    font-awesome_4
  ];
  fonts.fontDir.enable = true;

  programs.niri.enable = true;

  xdg.portal.enable = true; 
  xdg.portal.config.niri = {
    "org.freeedesktop.impl.portal.FileChooser" = [ "kde" ]; # wip: to change into nnn
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.mopidy = {
	enable = true;
	extensionPackages = with pkgs; [
	  mopidy-local
	  mopidy-mpd
	  mopidy-tidal
	  mopidy-ytmusic
	];
	settings ={
	    core={
	      restore_state = true;
	    };
	    audio = {
	      output = "autoaudiosink";
	    };

      local = {
    		enabled = true;
    		media_dir = "/tmp/Music";
    		data_dir =  "$HOME/Music/data";
    		scan_timeout = 1000;
    	};

			logging = {
  			color = true;
  			console_format = "%(levelname)-8s %(message)s";
  			debug_format = "%(levelname)-8s %(asctime)s [%(process)d:%(threadName)s] %(name)s\n";
  			debug_file = "mopidy.log";
  			verbosity = 0;
			};

			mpd = {
  			enabled = true;
        hostname = "::";
  		};
  		
			ytmusic = {
  			enabled = false;
  			auth_json = "/tmp/auth.json";
  		};

			tidal = {
        enabled = true;
        quality = "LOSSLESS";
        auth_method = "OAUTH";
        login_server_port = 8989;
        lazy = false;
        login_method = "AUTO";
      };
  	};
	};
  environment.systemPackages = with pkgs;
  [
    wl-screenrec
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    kdePackages.breeze
    kdePackages.breeze-gtk
    #######
    # EDC #
    #######
    helix
    foot
    zathura
    mpv
    imv
    (pkgs.nnn.override { withNerdIcons= true; })
    fuzzel

    ############
    # DE TOOLS #
    ############
    
    wl-clipboard
    wlsunset
    dunst
    awww
    swaylock
    swayidle
    waybar
    waybar-mpris
    xwayland-satellite
    power-profiles-daemon
    brightnessctl
    bemoji # too useful to not be in here 
    wob
    fzf #(not so used yet)
    wev
    fastfetch
    libnotify
    mpd
    tidal-dl
    mpd-mpris
    cava
    anki
    syncthing
    ungoogled-chromium
    bitwarden-cli
    calcurse # calendar thing

    kdePackages.dolphin
    kdePackages.qtsvg 
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
  ];
}
