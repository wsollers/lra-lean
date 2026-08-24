import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`InnerPasch` TODO

Predicate logic:

  (∀ u v p q z ∈ TarskiPoint), ∃ x ∈ TarskiPoint, TarskiBetween u x z ∧ TarskiBetween q x v end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (u v p q z : LRA.EuclideanSpace.TarskiPoint), (LRA.EuclideanSpace.TarskiBetween u p v ∧ LRA.EuclideanSpace.TarskiBetween p q z) → Exists fun x => (LRA.EuclideanSpace.TarskiBetween u x z ∧ LRA.EuclideanSpace.TarskiBetween q x v)

Logical form (Lean):

```lean
axiom InnerPasch (u v p q z : TarskiPoint)
    (bupv : TarskiBetween u p v) (bpqz : TarskiBetween p q z) :
    ∃ x : TarskiPoint, TarskiBetween u x z ∧ TarskiBetween q x v
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
axiom InnerPasch (u v p q z : TarskiPoint)
    (bupv : TarskiBetween u p v) (bpqz : TarskiBetween p q z) :
    ∃ x : TarskiPoint, TarskiBetween u x z ∧ TarskiBetween q x v

end LRA.EuclideanSpace
