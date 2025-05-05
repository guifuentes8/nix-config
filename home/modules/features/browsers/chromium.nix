{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.unstable.vivaldi;
    commandLineArgs = [ "--no-default-browser-check" ];
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "gphhapmejobijbbhgpjhcjognlahblep"; } # gnomeExtensions
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # reactDevTools
      { id = "lmhkpmbekcpmknklioeibfkpmmfibljd"; } # reduxDevTools
      { id = "jdkknkkbebbapilgoeccciglkfbmbnfm"; } # apolloDevTools
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # jsonFormatter
      { id = "aapbdbdomjkkjkaonfhkkikfgjllcleb"; } # googleTranslate
      { id = "fnaicdffflnofjppbagibeoednhnbjhg"; } # floccus bookmarks
      { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # duckduckgo
      { id = "dlcadbmcfambdjhecipbnolmjchgnode"; } # everforest theme
      { id = "gighmmpiobklfepjocnamgkkbiglidom"; } # adblock
    ];
  };
  home.packages = [ pkgs.vivaldi-ffmpeg-codecs ];
}
