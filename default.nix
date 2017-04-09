{ mkDerivation, base, deepseq, hashable, semigroups, spiros, stdenv
}:
mkDerivation {
  pname = "magic-card-search";
  version = "0.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base deepseq hashable semigroups spiros
  ];
  executableHaskellDepends = [ base ];
  homepage = "http://github.com/sboosali/magic-card-search#readme";
  description = "TODO";
  license = stdenv.lib.licenses.bsd3;
}
