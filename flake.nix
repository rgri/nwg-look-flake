{
  inputs = {
    # Add to your flake.nix:
    # nwg-look.inputs.nixpkgs.follows = nixpkgs;
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nwg-look-git = {
      url = "github:nwg-piotr/nwg-look";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, nwg-look-git, ... }@inp:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in with pkgs; {
      nwg-look = buildGoModule {
        name = "nwg-look";
        src = nwg-look-git;
        nativeBuildInputs = [ pkg-config xcur2png gtk3 ];
        buildInputs = [ cairo glib.dev gtk3.dev ];
        vendorHash = "sha256-5nsXSPjCinzJHtm/YsgJZ6xRlp7P4ArXC0jl1KomHPc=";
      };
    };
}
