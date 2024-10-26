{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [ "--no-default-browser-check" ];
    extensions = [
      { id = "gphhapmejobijbbhgpjhcjognlahblep"; } # gnomeExtensions
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # reactDevTools
      { id = "lmhkpmbekcpmknklioeibfkpmmfibljd"; } # reduxDevTools
      { id = "jdkknkkbebbapilgoeccciglkfbmbnfm"; } # apolloDevTools
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # jsonFormatter
      { id = "aapbdbdomjkkjkaonfhkkikfgjllcleb"; } # googleTranslate
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "bkkmolkhemgaeaeggcmfbghljjjoofoh"; } # catppuccin mocha
      { id = "fnaicdffflnofjppbagibeoednhnbjhg"; } # floccus bookmarks
      { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # duckduckgo
    ];
  };
}
