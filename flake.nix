{
  inputs = {
    # Add to your flake.nix:
    # nwg-look.inputs.nixpkgs.follows = nixpkgs;
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }@inp:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in with pkgs; {
      nwg-look = buildGoModule {
        name = "nwg-look";
        src = fetchFromGitHub {
          owner = "nwg-piotr";
          repo = "nwg-look";
          rev = "c78dfef7f9a98893efdbb978ed7b616c822aeed6";
          sha256 = "sha256-qA6X1Rr1qEv2H86edNNMpxOggNamc5PdZXmc6cdz9oc=";
        };
        nativeBuildInputs = [ pkg-config xcur2png gtk3 ];
        buildInputs = [ cairo glib.dev gtk3.dev ];
        vendorHash = "sha256-5nsXSPjCinzJHtm/YsgJZ6xRlp7P4ArXC0jl1KomHPc=";
      };
    };
}
