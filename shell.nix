{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghcjsHEAD" }:  # ghc802
with nixpkgs;
let 
ps = pkgs;
hs = ps.haskell.packages.${compiler};
hp = hs.override{
    overrides = new: old: {

      spiros = new.callPackage ~/spiros {};
      aeson = new.callPackage ./aeson {}; # git co bd9c2d10522fc18fe379f31444de07e0ab3f255d; cabal2nix .; 
      # git checkout tags/

      reflex = new.callPackage (fetchgit{
              url = https://github.com/reflex-frp/reflex;
              rev = "a8b925f891afb6895ef33a005dd32ed6a449aa9a";
              sha256 = "1znljvg111lms6134m420hf9fi4hbanlvpbpx8f792aa5qwahbg4"; # $ nix-prefetch-git 
            }) {};
      reflex-dom = new.callPackage (fetchgit{
              url = https://github.com/reflex-frp/reflex-dom;
              rev = "8c30dd6bdafa56875a5a29601de24bf1a2c21aa2";
              sha256 = "002i93pjw0p820dm8hh3qw3n6mqijnk1crgdldqzrqzzd03rlqsf"; 
            }) {};
      reflex-dom-contrib = new.callPackage (fetchgit{
              url = https://github.com/reflex-frp/reflex-dom-contrib;
              rev = "3a0a9bb3eeea330f6c20756dec09a43410395218";
              sha256 = "059wjc3jcgs6znvxkr1975g47crnl3rc7cydx637fhjdqpr6his5"; 
            }) {};

      ghcjs-dom = new.callPackage ({ mkDerivation, base, glib, gtk3, stdenv, text, transformers, webkitgtk3 }: mkDerivation {
          pname = "ghcjs-dom";
          version = "0.2.3.1";
          sha256 = "0fgfmhzlz960vvm2l8a441yv9nv95h6wz32815x71mbaskff7pnz";
          libraryHaskellDepends = [
            base text transformers
          ] ++ (if new.ghc.isGhcjs or false then with new; [
            ghcjs-prim ghc-prim ghcjs-base
          ] else [
            glib gtk3 webkitgtk3
          ]);
          preConfigure = ''
            sed -i 's/\(transformers .*\)<0.5/\1<0.6/' *.cabal
          '';
          description = "DOM library that supports both GHCJS and WebKitGTK";
          license = stdenv.lib.licenses.mit;
        }) {};


      # aeson = new.callPackage (fetchgit{
      #     url = "https://github.com/bos/aeson";
      #     rev = "bd9c2d10522fc18fe379f31444de07e0ab3f255d"; # tag 1.0.2.1
      #     sha256 = "0pjsjn5vi97gcfv2iai7mbw38r4jfqrkhgnhj5kpcim99dm8yk5k";
      # }) {}; # error: opening file ‘/nix/store/44qwjbkcck3j6pb75v0nsd1gpxqh1gcq-aeson-bd9c2d1/default.nix’: No such file or directory

# ghcjs-dom
# 0.2.3.1
# 1644ab2a058618ebbffefa12ee95cd7484169275

/*
      reflex = new.callPackage (fetchgit{
              url = https://github.com/;
              rev = "";
              sha256 = ""; 
            }) {};	    	    
*/

    };};
    locpkg = hp.callPackage ./default.nix { }; 
in locpkg.env

# { nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

# let

#   inherit (nixpkgs) pkgs;

#   f = import ./default.nix;
#   ps = {
#     spiros = ~/spiros; # absolute
#   };

#   haskellPackages = if compiler == "default"
#                        then pkgs.haskellPackages
#                        else pkgs.haskell.packages.${compiler};

#   drv = haskellPackages.callPackage f ps;

# in

#   if pkgs.lib.inNixShell then drv.env else drv
