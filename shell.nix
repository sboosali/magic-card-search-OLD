{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc802" }: 
with nixpkgs;
let 
ps = pkgs;
hs = ps.haskell.packages.${compiler};
hp = hs.override{
    overrides = new: old: {
      spiros = new.callPackage ~/spiros {};
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

