{ inputs, outputs, lib, config, pkgs, unstable, ... }:
let ytermusic = outputs.packages.${pkgs.system}.ytermusic;
in
{
  home.packages = [
    ytermusic
  ];

  home.file."headers.txt" = {
    enable = true;
    # target = "${config.home.homeDirectory}";
    text = ''
      Cookie: VISITOR_INFO1_LIVE=tgpVzuOlEFA; VISITOR_PRIVACY_METADATA=CgJCUhICGgA%3D; PREF=f6=40000480&volume=66&f7=150&tz=America.Sao_Paulo&autoplay=true&f5=30000; _gcl_au=1.1.795350709.1695055555; __Secure-1PSIDTS=sidts-CjIBNiGH7vX-goxm4_xpLBGX0ipEgHuchFQIl_SZvfRmkchUbRW78v1_SiSoXbN3pGTDKhAA; __Secure-3PSIDTS=sidts-CjIBNiGH7vX-goxm4_xpLBGX0ipEgHuchFQIl_SZvfRmkchUbRW78v1_SiSoXbN3pGTDKhAA; HSID=AQ-_0rDM5F-F1ntC_; SSID=Aj6WqIRixyZVSr0xJ; APISID=nVr6X-xSrxI3e3NV/A0x__edcVkOcK2asi; SAPISID=J21kMoiTL25RZPWi/A7q1_sYb2x9BD1lYZ; __Secure-1PAPISID=J21kMoiTL25RZPWi/A7q1_sYb2x9BD1lYZ; __Secure-3PAPISID=J21kMoiTL25RZPWi/A7q1_sYb2x9BD1lYZ; SID=dQh8HFPrHr1Zey2YHgxODsakGFDP1wdWtc2BCOO4_kY5kRHGgMQKxzXQO6dGCHc14H5IDg.; __Secure-1PSID=dQh8HFPrHr1Zey2YHgxODsakGFDP1wdWtc2BCOO4_kY5kRHGsQhyuG8cwJcQvptbCLKTPg.; __Secure-3PSID=dQh8HFPrHr1Zey2YHgxODsakGFDP1wdWtc2BCOO4_kY5kRHG_QkazJqOPI0g2Y2YQMuaeQ.; LOGIN_INFO=AFmmF2swRQIgJqjXH5wjhG4byz_8FLRqH48sZZ8GHHH_rBl52EzCEsQCIQD6pcFovRFHlnxqxpRms--cc-KeoUn8NOdE_FOURxu49g:QUQ3MjNmeEIwMzVoWWcyYmQ0NDh6aXgxYk9QNl9xMFpqdGgtX2ZVazd1UWQyRGZ5TEdWdVplY0VCRHFhTEZ6aVE3MDBjZTBYU3J5STRKZkJxYnhwemJaLWw2WTFZejBlUkgxa01kZm1LeFlYdkRISXJMQzFKQlRVeUQydXRPSWg4VHdYWDZRRnQtakJSM2lXZE9kclRNTkNIaFJ6bGFtYlFB; SIDCC=ACA-OxNbHnkLO5NVtx0w5XNGcGu_hA0_CiHfPUn9EAhOM6HJAYEsiMvTn-GvQUnCphX6SCpOzw; __Secure-1PSIDCC=ACA-OxOjmX3E9yQ5nKCkJ9WNAwr42HjDcOJMNuoJyjNjBvyKjyu_R6z9HTsCc5OFxb136nSSVg; __Secure-3PSIDCC=ACA-OxNehS5PJZpBTWiaq0kyRfui29QwJK3cto-TjFU9MRkS3f-07eWdSZRGKfScUt5WbSiALXI; YSC=CWl4ZLG47UI
      User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/119.0
    '';
  };
}
