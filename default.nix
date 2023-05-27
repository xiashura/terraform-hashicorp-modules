with (import <nixpkgs> { });
let
  tf-tests = pkgs.writeShellScriptBin "tf-tests" ''
    terraform -chdir=$PWD/tests $1 
  '';
in stdenv.mkDerivation {
  shellHook = ''
    set -a
    source .env
    set +a
  '';
  name = "terraform-hashicorp-modules";
  buildInputs = [ vault ];
}
