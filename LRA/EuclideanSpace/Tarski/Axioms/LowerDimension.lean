import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

/--
`LowerDimension` TODO

Predicate logic:

  ∀ (n : Nat), Exists fun points => LRA.EuclideanSpace.AffinelyIndependent LRA.EuclideanSpace.TarskiPoint n points

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    n : Nat
  Prove
    Exists fun points => sorry

Logical form (Lean):

```lean
axiom LowerDimension (n : Nat) :
    ∃ points : Fin (n + 1) → TarskiPoint,
      AffinelyIndependent TarskiPoint n points
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
axiom LowerDimension (n : Nat) :
    ∃ points : Fin (n + 1) → TarskiPoint,
      AffinelyIndependent TarskiPoint n points

end LRA.EuclideanSpace
