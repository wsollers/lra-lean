import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/-- Tarski axiom 3 (congruence identity): if `xy ≡ zz` then `x = y` --
a degenerate ("zero-length") segment forces its endpoints to coincide. -/
axiom CongruenceIdentity (x y z : TarskiPoint)
    (xyCongZz : TarskiCongruent x y z z) : x = y

end LRA.EuclideanSpace
