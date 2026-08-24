import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

/--
`UpperDimension` TODO

Predicate logic:

  (∀ n ∈ Nat ∀ p ∈ TarskiPoint), (Fin (n + 1) → TarskiPoint) → CoincidesOrDeterminedByDistances TarskiPoint n p points end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (n : Nat) (p : LRA.EuclideanSpace.TarskiPoint) (points : Fin (instHAdd.hAdd n 1) → LRA.EuclideanSpace.TarskiPoint), LRA.EuclideanSpace.AffinelyIndependent LRA.EuclideanSpace.TarskiPoint n points → LRA.EuclideanSpace.CoincidesOrDeterminedByDistances LRA.EuclideanSpace.TarskiPoint n p points (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom UpperDimension (n : Nat) (p : TarskiPoint) (points : Fin (n + 1) → TarskiPoint)
    (independent : AffinelyIndependent TarskiPoint n points) :
    CoincidesOrDeterminedByDistances TarskiPoint n p points
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
axiom UpperDimension (n : Nat) (p : TarskiPoint) (points : Fin (n + 1) → TarskiPoint)
    (independent : AffinelyIndependent TarskiPoint n points) :
    CoincidesOrDeterminedByDistances TarskiPoint n p points

end LRA.EuclideanSpace
