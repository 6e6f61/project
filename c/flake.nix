{
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
      {
        packages.x86_64-linux.default = pkgs.stdenv.mkDerivation
          {
            pname = "project-name";
            version = "0.0.1";
            src = ./.;
            enableParallelBuilding = true;
            buildInputs = [ ];
            installPhase = ''mkdir -p $out/bin; mv project-name $out/bin'';
          };
      };
}