{ mkDerivation, aeson, base, containers, deepseq, diagrams
, diagrams-reflex, Earley, hashable, lens, mtl, pipes, reflex
, reflex-dom, reflex-dom-contrib, semigroups, spiros, stdenv, text
, transformers
}:
mkDerivation {
  pname = "magic-card-search";
  version = "0.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base containers deepseq diagrams diagrams-reflex Earley
    hashable lens mtl pipes reflex reflex-dom reflex-dom-contrib
    semigroups spiros text transformers
  ];
  executableHaskellDepends = [ base ];
  homepage = "http://github.com/sboosali/magic-card-search#readme";
  description = "TODO";
  license = stdenv.lib.licenses.bsd3;
}
