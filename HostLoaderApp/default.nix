let
  fetchNixpkgs = import ./fetchNixpkgs.nix;
  rev = "18.03";
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = "1dm777cmlhqcwlrq8zl9q2d87h3p70rclpvq36y43kp378f3pd0y";
  };
in
with import nixpkgs { config = {}; overlays = []; };

clangStdenv.mkDerivation {
  name = "HostLoaderApp-1.0";
  src = ./.;

  buildInputs = [ libusb ];

  installPhase = ''
    mkdir -p $out/bin
    cp hid_bootloader_cli $out/bin
  '';
}
