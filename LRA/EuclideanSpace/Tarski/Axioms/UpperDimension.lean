import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

/-- Tarski axiom 9 (upper dimension, for a fixed `n`): every point's
position is determined by its distances to any `n+1` affinely
independent points -- the space has dimension at most `n`. Reuses the
generic, `sorry`-deferred predicates from `Interface.Laws`, for the same
reason `LowerDimension` does. -/
axiom UpperDimension (n : ℕ) (p : TarskiPoint) (points : Fin (n + 1) → TarskiPoint)
    (independent : AffinelyIndependent TarskiPoint n points) :
    CoincidesOrDeterminedByDistances TarskiPoint n p points

end LRA.EuclideanSpace
