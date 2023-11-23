{ outputs, inputs, ... }:
{
  modifications = final: prev: {
    ytui-music = prev.ytui-music.overrideAttrs (old: {
      src = prev.fetchFromGitHub {
        rev = "main";
        hash = "sh1VCQGPH8cnQDSqpihGuwzETYEhbG6Ggo=";
      };
    });
  };
}
