import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

/--
`SegmentConstruction` TODO

Predicate logic:

  (∀ x y a b ∈ TarskiPoint), ∃ z ∈ TarskiPoint, TarskiBetween x y z ∧ TarskiCongruent y z a b end LRA.EuclideanSpace

Predicate logic (unfolded):

  ∀ (x y a b : LRA.EuclideanSpace.TarskiPoint), Exists fun z => (LRA.EuclideanSpace.TarskiBetween x y z ∧ LRA.EuclideanSpace.TarskiCongruent y z a b)

Logical form (Lean):

```lean
axiom SegmentConstruction (x y a b : TarskiPoint) :
    ∃ z : TarskiPoint, TarskiBetween x y z ∧ TarskiCongruent y z a b
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
axiom SegmentConstruction (x y a b : TarskiPoint) :
    ∃ z : TarskiPoint, TarskiBetween x y z ∧ TarskiCongruent y z a b

end LRA.EuclideanSpace
