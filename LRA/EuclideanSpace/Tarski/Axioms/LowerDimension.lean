import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

/-- Tarski axiom 8 (lower dimension, for a fixed `n`): there exist `n+1`
affinely independent points -- the space has dimension at least `n`.
Reuses the generic, `sorry`-deferred `AffinelyIndependent` from
`Interface.Laws` (applied at `TarskiPoint`) rather than a
separately-invented Tarski-specific version, so this axiom is vacuous
for the same documented reason, not a second independent gap. -/
axiom LowerDimension (n : ℕ) :
    ∃ points : Fin (n + 1) → TarskiPoint,
      AffinelyIndependent TarskiPoint n points

end LRA.EuclideanSpace
