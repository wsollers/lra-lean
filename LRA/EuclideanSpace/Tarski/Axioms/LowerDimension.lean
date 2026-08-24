import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

/--
`LowerDimension` TODO

Predicate logic:

  (∀ n ∈ Nat), ∃ points ∈ Fin (n + 1) → TarskiPoint, AffinelyIndependent TarskiPoint n points end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (n : Nat), Exists fun points => sorry ((((((((((((((((`LRA.EuclideanSpace.Interface.Laws.num (instOfNatNat 448).1).num (instOfNatNat 2).1).num (instOfNatNat 448).1).num (instOfNatNat 7).1).num (instOfNatNat 2).1).num (instOfNatNat 7).1).str "_sorry").str "_@").str "LRA").str "EuclideanSpace").str "Interface").str "Laws").num (instOfNatNat 3528298125).1).str "_hygCtx").str "_hyg").num (instOfNatNat 22).1)

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
