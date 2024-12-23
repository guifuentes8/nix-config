{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "pokeget-plus";
  version = "v1.7.0";

  src = fetchFromGitHub {
    owner = "Criomby";
    repo = "pokeget-plus";
    rev = version;
    hash = "sha256-L4RE/cTGy8SPFJ9RScRkd7AoxnjM16S8gIBHUJsiUWc=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-//RnFoaIFIiYWnSyOHiCPAK8JY0IfEmX0Ta2otzSxec=";

  meta = with lib; {
    description = "A better rust version of pokeget";
    homepage = "https://github.com/Criomby/pokeget-plus";
    license = licenses.mit;
    mainProgram = "pokeget";
    maintainers = with maintainers; [ aleksana ];
  };
}

