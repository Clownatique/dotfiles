touch .config/wallpapers/current.jpg
touch .config/wallpapers/current-blurred.jpg
if [ $1 = rose_clair ]; then
  chg=vert_clair
elif [ $1 = vert_clair ]; then
  chg=rose_clair
elif [ $1 = vert_fonce ]; then
  chg=rose_fonce
elif [ $1 = rose_fonce ]; then
  chg=vert_fonce
fi

echo $1

cp .config/wallpapers/cable/$chg\_colorise.jpg .config/wallpapers/current.jpg
cp .config/wallpapers/cable/$chg\_blur.jpg .config/wallpapers/current-blurred.jpg
sleep 1 &&  swww img .config/wallpapers/current.jpg
