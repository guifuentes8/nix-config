{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global
    #    ./features/cli
    ./features/dev
    #    ./features/productivity
    # ./features/video/davinci-resolve
  ];

}
