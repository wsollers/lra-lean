import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-- Tarski axiom 2 (congruence transitivity): if `xy ≡ zw` and `xy ≡ uv`
then `zw ≡ uv`. -/
axiom CongruenceTransitivity (x y z w u v : TarskiPoint)
    (xyCongZw : TarskiCongruent x y z w) (xyCongUv : TarskiCongruent x y u v) :
    TarskiCongruent z w u v

end LRA.EuclideanSpace
