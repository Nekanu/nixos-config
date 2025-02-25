{ username, ... }:
{
  imports = [
    ./root
    ./${username}
  ];

  users = {
    mutableUsers = true;
  };
}
