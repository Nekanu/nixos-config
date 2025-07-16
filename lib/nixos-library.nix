{
  getNormalUsers =
    { config }:
    let
      users = config.users.users;
    in
    builtins.attrNames (builtins.filterAttrs (_: user: user.isNormalUser or false) users);
}
