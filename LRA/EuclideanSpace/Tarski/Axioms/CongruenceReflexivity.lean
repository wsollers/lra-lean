import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-- Tarski axiom 1 (congruence reflexivity): `xy ≡ yx`. -/
axiom CongruenceReflexivity (x y : TarskiPoint) :
    TarskiCongruent x y y x

end LRA.EuclideanSpace
