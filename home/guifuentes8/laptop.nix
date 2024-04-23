{ pkgs, config, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./features/dev
    ];    }
