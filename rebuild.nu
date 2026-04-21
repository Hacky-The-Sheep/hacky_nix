def rebuild [] {
  let host = (input "Host: ")
  cd /home/hacky/hacky_nix/
  sudo nix run .#write-flake
  sudo nixos-rebuild switch --upgrade --flake $".#($host)"
}

rebuild
