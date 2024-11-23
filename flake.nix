{
  outputs = inputs: let
    eachSystem = inputs.nixpkgs.lib.genAttrs ["x86_64-linux"];

    pkgsFor = eachSystem (system:
      import inputs.nixpkgs {
        inherit system;
        config = {
          android_sdk.accept_license = true;
          allowUnfree = true;
        };
      });
  in {
    devShells = eachSystem (
      system: let
        pkgs = pkgsFor.${system};
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            android-studio
            openjdk
            gradle
          ];
        };
      }
    );
  };

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
}
