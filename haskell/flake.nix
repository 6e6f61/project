{
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
      # deps = with pkgs; [ cabal-install ghc ];
  in
    {
      packages.x86_64-linux.default = pkgs.haskellPackages.developPackage
        {
          root = ./.;
        };
      
      devShells.default = pkgs.mkShell { buildInputs = with pkgs; [ cabal-install ghc ]; };
    };
}