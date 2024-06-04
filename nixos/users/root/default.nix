{ config, pkgs, ... }:
{
  users.users.root = {
    hashedPassword = null;
  };
}
