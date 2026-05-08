{
  description = "Shell for making a Nerves system";
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      beamPkgs = with pkgs.beam_minimal; packagesWith interpreters.erlang_28;
      elixir = beamPkgs.elixir_1_19;
    in
    {
      devShells.x86_64-linux.default =
        (pkgs.buildFHSEnv {
          name = "buildroot shell";
          targetPkgs =
            pkgs:
            (
              with pkgs;
              [
                (lib.hiPrio gcc)
                file
                gnumake
                ncurses.dev
                pkg-config
                unzip
                wget
                libxcrypt
                pkgsCross.aarch64-multiplatform.gccStdenv.cc
              ]
              ++ pkgs.linux.nativeBuildInputs
            )
            ++ [
              elixir
            ];
          profile = "export MIX_TARGET=rpi4_sane";
        }).env;
    };
}
