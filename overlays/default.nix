{ outputs, inputs, ... }:
{
  modifications = final: prev: {
    youtube-tui = prev.youtube-tui.overrideAttrs (old: {
      src = prev.fetchFromGitHub {
        owner = "Siriusmart";
        repo = "youtube-tui";
        rev = "v0.7.4";
        hash = "sha256-UN70V+RGYlYJxCQGPH8cnQDSqpihGuwzETYEhbG6Ggo=";
      };
    });
    spotify-player = prev.spotify-player.overrideAttrs
      (old: {
        buildFeatures = [
          "notify"
        ];
      });
  };
}
