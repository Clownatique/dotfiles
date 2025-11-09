 #!/bin/sh 

theme_name=$(echo "rose_clair\nrose_fonce\nvert_clair\nvert_fonce" | wofi --show dmenu -D hide_search = true)
export theme_name
cp .config/alacritty/themes/$theme_name.toml .config/alacritty/themes/current.toml
cp .config/gtk-3.0/themes/$theme_name.css .config/gtk/gtk.css
cp .config/kak/colors/$theme_name.kak .config/kak/colors/current.kak
cp .config/niri/themes/$theme_name.kdl .config/niri/themes/current.kdl
cp .config/qt6ct/colors/$theme_name.conf .config/qt6ct/colors/courant.conf
cp .config/swaylock/themes/$theme_name .config/swaylock/config
cp .config/waybar/themes/$theme_name.css .config/waybar/colors.css
pkill waybar && waybar
bash .config/wallpapers/wallpaperswitcher.sh $theme_name 
