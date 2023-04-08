{
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";
  inputs.crane.url   = "github:ipetkov/crane";

  outputs = { self, nixpkgs, crane }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
      crane' = crane.lib.x86_64-linux;
  in
    {
      packages.x86_64-linux.default = crane'.buildPackage
        {
          src = crane'.cleanCargoSource (crane'.path ./.);
        };

      devShells.default = pkgs.mkShell
        {
          buildInputs = with pkgs; [ cargo rustc ];
        };
    };
}