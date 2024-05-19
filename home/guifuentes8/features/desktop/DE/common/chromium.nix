{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    extensions = [
      { id = "gphhapmejobijbbhgpjhcjognlahblep"; } # gnomeExtensions
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # reactDevTools
      { id = "lmhkpmbekcpmknklioeibfkpmmfibljd"; } # reduxDevTools
      { id = "jdkknkkbebbapilgoeccciglkfbmbnfm"; } # apolloDevTools
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # jsonFormatter
      { id = "aapbdbdomjkkjkaonfhkkikfgjllcleb"; } # googleTranslate
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "lpofefdiokgmcdnnaigddelnfamkkghi"; } # googleTasksApp
      { id = "bkkmolkhemgaeaeggcmfbghljjjoofoh"; } # catppuccin mocha
    ];
  };
}
