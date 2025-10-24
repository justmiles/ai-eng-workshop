{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = "intro-to-ai-eng";

  buildInputs = with pkgs; [ jupyter python313 ];

  shellHook = ''
    if [ ! -d "$VIRTUAL_ENV" ]; then
        echo "Creating virtual environment '$VIRTUAL_ENV'..."
        python3 -m venv "$VIRTUAL_ENV"
    fi
    export PATH=$PWD/$VIRTUAL_ENV/bin:$PATH
    echo "nix-shell'd"

  '';

  # Environment variables
  env = { VIRTUAL_ENV = ".venv"; };
}
