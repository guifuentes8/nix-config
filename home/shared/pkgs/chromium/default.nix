{ unstable, ... }:
{
  programs.chromium = {
    enable = true;
    package = unstable.vivaldi;
    extensions = [
      {
        id = "clngdbkpkpeebahjckkjfobafhncgmne"; # stylus
      }
      {
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; # dark reader
      }
    ];
  };
}
