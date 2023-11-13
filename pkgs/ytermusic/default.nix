{ lib, pkgs, fetchFromGitHub, rustPlatform, pkg-config, alsa-tools, alsa-lib }:

rustPlatform.buildRustPackage rec {
  pname = "ytermusic";
  version = "alpha-0.1.0";

  src = fetchFromGitHub {
    owner = "ccgauche";
    repo = pname;
    rev = version;
    hash = "sha256-Bl/hRzs4c+OLOUw8QXg+N6x4umVho9KtponU/QzbtMM=";
  };

  cargoSha256 = "";

  buildInputs = with pkgs; [
    dbus
    alsa-tools
    alsa-lib
  ];
  nativeBuildInputs = [
    pkg-config
  ];

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };

  headers = pkgs.writeText "headers" ''
    cookie: VISITOR_INFO1_LIVE=tgpVzuOlEFA; VISITOR_PRIVACY_METADATA=CgJCUhICGgA%3D; PREF=f6=40000480&volume=66&f7=150&tz=America.Sao_Paulo&autoplay=true&f5=30000; _gcl_au=1.1.795350709.1695055555; __Secure-1PSIDTS=sidts-CjIBNiGH7sRQD3LsktnbAu6B32RS7yL5djynOmcL0G-SMsM_6NXNh8KPzq94d2lASKqGYBAA; __Secure-3PSIDTS=sidts-CjIBNiGH7sRQD3LsktnbAu6B32RS7yL5djynOmcL0G-SMsM_6NXNh8KPzq94d2lASKqGYBAA; HSID=AQ-_0rDM5F-F1ntC_; SSID=Aj6WqIRixyZVSr0xJ; APISID=nVr6X-xSrxI3e3NV/A0x__edcVkOcK2asi; SAPISID=J21kMoiTL25RZPWi/A7q1_sYb2x9BD1lYZ; __Secure-1PAPISID=J21kMoiTL25RZPWi/A7q1_sYb2x9BD1lYZ; __Secure-3PAPISID=J21kMoiTL25RZPWi/A7q1_sYb2x9BD1lYZ; SID=cAh8HPfK2c1vVnNXgbgRaTLzioihfSW1S8-Go4nOiHPo16x_eYNYOoi4ve8Cdi0_Wi56_g.; __Secure-1PSID=cAh8HPfK2c1vVnNXgbgRaTLzioihfSW1S8-Go4nOiHPo16x_i_j03gy9KIWRPYrfMW7pHw.; __Secure-3PSID=cAh8HPfK2c1vVnNXgbgRaTLzioihfSW1S8-Go4nOiHPo16x_wqgeJlm30Wlei-yoWSGiRA.; LOGIN_INFO=AFmmF2swRQIgJqjXH5wjhG4byz_8FLRqH48sZZ8GHHH_rBl52EzCEsQCIQD6pcFovRFHlnxqxpRms--cc-KeoUn8NOdE_FOURxu49g:QUQ3MjNmeEIwMzVoWWcyYmQ0NDh6aXgxYk9QNl9xMFpqdGgtX2ZVazd1UWQyRGZ5TEdWdVplY0VCRHFhTEZ6aVE3MDBjZTBYU3J5STRKZkJxYnhwemJaLWw2WTFZejBlUkgxa01kZm1LeFlYdkRISXJMQzFKQlRVeUQydXRPSWg4VHdYWDZRRnQtakJSM2lXZE9kclRNTkNIaFJ6bGFtYlFB; SIDCC=ACA-OxPVahObdnout2zqjvv33f--mMS6C9c1i2S5TJsopiVwnve8ZLgYtxNmPtAtQzBAS4wSpw; __Secure-1PSIDCC=ACA-OxORgzVgSaGkZ3C7CEsUKXewZxB6eBt7hhwtMkQDF9c1GtRJUuj7ilKt81loQSYpYqBvpg; __Secure-3PSIDCC=ACA-OxNW-vDkr6orUC3BJlX3_t8z7fHqtGh_D9MRiiaRyWUVgcYA93Sx_xHYEn0H8jgtloygAK0; YSC=OBs-ow3lgeA
    User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0
  '';

  postInstall = ''
    cp $headers $out/bin/headers.txt
  '';

  meta = with lib; {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = licenses.unlicense;
    maintainers = [ ];
  };
}
