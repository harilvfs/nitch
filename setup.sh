#!/bin/sh

link_nerd="https://github.com/harilvfs/nitch/releases/download/0.1.7/nitch"
link_no_nerd="https://github.com/harilvfs/nitch/releases/download/0.1.7/nitchNoNerd"

blue='\033[0;34m'
green='\033[0;32m'
red='\033[0;31m'
yellow='\033[0;33m'
reset='\033[0m'

printf "${blue}"
printf '    _   ___ __       __  \n'
printf '   / | / (_) /______/ /_ \n'
printf '  /  |/ / / __/ ___/ __ \\\n'
printf ' / /|  / / /_/ /__/ / / /\n'
printf '/_/ |_/_/\__/\___/_/ /_/ \n'
printf "${reset}\n"

printf "Use nerd font symbols? (${green}y${reset}/${red}n${reset}): "
read -r symbols_yn

case "$symbols_yn" in
  y)
    url="$link_nerd"
    bin="nitch"
    ;;
  n)
    url="$link_no_nerd"
    bin="nitchNoNerd"
    ;;
  *)
    printf "${red}Invalid input. Please enter y or n.${reset}\n"
    exit 1
    ;;
esac

printf "${yellow}Installing...${reset}\n"
sudo rm -f /usr/local/bin/nitch
wget -q "$url" -O "$bin"
chmod +x "$bin"
sudo mv "$bin" /usr/local/bin/nitch
printf "${green}Done.${reset}\n"
