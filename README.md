# Nerves System Raspberry Pi 4 with SANE and Imagemagick

This is the [base Nerves System configuration for Raspberry Pi
4](https://github.com/nerves-project/nerves_system_rpi4) with the
`sane-backends` and `imagemagick` packages added.

This is useful if you want to have a Nerves system that has drivers for
interacting with document scanner hardware and imagemagick for adjusting the
scans.

## Usage

Add this to your nerves project `mix.exs` deps.

``` elixir
{:nerves_system_rpi4_sane,
 github: "cullan/nerves_system_rpi4_sane",
 branch: "rpi4_sane",
 runtime: false,
 targets: :rpi4_sane
}
```

## Building a release of this system

This is not needed to use the system. It is how the tarball that is in the
releases section of this repo is created.

``` sh
mix ns.clean
mix ns.build
mix nerves.artifact
```
