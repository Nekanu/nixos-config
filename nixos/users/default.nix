{ config, username, lib, pkgs, ... }:
{
  imports = [
    ./root
    ./${username}
  ];

  users = {
    mutableUsers = true;
  };
}
