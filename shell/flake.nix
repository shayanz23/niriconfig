{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };
  };

  outputs = { self, nixpkgs, ags, astal }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.stdenv.mkDerivation { 
      pname = "my-gnome-shell";

      version = "0.1.0";

      src = ./.;

      nativeBuildInputs = with pkgs; [
        wrapGAppsHook
        gobject-introspection
        ags.packages.${system}.default
      ];

          buildInputs = with pkgs;
      [
        glib
        libadwaita
        gtk4
        gtk4-layer-shell
        gjs
        esbuild
        evolution-data-server
        libsoup_3
      ]
      ++ (
        with astal.packages.${system}; [
          astal4
          notifd
          mpris
          bluetooth
          wireplumber
          network
          powerprofiles
          battery
          tray
          auth
        ]
      );

      installPhase = ''
        mkdir -p $out/bin
        ags bundle app.ts $out/bin/my-gnome-shell
        chmod +x $out/bin/my-gnome-shell
      '';

      preFixup = ''
        gappsWrapperArgs+=(
          --prefix PATH : ${pkgs.lib.makeBinPath ([
              pkgs.gjs
              pkgs.esbuild
          ])}
        )
      '';
    };
  };
}